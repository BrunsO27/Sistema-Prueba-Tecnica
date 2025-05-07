<template>
  <v-sheet border rounded>
    <v-data-table :headers="headers" :items="usuarios">
      <template v-slot:top>
        <v-toolbar flat>
          <v-toolbar-title>
            <v-icon color="medium-emphasis" icon="mdi-database" size="x-small" start></v-icon>

            Sistema CRUD de Usuarios
          </v-toolbar-title>

          <!-- Boton de login-->
          <v-btn
            class="me-2"
            prepend-icon="mdi-login"
            rounded="lg"
            text="Ingresar"
            border
            @click="irLogin"
          ></v-btn>

          <v-btn
            v-if="verificarAutenticacion()"
            class="me-2"
            prepend-icon="mdi-login"
            rounded="lg"
            text="Salir"
            border
            @click="logOut"
          ></v-btn>

          <!-- Boton de carga de data-->
          <v-btn
            class="me-2"
            prepend-icon="mdi-upload-circle"
            rounded="lg"
            text="Cargar Data"
            border
            @click="cargarData"
          ></v-btn>

          <!-- Boton de creacion de ususario-->
          <v-btn
            class="me-2"
            prepend-icon="mdi-plus"
            rounded="lg"
            text="Crear Usuario"
            border
            @click="add"
          ></v-btn>
        </v-toolbar>
      </template>

      <template v-slot:item.title="{ value }">
        <v-chip :text="value" border="thin opacity-25" prepend-icon="mdi-book" label>
          <template v-slot:prepend>
            <v-icon color="medium-emphasis"></v-icon>
          </template>
        </v-chip>
      </template>

      <template v-slot:item.acciones="{ item }">
        <div class="d-flex ga-2 justify-end">
          <v-icon
            color="medium-emphasis"
            icon="mdi-pencil"
            size="small"
            @click="edit(item.numCuenta)"
          ></v-icon>

          <v-icon
            color="medium-emphasis"
            icon="mdi-delete"
            size="small"
            @click="remove(item.numCuenta)"
          ></v-icon>
        </div>
      </template>
    </v-data-table>
  </v-sheet>

  <!-- Dialogo para editar -->
  <v-dialog v-model="dialog" max-width="500">
    <v-card
      :subtitle="`${isEditing ? 'Update' : 'Create'} your favorite book`"
      :title="`${isEditing ? 'Edit' : 'Add'} a Book`"
    >
      <template v-slot:text>
        <v-row>
          <v-col cols="12">
            <v-text-field v-model="record.title" label="Title"></v-text-field>
          </v-col>

          <v-col cols="12" md="6">
            <v-text-field v-model="record.author" label="Author"></v-text-field>
          </v-col>

          <v-col cols="12" md="6">
            <v-select
              v-model="record.genre"
              :items="['Fiction', 'Dystopian', 'Non-Fiction', 'Sci-Fi']"
              label="Genre"
            ></v-select>
          </v-col>

          <v-col cols="12" md="6">
            <v-number-input
              v-model="record.year"
              :max="adapter.getYear(adapter.date())"
              :min="1"
              label="Year"
            ></v-number-input>
          </v-col>

          <v-col cols="12" md="6">
            <v-number-input v-model="record.pages" :min="1" label="Pages"></v-number-input>
          </v-col>
        </v-row>
      </template>

      <v-divider></v-divider>

      <v-card-actions class="bg-surface-light">
        <v-btn text="Cancel" variant="plain" @click="dialog = false"></v-btn>

        <v-spacer></v-spacer>

        <v-btn text="Save" @click="save"></v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>

  <!-- Dialogo de advertencia -->
  <template
    ><v-dialog v-model="dialogAdvertencia" max-width="400">
      <v-card>
        <v-card-title class="text-h6"> Acceso Denegado </v-card-title>

        <v-card-text> Debes iniciar sesión para realizar esta acción. </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text="Cerrar" @click="dialogAdvertencia = false"></v-btn>
        </v-card-actions>
      </v-card> </v-dialog
  ></template>
</template>

<script>
import { ref, shallowRef, onMounted } from 'vue';
import { useDate } from 'vuetify';

export default {
  name: 'CrudView',
  data() {
    const adapter = useDate();
    return {
      dialog: false, // Estado inicial del diálogo
      isEditing: false,
      dialogAdvertencia: false,
      record: {
        numCuenta: '',
        nombre: '',
        fechaNacimiento: '',
        correo: '',
        password: '',
        telefono: '',
        estado: true,
      },
      mensaje: 'Componente Cargado',
      adapter,
      usuarios: [],
      headers: [
        { title: 'Número de Cuenta', key: 'numCuenta', align: 'start' },
        { title: 'Nombre', key: 'nombre', align: 'start' },
        { title: 'Fecha de Nacimiento', key: 'fechaNacimiento', align: 'center' },
        { title: 'Correo', key: 'correo', align: 'start' },
        { title: 'Contraseña', key: 'password', align: 'start' },
        { title: 'Teléfono', key: 'telefono', align: 'center' },
        { title: 'Estado', key: 'estado', align: 'center' },
        { title: '', key: 'acciones', align: 'end' },
      ],
    };
  },
  methods: {
    verificarAutenticacion() {
      const token = sessionStorage.getItem('token');
      return !!token; // true si hay token
    },
    logOut() {
      sessionStorage.removeItem('token');
      this.$router.replace('/');
    },
    irLogin() {
      if (this.verificarAutenticacion()) {
        this.$router.go('/');
      } else {
        this.$router.push('/login');
      }

    },
    cargarData() {
      if (!this.verificarAutenticacion()) {
        this.dialogAdvertencia = true;
        return;
      }

      
    },
    add() {
      if (!this.verificarAutenticacion()) {
        this.dialogAdvertencia = true;
        return;
      }

      this.isEditing = false;
      this.record = {
        numCuenta: '',
        nombre: '',
        fechaNacimiento: '',
        correo: '',
        password: '',
        telefono: '',
        estado: true,
      };
      this.dialog = true;
    },
    edit(numCuenta) {
      this.isEditing = true;

      const busqueda = this.usuarios.find((usuario) => usuario.numCuenta === numCuenta);

      this.record = {
        numCuenta: busqueda.numCuenta,
        nombre: busqueda.nombre,
        fechaNacimiento: busqueda.fechaNacimiento,
        correo: busqueda.correo,
        password: busqueda.password,
        telefono: busqueda.telefono,
        estado: busqueda.estado,
      };

      this.dialog = true;
    },
    save() {
      if (this.isEditing) {
        const index = this.books.findIndex((book) => book.id === this.record.id);
        this.books[index] = this.record;
      } else {
        this.record.id = this.books.length + 1;
        this.books.push(this.record);
      }

      this.dialog = false;
    },
    remove(id) {
      const index = this.books.findIndex((book) => book.id === id);
      this.books.value.splice(index, 1);
    },
  },
};
</script>

<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->
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
            v-if="!verificarAutenticacion()"
            class="me-2"
            prepend-icon="mdi-login"
            rounded="lg"
            text="Ingresar"
            border
            @click="irLogin"
          ></v-btn>

          <!-- Boton de logout-->
          <v-btn
            v-if="verificarAutenticacion()"
            class="me-2"
            prepend-icon="mdi-login"
            rounded="lg"
            text="Salir"
            border
            @click="logOut"
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

  <!-- Boton de carga de data-->
  <v-row justify="center" class="text-center">
    <v-col>
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
    </v-col>
  </v-row>

  <!-- Dialogo para editar o crear-->
  <v-dialog v-model="dialog" max-width="500">
    <v-card
      :subtitle="`${isEditing ? 'Actualiza' : 'Crea'} a tu usuario`"
      :title="`${isEditing ? 'Edita' : 'Añade'} a un usuario`"
    >
      <template v-slot:text>
        <v-row>
          <v-col cols="12">
            <v-text-field
              prepend-icon="mdi-numeric"
              v-model="record.numCuenta"
              label="Número de Cuneta"
            ></v-text-field>
          </v-col>

          <v-col cols="12">
            <v-text-field
              prepend-icon="mdi-account-circle"
              v-model="record.nombre"
              label="Nombre Completo"
            ></v-text-field>
          </v-col>

          <v-col cols="12" md="6">
            <v-menu
              v-model="menu"
              :close-on-content-click="false"
              transition="scale-transition"
              offset-y
            >
              <template v-slot:activator="{ props }">
                <v-text-field
                  v-model="record.fechaNacimiento"
                  label="Fecha de nacimiento"
                  prepend-icon="mdi-calendar"
                  readonly
                  v-bind="props"
                ></v-text-field>
              </template>
              <v-date-picker
                v-model="record.fechaNacimiento"
                @update:model-value="formatFechaNacimiento"
              ></v-date-picker>
            </v-menu>
          </v-col>

          <v-col cols="12" md="6">
            <v-text-field
              type="tel"
              prepend-icon="mdi-phone"
              v-model="record.telefono"
              label="Numero de teléfono"
            ></v-text-field>
          </v-col>

          <v-col cols="12">
            <v-text-field
              type="email"
              prepend-icon="mdi-email"
              v-model="record.correo"
              label="Correo electronico"
            ></v-text-field>
          </v-col>

          <v-col cols="12">
            <v-text-field
              type="password"
              prepend-icon="mdi-key"
              v-model="record.password"
              label="Contraseña"
            ></v-text-field>
          </v-col>
        </v-row>
      </template>

      <v-divider></v-divider>

      <v-card-actions class="bg-surface-light">
        <v-btn text="Cancelar" variant="plain" @click="dialog = false"></v-btn>

        <v-spacer></v-spacer>

        <v-btn text="Guardar" @click="save"></v-btn>
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
import { usuariosApi } from '@/api/UsuariosApi';
import { useDate } from 'vuetify';

export default {
  name: 'CrudView',
  data() {
    const adapter = useDate();
    return {
      dialog: false,
      isEditing: false,
      dialogAdvertencia: false,
      menu: false,
      record: {
        numCuenta: '',
        nombre: '',
        fechaNacimiento: '',
        correo: '',
        password: '',
        telefono: '',
        estado: true,
      },
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
      return !!token;
    },
    logOut() {
      sessionStorage.removeItem('token');
      this.usuarios = [];
      this.$router.replace({ name: 'Crud' });
    },
    irLogin() {
      if (this.verificarAutenticacion()) {
        this.$router.go('/');
      } else {
        this.$router.push('/login');
      }
    },
    async cargarData() {
      if (!this.verificarAutenticacion()) {
        this.dialogAdvertencia = true;
        return;
      }

      try {
        const respuesta = await usuariosApi.get('/usuario');
        this.usuarios = respuesta.data.usuarios;
      } catch (error) {
        console.error(error);
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
    async save() {
      if (this.isEditing) {
        const index = this.usuarios.findIndex((usuario) => usuario.numCuenta === this.record.numCuenta);
        this.usuarios[index] = this.record;

        try {
          await usuariosApi.put(`/usuario/${this.record.numCuenta}`, this.record);
        } catch (error) {
          console.error(error);
        }

      } else {
        try {
          this.usuarios.push(this.record);
          await usuariosApi.post('/usuario', this.record);
        } catch (error) {
          console.error(error);
        }
      }

      this.dialog = false;
    },
    async remove(numCuenta) {
      const index = this.usuarios.findIndex((usuario) => usuario.numCuenta === numCuenta);

      try {
        await usuariosApi.delete(`/usuario/${numCuenta}`);
        this.usuarios.splice(index, 1);
      } catch (error) {
        console.error(error);
      }

      this.books.value.splice(index, 1);
    },
    formatFechaNacimiento(fecha) {
      if (fecha) {
        const date = new Date(fecha);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0'); // Mes en formato 2 dígitos
        const day = String(date.getDate()).padStart(2, '0'); // Día en formato 2 dígitos
        this.record.fechaNacimiento = `${year}-${month}-${day}`; // Formato YYYY-MM-DD
      }
      this.menu = false; // Cierra el menú después de seleccionar la fecha
    },
  },
};
</script>

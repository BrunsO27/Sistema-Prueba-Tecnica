<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->
<template>
  <v-sheet border rounded>
    <!-- Tabal de usuarios -->
    <TablaCrud
      :usuarios="usuarios"
      :headers="headers"
      @cargar-data="cargarData"
      @crear-usuario="add"
      @editar-usuario="edit"
      @eliminar-usuario="remove"
    />
  </v-sheet>

  <v-row justify="center" class="text-center">
    <v-col>
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
    </v-col>
  </v-row>

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
import TablaCrud from '../components/TablaCrud.vue';

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
  components: {
    TablaCrud,
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
      console.log('Método add ejecutado');

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
      console.log('Cancel clicked');
    },
    edit(numCuenta) {
      console.log('Método edit ejecutado con numCuenta:', numCuenta);
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
      console.log('Cancel clicked');
    },
    async save() {
      if (this.isEditing) {
        const index = this.usuarios.findIndex(
          (usuario) => usuario.numCuenta === this.record.numCuenta,
        );
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
  },
};
</script>

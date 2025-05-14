<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->
<template>
  <v-sheet border rounded>
    <!-- Tabal de usuarios -->
    <TablaUsuarios :usuarios="usuarios" :headers="headers" :terminoSesion="terminoSesion" />
  </v-sheet>

  <v-row justify="center" class="text-center">
    <v-col>

      <!-- Boton de logout-->
      
    </v-col>
  </v-row>
</template>

<script>
import verificarAutenticacion from '@/modules/auth/actions/VerifiacarAutuenticacion';
import TablaUsuarios from '../components/TablaUsuarios.vue';

export default {
  name: 'CrudView',
  data() {
    return {
      verificacion: verificarAutenticacion(),
      terminoSesion: false,
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
    TablaUsuarios,
  },
  methods: {
    verificarAutenticacion,
  },
  components: {
    TablaUsuarios,
  },
};
</script>

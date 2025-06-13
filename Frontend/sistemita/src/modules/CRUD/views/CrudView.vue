<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->
<template>
  <v-sheet border rounded>
    <!-- Tabal de usuarios -->
    <TablaUsuarios :usuarios="usuarios" :headers="headers" />
  </v-sheet>
</template>

<script setup>
import { ref } from 'vue';
import TablaUsuarios from '../components/TablaUsuarios.vue';

// Script en sintaxis de Options API

// export default {
//   name: 'CrudView',
//   data() {
//     return {
//       usuarios: [],
//       headers: [
//         { title: 'Número de Cuenta', key: 'numCuenta', align: 'start' },
//         { title: 'Nombre', key: 'nombre', align: 'start' },
//         { title: 'Fecha de Nacimiento', key: 'fechaNacimiento', align: 'center' },
//         { title: 'Correo', key: 'correo', align: 'start' },
//         { title: 'Contraseña', key: 'password', align: 'start' },
//         { title: 'Teléfono', key: 'telefono', align: 'center' },
//         { title: 'Estado', key: 'estado', align: 'center' },
//         { title: 'Acciones', key: 'acciones', align: 'end' },
//       ],
//     };
//   },
//   components: {
//     TablaUsuarios,
//   },
// };

// Script en sintaxis de Composition API

const usuarios = ref([]);
const headers = ref([
  { title: 'Número de Cuenta', key: 'numCuenta', align: 'start' },
  { title: 'Nombre', key: 'nombre', align: 'start' },
  { title: 'Fecha de Nacimiento', key: 'fechaNacimiento', align: 'center' },
  { title: 'Correo', key: 'correo', align: 'start' },
  { title: 'Contraseña', key: 'password', align: 'start' },
  { title: 'Teléfono', key: 'telefono', align: 'center' },
  { title: 'Estado', key: 'estado', align: 'center' },
  { title: 'Acciones', key: 'acciones', align: 'end' },
]);
</script>

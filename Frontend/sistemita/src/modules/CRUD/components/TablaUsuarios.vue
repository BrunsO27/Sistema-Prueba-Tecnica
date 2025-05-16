<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->

<template>
  <v-sheet border rounded>
    <v-data-table :headers="headers" :items="localUsuarios">
      <template v-slot:top>
        <v-toolbar flat>
          <v-toolbar-title>
            <v-icon color="medium-emphasis" icon="mdi-database" size="x-small" start></v-icon>

            Tabla de Usuarios
          </v-toolbar-title>

          <!-- Boton de carga de data-->
          <v-btn
            class="me-2"
            prepend-icon="mdi-upload-circle"
            rounded="lg"
            text="Cargar Data"
            border
            @click="obtenerData"
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

          <v-btn
            v-if="verificacion"
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

  <!-- Dialogo para editar/crar usuarios-->
  <FormularioUsuarios
    :dialog="dialog"
    :record.sync="record"
    :isEditing="isEditing"
    @update:dialog="dialog = $event"
    @save="save"
    @close="dialog = false"
  />
</template>

<script>
import FormularioUsuarios from './FormularioUsuarios.vue';

import usuario from '@/models/Usuario';

import verificarAutenticacion from '@/modules/auth/actions/VerifiacarAutuenticacion';
import {cargarData, 
        obtenerUsuarios,
        guardarUsuario, 
        eliminarUsuario, 
      } from '../actions/index';
import logOut from '@/modules/auth/actions/LogOut';      

export default {
  name: 'TablaUsuarios',
  props: {
    headers: {
      type: Array,
      default: () => [],
    },
    usuarios: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      dialog: false,
      isEditing: false,
      dialogAdvertencia: false,
      verificacion: verificarAutenticacion(),
      localUsuarios: [],
      record: usuario(),
    };
  },
  methods: {
    verificarAutenticacion,
    logOut,
    async obtenerData() {
      this.localUsuarios = await cargarData();
    },
    add() {
      this.isEditing = false;
      this.record = usuario();
      this.dialog = true;
    },
    edit(numCuenta) {
      this.isEditing = true;

      this.record = obtenerUsuarios(this.localUsuarios, numCuenta);

      this.dialog = true;
    },
    async save(localRecord) {

      await guardarUsuario(this.localUsuarios, localRecord, this.isEditing);

      this.dialog = false;
    },
    async remove(numCuenta) {
      await eliminarUsuario(this.localUsuarios, numCuenta);      
    },
  },
  components: {
    FormularioUsuarios,
  },
};
</script>

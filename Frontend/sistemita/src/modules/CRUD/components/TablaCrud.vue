<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->

<template>
  <v-data-table :headers="headers" :items="usuarios">
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>
          <v-icon color="medium-emphasis" icon="mdi-database" size="x-small" start></v-icon>
          Sistema CRUD de Usuarios
        </v-toolbar-title>

        <!-- Botón de carga de data -->
        <v-btn
          class="me-2"
          prepend-icon="mdi-upload-circle"
          rounded="lg"
          text="Cargar Data"
          border
          @click="$emit('cargar-data')"
        ></v-btn>

        <!-- Botón de creación de usuario -->
        <v-btn
          class="me-2"
          prepend-icon="mdi-plus"
          rounded="lg"
          text="Crear Usuario"
          border
          @click="$emit('crear-usuario')"
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
          @click="$emit('editar-usuario', item.numCuenta)"
        ></v-icon>
        <v-icon
          color="medium-emphasis"
          icon="mdi-delete"
          size="small"
          @click="$emit('eliminar-usuario', item.numCuenta)"
        ></v-icon>
      </div>
    </template>
  </v-data-table>

  <!-- Dialogo para editar o crear-->
  <FormCrud 
    :dialog="dialog" 
    :isEditing="isEditing" 
    :record="record" 
    @save="save" />

</template>

<script>
import FormCrud from './FormCrud.vue';

export default {
  name: 'TablaCrud',
  props: {
    usuarios: {
      type: Array,
      required: true,
    },
    headers: {
      type: Array,
      required: true,
    },
  },
  components: {
    FormCrud,
  },
  
};
</script>

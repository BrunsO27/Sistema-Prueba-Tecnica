<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->

<template>
  <v-sheet border rounded>
    <v-data-table :headers="headers" :items="localUsuarios">
      <template v-slot:top>
        <v-toolbar flat>
          <v-toolbar-title>
            <v-icon color="medium-emphasis" icon="mdi-database" size="x-small" start></v-icon>

            Sistema CRUD de Usuarios
          </v-toolbar-title>

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

  <!-- Dialogo para editar/crar usuarios-->
  <FormularioUsuarios
    :dialog="dialog"
    :record.sync="record"
    :isEditing="isEditing"
    @update:dialog="dialog = $event"
    @save="save"
    @close="dialog = false"
  />

  <!-- Dialogo de Advertencia -->
  <DialogoAdvertencia :dialogAdvertencia="dialogAdvertencia" @close="dialogAdvertencia = false" />
</template>

<script>
import verificarAutenticacion from '@/modules/auth/actions/VerifiacarAutuenticacion';
import DialogoAdvertencia from '@/modules/auth/components/DialogoAdvertencia.vue';
import FormularioUsuarios from './FormularioUsuarios.vue';
import { usuariosApi } from '@/api/UsuariosApi';

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
    terminoSesion: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      dialog: false,
      isEditing: false,
      dialogAdvertencia: false,
      localUsuarios: [],
      record: {
        numCuenta: '',
        nombre: '',
        fechaNacimiento: '',
        correo: '',
        password: '',
        telefono: '',
        estado: true,
      },
    };
  },
  methods: {
    verificarAutenticacion,
    async cargarData() {
      if (!verificarAutenticacion()) {
        this.dialogAdvertencia = true;
        return;
      }
      try {
        const respuesta = await usuariosApi.get('/usuario');
        this.localUsuarios = respuesta.data.usuarios;
      } catch (error) {
        console.error(error);
      }
    },
    add() {
      if (!verificarAutenticacion()) {
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

      const busqueda = this.localUsuarios.find((usuario) => usuario.numCuenta === numCuenta);

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
        const index = this.localUsuarios.findIndex(
          (usuario) => usuario.numCuenta === this.record.numCuenta,
        );

        try {
          await usuariosApi.put(`/usuario/${this.record.numCuenta}`, this.record);
          this.localUsuarios[index] = this.record;
        } catch (error) {
          console.error(error);
        }
      } else {
        try {
          this.localUsuarios.push(this.record);
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
        this.localUsuarios.splice(index, 1);
      } catch (error) {
        console.error(error);
      }

      this.localUsuarios.value.splice(index, 1);
    },
  },
  watch: {
    terminoSesion(newValue) {
      if (newValue) {
        this.localUsuarios = [];
      }
    },
  },
  components: {
    FormularioUsuarios,
    DialogoAdvertencia,
  },
};
</script>

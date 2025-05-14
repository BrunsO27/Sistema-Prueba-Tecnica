<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->

<template>
  <v-dialog :model-value="dialog" max-width="500" @update:model-value="$emit('update:dialog', $event)">
    <v-card
      :subtitle="`${isEditing ? 'Actualiza' : 'Crea'} a tu usuario`"
      :title="`${isEditing ? 'Edita' : 'Añade'} a un usuario`"
    >
      <template v-slot:text>
        <v-row>
          <v-col cols="12">
            <v-text-field
              prepend-icon="mdi-numeric"
              v-model="localRecord.numCuenta"
              label="Número de Cuenta"
            ></v-text-field>
          </v-col>

          <v-col cols="12">
            <v-text-field
              prepend-icon="mdi-account-circle"
              v-model="localRecord.nombre"
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
                  v-model="localRecord.fechaNacimiento"
                  label="Fecha de nacimiento"
                  prepend-icon="mdi-calendar"
                  readonly
                  v-bind="props"
                ></v-text-field>
              </template>
              <v-date-picker
                v-model="localRecord.fechaNacimiento"
                @update:model-value="formatFechaNacimiento"
              ></v-date-picker>
            </v-menu>
          </v-col>

          <v-col cols="12" md="6">
            <v-text-field
              type="tel"
              prepend-icon="mdi-phone"
              v-model="localRecord.telefono"
              label="Numero de teléfono"
            ></v-text-field>
          </v-col>

          <v-col cols="12">
            <v-text-field
              type="email"
              prepend-icon="mdi-email"
              v-model="localRecord.correo"
              label="Correo electronico"
            ></v-text-field>
          </v-col>

          <v-col cols="12">
            <v-text-field
              type="password"
              prepend-icon="mdi-key"
              v-model="localRecord.password"
              label="Contraseña"
            ></v-text-field>
          </v-col>
        </v-row>
      </template>

      <v-divider></v-divider>

      <v-card-actions class="bg-surface-light">
        <v-btn text="Cancelar" variant="plain" @click="$emit('update:dialog', false)"></v-btn>

        <v-spacer></v-spacer>

        <v-btn text="Guardar" @click="save"></v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  name: 'FormularioUsuarios',
  props: {
    dialog: {
      type: Boolean,
      default: false,
    },
    isEditing: {
      type: Boolean,
      default: false,
    },
    record: {
      type: Object,
      default: () => ({
        numCuenta: '',
        nombre: '',
        fechaNacimiento: '',
        correo: '',
        password: '',
        telefono: '',
        estado: true,
      }),
    },
  },
  data() {
    return {
      menu: false,
      localRecord: { ...this.record},
    };
  },
  methods: {
    save() {
      this.$emit('save', this.localRecord);
      this.$emit('update:dialog', false)
    },
    formatFechaNacimiento(fecha) {
      if (fecha) {
        const date = new Date(fecha);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0'); // Mes en formato 2 dígitos
        const day = String(date.getDate()).padStart(2, '0'); // Día en formato 2 dígitos
        this.localRecord.fechaNacimiento = `${year}-${month}-${day}`; // Formato YYYY-MM-DD
      }
      this.menu = false; // Cierra el menú después de seleccionar la fecha
    },
  },
  watch: {
    record: {
      handler(newRecord) {
        this.localRecord = { ...newRecord }; // Actualiza localRecord cuando record cambie
      },
      deep: true, // Observa cambios profundos en el objeto
    },
  },  
  emits: [
    'update:dialog',
    'save',
  ]
};
</script>

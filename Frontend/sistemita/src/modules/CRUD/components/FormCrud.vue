<template>
  <v-dialog :value="dialog" max-width="500">
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
              label="Número de Teléfono"
            ></v-text-field>
          </v-col>
          <v-col cols="12">
            <v-text-field
              type="email"
              prepend-icon="mdi-email"
              v-model="localRecord.correo"
              label="Correo Electrónico"
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
              label="Número de Teléfono"
            ></v-text-field>
          </v-col>
          <v-col cols="12">
            <v-text-field
              type="email"
              prepend-icon="mdi-email"
              v-model="localRecord.correo"
              label="Correo Electrónico"
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
              label="Número de Teléfono"
            ></v-text-field>
          </v-col>
          <v-col cols="12">
            <v-text-field
              type="email"
              prepend-icon="mdi-email"
              v-model="localRecord.correo"
              label="Correo Electrónico"
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
      <v-card-actions>
        <v-btn text="Cancelar" @click="cancel"></v-btn>
        <v-spacer></v-spacer>
        <v-btn text="Guardar" @click="save"></v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    dialog: Boolean,
    isEditing: Boolean,
    record: Object,
  },
  data() {
    return {
      localRecord: { ...this.record }, // Copia local de record
      menu: false,
    };
  },
  watch: {
    record: {
      handler(newRecord) {
        this.localRecord = { ...newRecord }; // Actualiza localRecord cuando cambie record
      },
      formatFechaNacimiento(fecha) {
        if (fecha) {
          const date = new Date(fecha);
          const year = date.getFullYear();
          const month = String(date.getMonth() + 1).padStart(2, '0');
          const day = String(date.getDate()).padStart(2, '0');
          this.localRecord.fechaNacimiento = `${year}-${month}-${day}`;
        }
        this.menu = false;
      },
      deep: true,
    },
    formatFechaNacimiento(fecha) {
      if (fecha) {
        const date = new Date(fecha);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        this.localRecord.fechaNacimiento = `${year}-${month}-${day}`;
      }
      this.menu = false;
    },
  },
  methods: {
    formatFechaNacimiento(fecha) {
      if (fecha) {
        const date = new Date(fecha);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        this.localRecord.fechaNacimiento = `${year}-${month}-${day}`;
      }
      this.menu = false;
    },
    save() {
      this.$emit('save', this.localRecord); // Emite el evento save con los datos del formulario
    },
    cancel() {
      console.log('Cancel clicked'); // Depuración
      this.$emit('close'); // Emite un evento para cerrar el diálogo
    },
  },
};
</script>

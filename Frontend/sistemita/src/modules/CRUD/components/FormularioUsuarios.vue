<!-- eslint-disable no-unused-vars -->
<!-- eslint-disable vue/no-deprecated-v-bind-sync -->
<!-- eslint-disable vue/valid-v-slot -->
<!-- eslint-disable @typescript-eslint/no-unused-vars -->

<template>
  <v-dialog
    :model-value="dialog"
    max-width="1000"
    @update:model-value="$emit('update:dialog', $event)"
  >
    <v-card
      :subtitle="`${isEditing ? 'Actualiza' : 'Crea'} a tu usuario`"
      :title="`${isEditing ? 'Edita' : 'Añade'} a un usuario`"
    >
      <template v-slot:text>
        <v-form ref="formRef" v-model="formValid" validate-on="input">
          <v-row>
            <v-col cols="12">
              <v-text-field
                prepend-icon="mdi-numeric"
                :model-value="localRecord.numCuenta"
                @update:model-value="localRecord.numCuenta = $event"
                label="Número de Cuenta"
                :rules="[
                  rules.validarCampoVacio,
                  rules.validarNumeros,
                  rules.validarLongitudMaxima(9),
                ]"
                validate-on="input"
                persistent-hint
                counter="9"
              />
            </v-col>

            <v-col cols="12">
              <v-text-field
                prepend-icon="mdi-account-circle"
                v-model="localRecord.nombre"
                label="Nombre Completo"
                :rules="[rules.validarCampoVacio]"
                validate-on="input"
                persistent-hint
                counter="200"
              />
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
                    :rules="[rules.validarCampoVacio]"
                    validate-on="input"
                    persistent-hint
                  />
                </template>
                <v-date-picker
                  v-model="localRecord.fechaNacimiento"
                  @update:model-value="formatFechaNacimiento"
                />
              </v-menu>
            </v-col>

            <v-col cols="12" md="6">
              <v-text-field
                type="tel"
                prepend-icon="mdi-phone"
                v-model="localRecord.telefono"
                label="Número de teléfono"
                :rules="[
                  rules.validarCampoVacio,
                  rules.validarNumeros,
                  rules.validarLongitudMaxima(10),
                  rules.validarLongitudMinima(10),
                ]"
                validate-on="input"
                persistent-hint
                counter="10"
              />
            </v-col>

            <v-col cols="12">
              <v-text-field
                type="email"
                prepend-icon="mdi-email"
                v-model="localRecord.correo"
                label="Correo electrónico"
                :rules="[rules.validarCampoVacio, rules.validarCorreo]"
                validate-on="input"
                persistent-hint
                counter="200"
              />
            </v-col>

            <v-col cols="12">
              <v-text-field
                type="password"
                prepend-icon="mdi-key"
                v-model="localRecord.password"
                label="Contraseña"
                :rules="[
                  rules.validarCampoVacio,
                  rules.validarPassword,
                  rules.validarLongitudMinima(8),
                ]"
                validate-on="input"
                counter="255"
                persistent-hint
              />
            </v-col>
          </v-row>
        </v-form>
      </template>

      <v-divider></v-divider>

      <v-card-actions class="bg-surface-light">
        <v-btn text="Cancelar" variant="plain" @click="$emit('update:dialog', false)" />
        <v-spacer />
        <v-btn text="Guardar" @click="save" :disabled="!formValid" />
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script setup>
//Script usando sintaxis de Options API

// import {
//   validarCampoVacio,
//   validarCorreo,
//   validarPassword,
//   validarNumeros,
//   validarLongitudMaxima,
//   validarLongitudMinima,
// } from '@/modules/Commun/rules/Rules';

// export default {
//   name: 'FormularioUsuarios',
//   props: {
//     dialog: {
//       type: Boolean,
//       default: false,
//     },
//     isEditing: {
//       type: Boolean,
//       default: false,
//     },
//     record: {
//       type: Object,
//       default: () => ({
//         numCuenta: '',
//         nombre: '',
//         fechaNacimiento: '',
//         correo: '',
//         password: '',
//         telefono: '',
//         estado: true,
//       }),
//     },
//   },
//   data() {
//     return {
//       menu: false,
//       form: false,
//       localRecord: { ...this.record },
//       rules: {
//         validarCampoVacio,
//         validarCorreo,
//         validarPassword,
//         validarNumeros,
//         validarLongitudMaxima,
//         validarLongitudMinima,
//       },
//     };
//   },
//   methods: {
//     save() {
//       if (!this.$refs.form.validate()) return;

//       this.$emit('save', this.localRecord);
//       this.$emit('update:dialog', false);
//     },
//     formatFechaNacimiento(fecha) {
//       if (fecha) {
//         const date = new Date(fecha);
//         const year = date.getFullYear();
//         const month = String(date.getMonth() + 1).padStart(2, '0'); // Mes en formato 2 dígitos
//         const day = String(date.getDate()).padStart(2, '0'); // Día en formato 2 dígitos
//         this.localRecord.fechaNacimiento = `${year}-${month}-${day}`; // Formato YYYY-MM-DD
//       }
//       this.menu = false; // Cierra el menú después de seleccionar la fecha
//     },
//   },
//   watch: {
//     record: {
//       handler(newRecord) {
//         this.localRecord = { ...newRecord }; // Actualiza localRecord cuando record cambie
//       },
//       deep: true, // Observa cambios profundos en el objeto
//     },
//   },
//   emits: ['update:dialog', 'save'],
// };

// Script usando sintaxis de Composition API
import { ref, watch } from 'vue';
import {
  validarCampoVacio,
  validarCorreo,
  validarPassword,
  validarNumeros,
  validarLongitudMaxima,
  validarLongitudMinima,
} from '@/modules/Commun/rules/Rules';

const emit = defineEmits(['update:dialog', 'save']);
const props = defineProps({
  dialog: Boolean,
  isEditing: Boolean,
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
});

const formRef = ref(null);
const formValid = ref(false);
const menu = ref(false);
const localRecord = ref({ ...props.record });

const rules = {
  validarCampoVacio,
  validarCorreo,
  validarPassword,
  validarNumeros,
  validarLongitudMaxima,
  validarLongitudMinima,
};

watch(
  () => props.record,
  (newRecord) => {
    localRecord.value = { ...newRecord };
  },
  { deep: true, immediate: true }
);

function formatFechaNacimiento(fecha) {
  if (fecha) {
    const date = new Date(fecha);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    localRecord.value.fechaNacimiento = `${year}-${month}-${day}`;
  }
  menu.value = false;
}

function save() {
  if (!formRef.value?.validate()) return;
  emit('save', localRecord.value);
  emit('update:dialog', false);
}
</script>

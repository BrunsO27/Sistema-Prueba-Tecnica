<template>
  <v-container class="fill-height d-flex align-center justify-center">
    <!-- Aumento del max-width y ajusto la altura de la tarjeta -->
    <v-card class="pa-6" max-width="600" elevation="10">
      <v-card-title class="text-h5 text-center">Iniciar sesión</v-card-title>
      <v-card-text>
        <!-- Formulario con 100% de ancho para ocupar todo el espacio disponible -->
        <v-form @submit.prevent="accder">
          <v-row>
            <!-- Primer campo de texto para el correo -->
            <v-col cols="12" sm="12" md="12">
              <v-text-field
                v-model="autenticacion"
                label="Correo electrónico/Num. de Cuenta"
                type="text"
                prepend-inner-icon="mdi-account-circle"
                required
                class="mb-4"
              ></v-text-field>
            </v-col>

            <!-- Segundo campo de texto para la contraseña -->
            <v-col cols="12" sm="12" md="12">
              <v-text-field
                v-model="password"
                label="Contraseña"
                type="password"
                prepend-inner-icon="mdi-lock"
                required
                class="mb-4"
              ></v-text-field>
            </v-col>

            <v-col cols="12">
              <v-checkbox v-model="rememberMe" label="Recuérdame" color="primary"></v-checkbox>
            </v-col>

            <!-- Botón de envío de formulario -->
            <v-col cols="12">
              <v-btn type="submit" color="primary" block> Entrar </v-btn>
            </v-col>
          </v-row>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>

  <template>
    <v-snackbar v-model="snackbar" :timeout="4000" color="red" location="top center">
      {{ snackbarMessage }}
    </v-snackbar>
  </template>
</template>

<script setup>
import login from '../actions/LogIn';
import recuperarCredenciales from '../actions/RecuperarCredenciales';

// Script en sintaxis de Options API

// export default {
//   name: 'LoginView',
//   data() {
//     return {
//       autenticacion: '',
//       password: '',
//       snackbar: false,
//       snackbarMessage: '',
//       rememberMe: false,
//     };
//   },
//   methods: {
//     async accder() {
//       const exito = await login(this.autenticacion, this.password, this.rememberMe);
//       if (exito.accedio) {
//         this.$router.push({ name: 'Crud' });
//       } else {
//         this.snackbarMessage = exito.mensajeError;
//         console.log(this.snackbarMessage);
//         this.snackbar = true;
//       }
//     },
//   },
//   mounted() {
//     const credenciales = recuperarCredenciales();

//     this.autenticacion = credenciales.autenticacion;
//     this.password = credenciales.password;
//     this.rememberMe = credenciales.rememberMe;
//   },
// };

// Script en sitaxis de Composition API

import { ref, onMounted} from 'vue';
import { useRouter } from 'vue-router'

const autenticacion = ref('');
const password = ref('');
const snackbar = ref(false);
const snackbarMessage = ref('');
const rememberMe = ref(false);

const router = useRouter();;

const accder = async () => {
  const exito = await login(autenticacion.value, password.value, rememberMe.value);
  if (exito.accedio) {
    router.push({ name: 'Crud'});
  } else {
    snackbarMessage.value = exito.mensajeError;
    console.log(snackbarMessage.value);
    snackbar.value = true;
  }
}

onMounted(() => {
  const credenciales = recuperarCredenciales();

  autenticacion.value = credenciales.autenticacion;
  password.value = credenciales.password;
  rememberMe.value = credenciales.rememberMe;
})



</script>

<template>
  <v-container class="fill-height d-flex align-center justify-center">
    <!-- Aumento del max-width y ajusto la altura de la tarjeta -->
    <v-card class="pa-6" max-width="600" elevation="10">
      <v-card-title class="text-h5 text-center">Iniciar sesión</v-card-title>
      <v-card-text>
        <!-- Formulario con 100% de ancho para ocupar todo el espacio disponible -->
        <v-form @submit.prevent="login">
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
              <v-checkbox
                v-model="rememberMe"
                label="Recuérdame"
                color="primary"
              ></v-checkbox>
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

<script>
import { usuariosApi } from '@/api/UsuariosApi';

export default {
  name: 'LoginView',
  data() {
    return {
      autenticacion: '',
      password: '',
      snackbar: false,
      snackbarMessage: '',
      rememberMe: false,
    };
  },
  methods: {
    async login() {
      try {
        const respuesta = await usuariosApi.post('/auth/login', {
          autenticacion: this.autenticacion,
          password: this.password,
        })

        const token = respuesta.data.token;

        if (this.rememberMe) {
          localStorage.setItem('autenticacion', this.autenticacion);
          localStorage.setItem('password', this.password);
        }

        sessionStorage.setItem('token', token);

        this.$router.push({name: 'Crud'});
      } catch (error) {
        this.snackbarMessage = error.response?.data?.msg || 'Error al iniciar sesión';
        this.snackbar = true;
        console.error(error);
      }
    }
  },

  mounted() {
    const storedAutenticacion = localStorage.getItem('autenticacion');
    const storedPassword = localStorage.getItem('password');

    if (storedAutenticacion && storedPassword) {
      this.autenticacion = storedAutenticacion;
      this.password = storedPassword;
      this.rememberMe = true;
    }
  }
};
</script>

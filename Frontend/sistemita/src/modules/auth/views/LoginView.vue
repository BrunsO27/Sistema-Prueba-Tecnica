<template>
  <v-container class="fill-height d-flex align-center justify-center">
    <!-- Aumento del max-width y ajusto la altura de la tarjeta -->
    <v-card class="pa-6" max-width="600" elevation="10">
      <v-card-title class="text-h5 text-center">Iniciar sesión</v-card-title>
      <v-card-text>
        <!-- Formulario con 100% de ancho para ocupar todo el espacio disponible -->
        <v-form @submit.prevent="handleLogin">
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

            <!-- Botón de envío de formulario -->
            <v-col cols="12">
              <v-btn type="submit" color="primary" block> Entrar </v-btn>
            </v-col>
          </v-row>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
export default {
  name: 'LoginView',
  data() {
    return {
      autenticacion: '',
      password: '',
    };
  },
  methods: {
    handleLogin() {
      // Aquí puedes hacer una petición a tu backend
      if (this.autenticacion === 'admin@example.com' && this.password === 'admin') {
        alert('Inicio de sesión exitoso');
      } else {
        alert('Correo o contraseña incorrectos');
      }
    },
  },
};
</script>

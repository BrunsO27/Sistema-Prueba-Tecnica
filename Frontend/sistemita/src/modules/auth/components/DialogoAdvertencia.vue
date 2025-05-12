<template>
  <v-dialog :v-model="dialogAdvertencia" max-width="400">
    <v-card>
      <v-card-title class="text-h6"> Acceso Denegado </v-card-title>

      <v-card-text> Debes iniciar sesión para realizar esta acción. </v-card-text>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn text="Cerrar" @click="dialogAdvertencia = false"></v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script> 

export default {
    name: 'DialogoAdvertencia',
    props: {
        dialogAdvertencia: {
            type: Boolean,
            default: false
        }
    },
}
</script> 
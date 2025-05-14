<template>
  <v-app>
    <v-app-bar
      color="primary"
      elevation="0"
      height="110"
      position="0"
    >
    <HedearView />
      
    </v-app-bar>
    <v-main>
      <RouterView />
    </v-main>
  </v-app>
</template>

<script>
import HedearView from '@/modules/Commun/views/HeaderView.vue';
export default {
  name: 'App',
  components: {
    HedearView,
  }
};
</script>

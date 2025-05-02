import { createApp } from 'vue';
import App from './App.vue';
import vuetify from './plugins/vuetify'; // Importa el archivo de vuetify
//import router from './router'; // Si lo estás usando

const app = createApp(App);

//app.use(router);
app.use(vuetify); // Aquí estamos usando Vuetify

app.mount('#app');

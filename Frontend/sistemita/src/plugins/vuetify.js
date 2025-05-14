import 'vuetify/styles';
import '@mdi/font/css/materialdesignicons.css';
import { createVuetify } from 'vuetify';
import { es } from "vuetify/locale";

const customUnamTheme = {
  dark: false,
  colors: {
    primary: "#00589c",
    secondary: "#004179",
    accent: "#c5911e",
    error: "#FF5252",
    info: "#2196F3",
    success: "#4CAF50",
    warning: "#FFC107",
  },
};

export default createVuetify({
  theme: {
    defaultTheme: 'customUnamTheme',
    themes: {
      customUnamTheme,
    },
  },
  locale: {
    locale: 'es',
    messages: { es },
  },
});

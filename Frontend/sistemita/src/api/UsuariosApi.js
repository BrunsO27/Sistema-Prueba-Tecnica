import axios from 'axios';

const usuariosApi = axios.create({
  baseURL: import.meta.env.USUARIOS_API_URL,
});

usuariosApi.interceptors.request.use((config) => {
  const token = sessionStorage.getItem('token');
  if (token) {
    config.headers['x-token'] = token;
  }

  return config;
});

export { usuariosApi };

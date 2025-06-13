import { usuariosApi } from '@/api/UsuariosApi';

const login = async (autenticacion, password, rememberMe) => {
  try {
    const respuesta = await usuariosApi.post('/auth/login', {
      autenticacion,
      password,
    });

    const token = respuesta.data.token;

    if (rememberMe) {
      localStorage.setItem('autenticacion', autenticacion);
      localStorage.setItem('password', password);
    } else {
        localStorage.removeItem('autenticacion');
        localStorage.removeItem('password');
    }

    sessionStorage.setItem('token', token);

    return { accedio: true };
  } catch (error) {
    const mensajeError = error.response?.data.msg || 'Error al iniciar sesión';
    console.error(mensajeError);
    return { accedio: false, mensajeError };
  }
};

export default login;

import { usuariosApi } from '@/api/UsuariosApi';

const cargarData = async () => {
  try {
    const respuesta = await usuariosApi.get('/usuario');
    return respuesta.data.usuarios;
  } catch (error) {
    console.error(error);
    return [];
  }
};

export default cargarData;
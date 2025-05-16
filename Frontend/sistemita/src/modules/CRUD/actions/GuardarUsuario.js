import { usuariosApi } from '@/api/UsuariosApi';

const guardarUsuario = async (listaUsuarios, usuario, isEditing) => {
  if (isEditing) {
    const index = listaUsuarios.findIndex((u) => u.numCuenta === usuario.numCuenta);

    try {
      await usuariosApi.put(`/usuario/${usuario.numCuenta}`, usuario);
      listaUsuarios[index] = usuario;
    } catch (error) {
      console.error(error);
    }
  } else {
    try {
      listaUsuarios.push(usuario);
      await usuariosApi.post('/usuario', usuario);
    } catch (error) {
      console.error(error);
    }
  }
};

export default guardarUsuario;

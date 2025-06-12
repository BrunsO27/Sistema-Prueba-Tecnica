import { usuariosApi } from "@/api/UsuariosApi";

const eliminarUsuario = async (listaUsuarios, numCuenta) => {
  const index = listaUsuarios.findIndex((u) => u.numCuenta === numCuenta);

  try {
    await usuariosApi.delete(`/usuario/${numCuenta}`);
    listaUsuarios.splice(index, 1);
  } catch (error) {
    console.error(error);
  }
};

export default eliminarUsuario;

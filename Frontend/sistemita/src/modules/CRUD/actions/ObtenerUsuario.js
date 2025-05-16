const obtenerUsuario = (listaUsuarios, numCuenta) => {
  const usuario = listaUsuarios.find((u) => u.numCuenta === numCuenta);

  if (!usuario) {
    throw new Error(`Usuario con Número de Cuenta ${numCuenta} no encontrado`);
  }

  return {
    numCuenta: usuario.numCuenta,
    nombre: usuario.nombre,
    fechaNacimiento: usuario.fechaNacimiento,
    correo: usuario.correo,
    password: usuario.password,
    telefono: usuario.telefono,
    estado: usuario.estado,
  };
};

export default obtenerUsuario;

const recuperarCredenciales = () => {
  const autenticacion = localStorage.getItem('autenticacion') || '';
  const password = localStorage.getItem('password') || '';
  const rememberMe = !!(autenticacion && password);

  return { autenticacion, password, rememberMe };
};

export default recuperarCredenciales;

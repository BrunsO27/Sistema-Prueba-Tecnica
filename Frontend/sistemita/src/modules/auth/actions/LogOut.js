import router from '@/router';

const logOut = () => {
  sessionStorage.clear();
  router.replace({ name: 'Login' });

  const autenticacion = localStorage.getItem('autenticacion');
  const password = localStorage.getItem('password');

  if (!autenticacion || !password) {
    localStorage.clear();
  }
};

export default logOut;

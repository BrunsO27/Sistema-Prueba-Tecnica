const logOut = () =>  {
    sessionStorage.clear();
    this.$router.replace({ name: 'Login' });
}

export default logOut;
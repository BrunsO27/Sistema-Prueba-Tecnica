import router from "@/router";

const verificarAutenticacion = () => {
    const token = sessionStorage.getItem('token');

    if(!token) {
        router.replace({name: 'Login'});
        return false;
    }

    return true;
};

export default verificarAutenticacion;
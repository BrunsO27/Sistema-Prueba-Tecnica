const Usuario = require('../models/usuario');


const existeNumCuentaUsuario = async( numCuenta = 0 ) => {
    const existe = await Usuario.findByPk(numCuenta);

    if (!existe) {
        throw new Error(`El usuario con numero de cuenta ${ numCuenta } no existe`);
    }
}

const numCuentaEnBD = async( numCuenta = 0 ) => {
    const existe = await Usuario.findByPk(numCuenta);

    if (existe) {
        throw new Error(`El usuario con numero de cuenta ${ numCuenta } ya existe`);
    }
}

const existeCorreo = async( correo = '') => {
    const exiteMail = await Usuario.findOne({
        where: {
            correo
        }
    });

    if (exiteMail) {
        throw new Error(`El correo ${ correo } ya está registrado`);
    }
}

module.exports = {
    existeCorreo,
    existeNumCuentaUsuario,
    numCuentaEnBD,
}
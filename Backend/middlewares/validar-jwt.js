const jwt = require('jsonwebtoken');
const { response } = require('express');
const { request } = require('express');

const Usuario = require('../models/usuario');

const validarJWT = async (req = request, res = response, next) => {
    const token = req.header('x-token');

    //console.log(token);

    if (!token) {
        return res.status(401).json({
            msg: 'No hay token en la petición'
        });
    }

    try {
        const { uid } = jwt.verify( token, process.env.SECRETPRIVATEKEY );
        
        // leer el usuario que corresponde al uid
        const usuarioIdentificado = await Usuario.findByPk(uid);

        // Verificar si el usuario existe
        if ( !usuarioIdentificado ) {
            return res.status(401).json({
                msg: 'Token no válido - usuario no existe en DB'
            });
        }

        // Verificar si el usuario tiene estado true
        if ( !usuarioIdentificado.estado ) {
            return res.status(401).json({
                msg: 'Token no válido - usuario con estado en false'
            });
        }
        req.usuarioIdentificado = usuarioIdentificado;
        next();   

    } catch (error) {
        console.log(error);
        res.status(401).json({
            msg: 'Token no válido'
        });
    }
}

module.exports = {
    validarJWT,
}
const { response } = require('express');
const { request } = require('express');
const bcryptjs = require('bcryptjs');

const Ususario = require('../models/usuario');
const { generarJWT } = require('../helpers/generarJTW');

const login = async (req = request,res = response) => {

    const { autenticacion, password } = req.body;

    const auth = toString(autenticacion)

    if (auth.includes('@')) {

        const correo = autenticacion;

        try {
            // Verificar email
            const usuario = await Ususario.findOne({
                where: {
                    correo
                }
            })

            console.log(usuario,'******')
    
            if (!usuario) {
                return res.status(400).json({
                    msg: 'Usuario / Password no son correctos - email'
                })
            }
    
            // Verificar si el usuario esta activo
    
            if (!usuario.estado) {
                return res.status(400).json({
                    msg: 'Usuario / Password no son correctos - estado: false'
                })
            }
    
            // Verificar la contraseña
    
            const validPassword = bcryptjs.compareSync(password, usuario.password);
    
            if (!validPassword) {
                return res.status(400).json({
                    msg: 'Usuario / Password no son correctos - password'
                })
            }
    
            // Generar el JWT
    
            const token = await generarJWT(usuario.numCuenta);
    
            res.json({
                usuario,
                token
            });    
        } catch (error) {
            console.log(error);
            res.status(500).json({
                msg: 'Ha ocurrido en error, contacte al admistrador',
            });
        }
    } else {

        const numCuenta = autenticacion;

        try {
            // Verificar email
            const usuario = await Ususario.findOne({
                where: {
                    numCuenta
                }
            })
    
            if (!usuario) {
                return res.status(400).json({
                    msg: 'Usuario / Password no son correctos - email'
                })
            }
    
            // Verificar si el usuario esta activo
    
            if (!usuario.estado) {
                return res.status(400).json({
                    msg: 'Usuario / Password no son correctos - estado: false'
                })
            }
    
            // Verificar la contraseña
    
            const validPassword = bcryptjs.compareSync(password, usuario.password);
    
            if (!validPassword) {
                return res.status(400).json({
                    msg: 'Usuario / Password no son correctos - password'
                })
            }
    
            // Generar el JWT
    
            const token = await generarJWT(usuario.numCuenta);
    
            res.json({
                usuario,
                token
            });    
        } catch (error) {
            console.log(error);
            res.status(500).json({
                msg: 'Ha ocurrido en error, contacte al admistrador',
            });
        }
    }    
}

module.exports = {
    login,
}
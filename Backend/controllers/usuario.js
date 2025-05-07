const { response } = require('express');
const { request } = require('express');
const bcryptjs = require('bcryptjs');

const Usuario = require('../models/usuario');

const obtenerUsuarios = async (req = request,res = response) => {

    // const {q, nombre='No name', apikey='No api key'} = req.query;

    //const { limite = 5, desde = 0} = req.query;
    /* const usuarios = await Usuario.findAll({
        limit: Number(limite),
        offset: Number(desde),
        where: {
            estado: true
        },
    });

    const total = await Usuario.count({
        where: {
            estado: true
        }
    }); */

    const [ total, usuarios] = await Promise.all([
        Usuario.count({
            where: {
                estado: true
            }
        }),
        Usuario.findAll({
            where: {
                estado: true
            },
        }),
    ])

    res.json({
        total,
        usuarios,
    });
}

const actualizarUsuarios = async (req,res) => {

    const numCuenta = req.params.numCuenta;
    const { numCuenta: _,password, correo, ...resto } = req.body;

    if ( password ) {
        const salt = bcryptjs.genSaltSync();
        resto.password = bcryptjs.hashSync(password, salt);
    }

    const usuario = await Usuario.findByPk(numCuenta);
    await usuario.update(resto);

    res.json({
        usuario
    });
}

const crearUsuario = async(req,res) => {

    const { numCuenta,
            nombre,
            fechaNacimiento,
            correo,
            password,
            telefono,
            estado,
} = req.body;

    const salt = bcryptjs.genSaltSync();
    const hasdPassword = bcryptjs.hashSync(password, salt);    

    const newUsuario = Usuario.build({
        numCuenta,
        nombre,
        fechaNacimiento,
        correo,
        password: hasdPassword,
        telefono,
        estado,})

    await newUsuario.save()
    res.status(201).json({
        "Usuario": newUsuario.toJSON()
    });
}

const eliminarUsuario = async (req,res) => {
    const { numCuenta } = req.params;

    // Físicamente lo borramos
    /* const usuario = await Usuario.findByPk(id);
    await usuario.destroy(); */

    const usuario = await Usuario.findByPk(numCuenta);
    await usuario.update({estado: false});
    res.json({
        usuario
    });
}

module.exports = {
    obtenerUsuarios,
    crearUsuario,
    actualizarUsuarios,
    eliminarUsuario,
}
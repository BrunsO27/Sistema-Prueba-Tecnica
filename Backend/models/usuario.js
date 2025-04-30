const { DataTypes } = require('sequelize');
const { dbSistemita } = require('../database/config');

const Usuario = dbSistemita.define('usuario', {
    numCuenta: {
        type: DataTypes.CHAR(9),
        primaryKey: true,
        allowNull: false,
        validate: {
          is: {
            args: /^[0-9]{9}$/,
            msg: 'numCuenta debe tener exactamente 9 dígitos numéricos'
          }
        }
    },nombre: {
        type: DataTypes.STRING(100),
        allowNull: false,
    },
    fechaNacimiento: {
        type: DataTypes.DATEONLY(),
        allowNull: false,
    },
    correo: {
        type: DataTypes.STRING(100),
        unique: true,
        allowNull: false,
    },
    password: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    telefono: {
        type: DataTypes.CHAR(10),
        allowNull: false,
        validate: {
          is: {
            args: /^\d{10}$/,
            msg: 'El teléfono debe tener exactamente 10 dígitos numéricos'
          }
        }
      },
    estado: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
    },
},
{
    freezeTableName: true,
    timestamps: false,
});

module.exports = Usuario;
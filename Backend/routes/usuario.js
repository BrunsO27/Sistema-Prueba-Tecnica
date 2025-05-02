const { Router } = require('express');
const { check, query } = require('express-validator');

const { existeCorreo,
        existeNumCuentaUsuario } = require('../helpers/db-validators');

const { obtenerUsuarios,
        crearUsuario,
        actualizarUsuarios,
        eliminarUsuario, } = require('../controllers/usuario');

const { validarJWT } = require('../middlewares/validar-jwt');
const validarCampos = require('../middlewares/validar-campos');


const router = Router();

router.get('/', [
        query('limite', 'El límite tiene que ser un número positivo').optional().isInt({min: 1}),
        query('desde', 'El número de página tiene que ser un número positivo').optional({min: 0}).isInt(),
        validarCampos
],obtenerUsuarios );

router.put('/:numCuenta', [
        check('numCuenta', 'El número de cuenta debe tener 9 dígitos numéricos').isLength({ min: 9, max: 9 }).isNumeric(),
        check('numCuenta').custom( existeNumCuentaUsuario ),
        validarCampos
],actualizarUsuarios);

router.post('/', [
        check('nombre', 'El nombre es obligatorio').not().isEmpty(),
        check('correo', 'El correo no es válido').isEmail(),
        check('correo').custom( existeCorreo ),
        check('password', 'La contraseña debe tener al menos 6 caracteres').isLength({min: 6}),
        validarCampos
], crearUsuario);

router.delete('/:numCuenta', [
        validarJWT,
        check('numCuenta', 'No es un numero de cueanta válido').isLength({ min: 9, max: 9 }).isNumeric(),
        check('numCuenta').custom( existeNumCuentaUsuario ),
        validarCampos
],eliminarUsuario);

module.exports = router;
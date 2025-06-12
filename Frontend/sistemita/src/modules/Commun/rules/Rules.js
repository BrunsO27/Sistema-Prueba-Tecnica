const validarCampoVacio = (entrada) => {
  return entrada !== '' || 'El campo no puede estar vacío';
};

const validarNumeros = (entrada) => {
  return /^[0-9]+$/.test(entrada) || 'El campo debe tener solamente números';
};

const validarCorreo = (entrada) => {
  return (
    /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(entrada) || 'El correo no es válido'
  );
};

const validarPassword = (entrada) => {
  return /^(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).+$/.test(entrada) || 
         'La contraseña debe contener al menos un carácter especial, un número, una letra en mayúscula y una letra en minúscula';
};

const validarLongitudMinima = (longitud) => {
  return (entrada) => entrada.length >= longitud || `Debe de tener al menos ${longitud} caracteres`;
};

const validarLongitudMaxima = (longitud) => {
  return (entrada) => entrada.length <= longitud || `Debe de tener como máximo ${longitud} caracteres`;
}

export {
    validarCampoVacio,
    validarCorreo,
    validarNumeros,
    validarPassword,
    validarLongitudMinima,
    validarLongitudMaxima,
}
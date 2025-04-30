require('dotenv').config()

const Server = require('./server');
const { dbSistemita } = require('./database/config');

const server = new Server();

server.listen();

dbSistemita.authenticate()
    .then(() => { console.log('Conexion exitosa')} )
    .catch(() => { console.log('Error en la conexion') });


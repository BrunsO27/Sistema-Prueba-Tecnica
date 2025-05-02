const express = require('express');
const cors = require('cors');

class Server {
    constructor() {
        this.app = express();
        this.port = process.env.PORT

        this.authPath = '/api/auth'
        this.usersPath = '/api/usuario'

        // Conectar a base de datos

        // Middlawares
        this.middlewares();

        // Rutas de mi aplicacion
        this.routes();
    }

    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor escuchando en:', this.port);
        });
    }

    middlewares() {
        // Directorio publico
        this.app.use( express.static('public') );

        // CORS
        this.app.use( cors() );

        // Lectura y parseo del body
        this.app.use( express.json() );
    }

    routes() {
        this.app.use( '/api/auth', require('./routes/auth.js'));
        this.app.use( '/api/usuario', require('./routes/usuario.js'));
    }
}


module.exports = Server;
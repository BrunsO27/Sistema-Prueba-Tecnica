const mysql = require('mysql')
const { Sequelize } = require('sequelize')

const dbSistemita = new Sequelize(process.env.DB_NAME, 
                             process.env.DB_USER, 
                             process.env.DB_PASSWORD,
                             {
    host: process.env.DB_HOST,
    dialect: 'mysql',
    logging: console.log,
});

module.exports = {
    dbSistemita
}
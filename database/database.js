const Sequelize = require('sequelize');
const connection = new Sequelize('database_project', 'root', '123456', {
    host: 'mysql-container',
    port: 3306,
    dialect: 'mysql',
    timezone: '-03:00'
});

module.exports = connection;
const Sequelize = require('sequelize');
const connection = require('../database/database');

const Admin = connection.define('Admin', {
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    email: {
        type: Sequelize.STRING,
        allowNull: false
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false
    },
    status: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 1
    }
});

Admin.sync({force: false});

module.exports = Admin;
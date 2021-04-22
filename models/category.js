const Sequelize = require('sequelize');
const connection = require('../database/database');

const Category = connection.define('Category', {
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    status: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 1
    }
});

module.exports = Category;
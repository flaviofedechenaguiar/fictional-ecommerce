const Sequelize = require('sequelize');
const connection = require('../database/database');
const ProductImage = connection.define('Product_Image', {
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    imageLink: {
        type: Sequelize.TEXT,
        allowNull: false
    },
    status: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 1
    }
});

module.exports = ProductImage;
const Sequelize = require('sequelize');
const connection = require('../database/database');

const Order = connection.define('Order', {
    amount: {
        type: Sequelize.DECIMAL(10, 2),
        allowNull: false
    },
    status: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 1
    }

});

module.exports = Order;
const Sequelize = require('sequelize');
const connection = require('../database/database');
const Order = require('./order');

const OrderItem = connection.define('Order_Item', {
    quantity: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    // value using for discount
    value: {
        type: Sequelize.DECIMAL(10, 2),
        allowNull: false
    },
    status: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 1
    }
});


module.exports = OrderItem;
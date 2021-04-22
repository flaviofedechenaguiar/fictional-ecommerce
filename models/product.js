const Sequelize = require('sequelize');
const connection = require('../database/database');
const Category = require('./category');
const Provider = require('./provider');
const ProductImage = require('./productImages');
const OrderItem = require('./orderItem');
const Order = require('./order');
const User = require('./user');

const Product = connection.define('Product', {
    namePlusSmallDescription: {
        type: Sequelize.STRING,
        allowNull: false
    },
    brand: {
        type: Sequelize.STRING,
        allowNull: false
    },
    refCode: {
        type: Sequelize.STRING,
        allowNull: false
    },
    description: {
        type: Sequelize.TEXT,
        allowNull: false
    },
    purchasePrice: {
        type: Sequelize.DECIMAL(10, 2),
        allowNull: false
    },
    saleValue: {
        type: Sequelize.DECIMAL(10, 2),
        allowNull: false
    },
    stockQuantity: {
        type: Sequelize.INTEGER,
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



Provider.hasMany(Product);
Product.belongsTo(Provider);



Category.hasMany(Product);
Product.belongsTo(Category);


Product.hasMany(OrderItem);
OrderItem.belongsTo(Product);

Product.hasMany(ProductImage);
ProductImage.belongsTo(Product);

Order.hasMany(OrderItem);
OrderItem.belongsTo(Order);

User.sync({force: false});

Order.sync({force: false});

Provider.sync({ force: false });

Category.sync({ force: false });

Product.sync({ force: false });

OrderItem.sync({ force: false });

ProductImage.sync({ force: false });







// Team.hasMany(Player);
// Player.belongsTo(Team);

module.exports = Product;
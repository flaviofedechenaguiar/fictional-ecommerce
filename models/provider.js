const Sequelize = require('sequelize');
const connection = require('../database/database');

const Provider = connection.define('Provider', {
    fantasyName: {
        type: Sequelize.STRING,
        allowNull: false
    },
    socialReason: {
        type: Sequelize.STRING,
        allowNull: false
    },
    cnpj_cpf: {
        type: Sequelize.STRING,
        allowNull: false
    },
    email: {
        type: Sequelize.STRING,
        allowNull: false
    }, phoneNumber: {
        type: Sequelize.STRING,
        allowNull: false
    },
    city: {
        type: Sequelize.STRING,
        allowNull: false
    },
    state: {
        type: Sequelize.STRING,
        allowNull: false
    },
    address: {
        type: Sequelize.STRING,
        allowNull: false
    },
    addressNumber: {
        type: Sequelize.STRING,
        allowNull: false
    },
    neighborhood: {
        type: Sequelize.STRING,
        allowNull: false
    },
    complement: {
        type: Sequelize.TEXT,
        allowNull: false
    },
    zipCode: {
        type: Sequelize.STRING,
        allowNull: false
    },
    status: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 1
    }

});



module.exports = Provider;
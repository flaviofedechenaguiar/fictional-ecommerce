const Sequelize = require('sequelize');
const connection = require('../database/database');

const Banner = connection.define('Banner', {
    linkOne: {
        type: Sequelize.TEXT,
        allowNull: false
    },
    linkTwo: {
        type: Sequelize.TEXT,
        allowNull: false
    },
    linkThree: {
        type: Sequelize.TEXT,
        allowNull: false
    },
    status: {
        type: Sequelize.INTEGER,
        allowNull: false,
        defaultValue: 1
    }
});

Banner.sync({ force: false });

module.exports = Banner;
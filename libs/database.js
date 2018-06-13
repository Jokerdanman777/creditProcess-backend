var Sequelize   = require("sequelize");
var config      = require('config');

var sequelize = new Sequelize(  config.get('Database.dbName'),
                                config.get('Database.user'),
                                config.get('Database.password'), {

        host: config.get('Database.host'),
        dialect: 'mysql',

        pool: {
            max: 5,
            min: 0,
            idle: 10000
        }
    });

module.exports = sequelize;

var mysql   = require('mysql');
var config  = require('config');

function Connection() {
    this.pool = null;

    this.init = function() {
        this.pool = mysql.createPool({
            connectionLimit: 10,
            host: config.get("Database.host"),
            user: config.get("Database.user"),
            password: config.get("Database.password"),
            database: config.get("Database.dbName"),
        });
    };

    this.acquire = function(callback) {
        this.pool.getConnection(function(err, connection) {
            callback(err, connection);
        });
    };
}

module.exports = new Connection();

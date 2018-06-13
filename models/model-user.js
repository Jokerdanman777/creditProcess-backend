var Sequelize = require("sequelize");
var sequelize = require('./../libs/database');

// ==============  User  ================ //
var User = sequelize.define('users', {
    ruleId: {
        type: Sequelize.INTEGER,
        field: 'ruleId'
    	},
    username: {
        type: Sequelize.STRING,
        field: 'username',
        unique: true
    	},
    password: {
        type: Sequelize.STRING,
        field: 'password'
    	}
	},
    {
        timestamps: false
    }
);

// ==============  Rule  ================ //
var Rule = sequelize.define('rules', {
    rule: {
        type: Sequelize.STRING,
        field: 'rule'
    	}
	},
    {
        timestamps: false
    }
);

module.exports.User = User;
module.exports.Rule = Rule;
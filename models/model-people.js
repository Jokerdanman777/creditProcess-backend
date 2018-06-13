var Sequelize = require("sequelize");
var sequelize = require('./../libs/database');


// ==============  People  ================ //
var People = sequelize.define('peoples', {
    userId: {
        type: Sequelize.INTEGER,
        field: 'userId'
        },
    lastName: {
        type: Sequelize.STRING,
        field: 'lastName',
        },
    firstName: {
        type: Sequelize.STRING,
        field: 'firstName',
        },
    middleName: {
        type: Sequelize.STRING,
        field: 'middleName',
        },
    },
    {
        timestamps: false
    }
);

// ==============  CIpeoples  ================ //
var CIpeople = sequelize.define('ci_peoples', {
    peopleId: {
        type: Sequelize.INTEGER,
        field: 'peopleId'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
);

// ==============  CMpeoples  ================ //
var CMpeople = sequelize.define('cm_peoples', {
    peopleId: {
        type: Sequelize.INTEGER,
        field: 'peopleId'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
);

// ==============  Manager  ================ //
var Manager = sequelize.define('manager_peoples', {
    peopleId: {
        type: Sequelize.INTEGER,
        field: 'peopleId'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
);

module.exports.People = People;
module.exports.CIpeople = CIpeople;
module.exports.CMpeople = CMpeople;
module.exports.Manager = Manager;
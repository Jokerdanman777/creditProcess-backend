var Sequelize = require("sequelize");
var sequelize = require('./../libs/database');

// ==============  Segement  ================ //
var Segement = sequelize.define('segements', {
    segement: {
        type: Sequelize.STRING,
        field: 'segement'
        }
    },
    {
        timestamps: false
    }
);

// ==============  Level  ================ //
var Level = sequelize.define('levels', {
    level: {
        type: Sequelize.STRING,
        field: 'level'
    	}
	},
    {
        timestamps: false
    }
);

// ==============  StepName  ================ //
var StepName = sequelize.define('step_names', {
    step: {
        type: Sequelize.STRING,
        field: 'step'
    	}
	},
    {
        timestamps: false,
        freezeTableName: true
    },
);

// ==============  Step  ================ //
var Step = sequelize.define('steps', {
    ticketId: {
        type: Sequelize.INTEGER,
        field: 'ticketId'
    	},
    stepNameId: {
        type: Sequelize.INTEGER,
        field: 'stepNameId'
    	},
    planDate: {
        type: Sequelize.DATE,
        field: 'planDate'
    	},
    factDate: {
        type: Sequelize.DATE,
        field: 'factDate'
    	}
	},
    {
        timestamps: false
    }
);

// ==============  Ticket  ================ //
var Ticket = sequelize.define('tickets', {
    active: {
        type: Sequelize.INTEGER,
        field: 'active'
    	},
    segementId: {
        type: Sequelize.INTEGER,
        field: 'segementId'
    	},
    levelId: {
        type: Sequelize.INTEGER,
        field: 'levelId'
    	},
    borrower: {
        type: Sequelize.STRING,
        field: 'borrower'
    	},
    rate: {
        type: Sequelize.DECIMAL,
        field: 'rate'
    	},
    amount: {
        type: Sequelize.DECIMAL,
        field: 'amount'
    	}
	});

module.exports.Segement = Segement;
module.exports.Level = Level;
module.exports.StepName = StepName;
module.exports.Step = Step;
module.exports.Ticket = Ticket;
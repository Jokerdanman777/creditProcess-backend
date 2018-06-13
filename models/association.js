const Sequelize = require("sequelize");
const sequelize = require('./../libs/database');

const ticketModel = require('./model-ticket');
const userModel = require('./model-user');
const peopleModel = require('./model-people');

userModel.User.belongsTo(userModel.Rule, {foreignKey: 'ruleId'});

peopleModel.People.belongsTo(userModel.User, {foreignKey: 'userId'});
userModel.User.hasOne(peopleModel.People);

ticketModel.Segement.hasMany(ticketModel.Ticket)
ticketModel.Ticket.belongsTo(ticketModel.Segement, {foreignKey: 'segementId'});

ticketModel.Level.hasMany(ticketModel.Ticket)
ticketModel.Ticket.belongsTo(ticketModel.Level, {foreignKey: 'levelId'});

ticketModel.Step.belongsTo(ticketModel.Ticket, {foreignKey: 'ticketId'});
ticketModel.Ticket.hasMany(ticketModel.Step);
ticketModel.Step.belongsTo(ticketModel.StepName, {foreignKey: 'stepNameId'});
ticketModel.StepName.hasMany(ticketModel.Step);

ticketModel.Ticket.belongsTo(peopleModel.CIpeople, {foreignKey: 'ci'});
ticketModel.Ticket.belongsTo(peopleModel.CMpeople, {foreignKey: 'cm'});
ticketModel.Ticket.belongsTo(peopleModel.Manager, {foreignKey: 'manager'});

peopleModel.CIpeople.belongsTo(peopleModel.People, {foreignKey: 'peopleId'});
peopleModel.CMpeople.belongsTo(peopleModel.People, {foreignKey: 'peopleId'});
peopleModel.Manager.belongsTo(peopleModel.People, {foreignKey: 'peopleId'});

// peopleModel
module.exports.CIpeople = peopleModel.CIpeople;
module.exports.CMpeople = peopleModel.CMpeople;
module.exports.Manager = peopleModel.Manager;
module.exports.People = peopleModel.People;

// userModel
module.exports.User = userModel.User;
module.exports.Rule = userModel.Rule;

// ticketModel
module.exports.Segement = ticketModel.Segement;
module.exports.Level = ticketModel.Level;
module.exports.StepName = ticketModel.StepName;
module.exports.Step = ticketModel.Step;
module.exports.TicketPeople = ticketModel.TicketPeople;
module.exports.Ticket = ticketModel.Ticket;
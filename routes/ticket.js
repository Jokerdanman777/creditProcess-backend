const express = require('express');
const router = express.Router();
const model = require('../models/association');
const sequelizeDb = require('../libs/database');

// Получение всех заявок со всеми зависимостями
router.get('/all', function(req, res, next) {
  model.Ticket
    .findAll({
      where: {active: 1},
      include: [model.Segement, model.Level,
      {
        model: model.Step,
        include: [model.StepName]
      },
      {
        model: model.CIpeople,
        include: [model.People]
      },
      {
        model: model.CMpeople,
        include: [model.People]
      },
      {
        model: model.Manager,
        include: [model.People]
      }
    ]
    })
    .then(tickets => res.json(tickets))
    .catch(error => {throw error})
});


// Получение всех сегментов
router.get('/segements', function(req, res, next) {
  model.Segement
    .findAll({
    })
    .then(segements => res.json(segements))
    .catch(error => {throw error})
});

// Получение всех уровней
router.get('/levels', function(req, res, next) {
  model.Level
    .findAll({
    })
    .then(levels => res.json(levels))
    .catch(error => {throw error})
});

// Получение все возможных этапов
router.get('/steps', function(req, res, next) {
  model.StepName
    .findAll({
    })
    .then(steps => res.json(steps))
    .catch(error => {throw error})
});

// Получение заявкт по id
router.get('/:id', function(req, res, next) {
  model.Ticket
    .findAll({
      where: {
        id: req.params.id,
        active: 1,
      },
      include: [model.Segement, model.Level,
      {
        model: model.Step,
        include: [model.StepName]
      },
      {
        model: model.CIpeople,
        include: [model.People]
      },
      {
        model: model.CMpeople,
        include: [model.People]
      },
      {
        model: model.Manager,
        include: [model.People]
      }
    ]
    })
    .then(ticket => res.json(ticket))
    .catch(error => {throw error})
});

// создание новой заявки
router.post('/new', function(req, res, next){
 return sequelizeDb.transaction(t => {
    return model.Ticket.create(
      req.body,
      {transaction: t}
    ).then(ticket => {
       req.body.selectSteps.forEach(element => {
       return model.Step.create({
          ticketId : ticket.id,
          stepNameId: element
        }, {transaction : t})
      });
    })
  })
  .then(function (result) {
    t.commit();
  })
  .catch(error => {
    t.rollback();
    return next(error);
    })
  });


// сохранение изменений в существующую заявку
router.put('/:id', function(req, res, next){
  model.Ticket
    .update({
      where: {id: req.params.id}
    })
    .then(result => res.json(result))
    .catch(error => next(error))
});
 
// удаление завяки по id
router.delete('/:id', function(req, res, next){
    model.Ticket
      .destroy({
        where: {id: req.params.id}
      })
      .then(result => res.json(result))
      .catch(error => next(error))
  });

module.exports = router;
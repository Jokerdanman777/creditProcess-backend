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
      }],
      order: [
        ['id', 'ASC']
      ]
    })
    .then(tickets => res.json(tickets))
    .catch(error => next(error))
});


// Получение всех сегментов
router.get('/segements', function(req, res, next) {
  model.Segement
    .findAll({
    })
    .then(segements => res.json(segements))
    .catch(error => next(error))
});

// Получение всех уровней
router.get('/levels', function(req, res, next) {
  model.Level
    .findAll({
    })
    .then(levels => res.json(levels))
    .catch(error => next(error))
});

// Получение все возможных этапов
router.get('/steps', function(req, res, next) {
  model.StepName
    .findAll({
    })
    .then(steps => res.json(steps))
    .catch(error => next(error))
});

// Получение заявкт по id
router.get('/:id', function(req, res, next) {
  model.Ticket
    .findOne({
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
    .catch(error => next(error))
});

// создание новой заявки
router.post('/new', function(req, res, next){
 return sequelizeDb.transaction(t => {
    return model.Ticket.create(
      req.body
    ).then(ticket => {
       req.body.selectSteps.forEach(element => {
       return model.Step.create({
          ticketId : ticket.id,
          stepNameId: element
        });
      });
    });
  })
  .then(function (result) {
    res.json('SUCCESS');
  })
  .catch(error => {
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
const express = require('express');
const router = express.Router();
const model = require('../models/association');

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

// создание новой заявки
router.post('/new', function(req, res, next){
  model.Ticket
    .create(req.body)
    .then(result => res.json(result))
    .catch(error => next(error))
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
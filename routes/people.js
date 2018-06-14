const express = require('express');
const router = express.Router();
const model = require('../models/association');

// Получение всех кредитных менеджеров
router.get('/cm', function(req, res, next) {
  model.CMpeople
    .findAll({
      include: [ model.People]
    })
    .then(cm => res.json(cm))
    .catch(error => {throw error})
});

// Получение всех кредитных инспекторов
router.get('/ci', function(req, res, next) {
    model.CIpeople
      .findAll({
        include: [ model.People]
      })
      .then(ci => res.json(ci))
      .catch(error => {throw error})
  });

// Получение всех руководителей
router.get('/managers', function(req, res, next) {
  model.Manager
    .findAll({
      include: [ model.People]
    })
    .then(managers => res.json(managers))
    .catch(error => {throw error})
});

module.exports = router;
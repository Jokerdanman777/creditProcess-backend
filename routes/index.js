const express = require('express');
const router = express.Router();
const model = require('../models/association');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send('main');
});


module.exports = router;
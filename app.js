// require
var express = require('express');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var connection = require('./libs/connect');
// connection
connection.init();
// routes
var index = require('./routes/index');
var ticket = require('./routes/ticket');
var people = require('./routes/people');

var app = express();

//body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(require('./middleware/cors'));
// api
app.use('/api', index);
app.use('/api/ticket', ticket);
app.use('/api/people', people);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500).send('error', {error: err});
});

module.exports = app;
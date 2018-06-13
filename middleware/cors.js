var config = require('config');

module.exports = function(req, res, next){
    res.setHeader('Access-Control-Allow-Origin', config.get('AllowOrigin'));
    res.setHeader('Access-Control-Allow-Credentials', 'true');
    res.setHeader('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, Content-Type, X-Auth-Token , Authorization');
    next();
};
// a static server that servers ./www/
var static = require('node-static');
var file = new static.Server('./www');

require('http').createServer(function (request, response) {
    request.addListener('end', function () {
        file.serve(request, response);
    }).resume();
}).listen(8080);

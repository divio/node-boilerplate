const http = require('http');
const static = require('node-static');
const port = 80;

const fileServer = new static.Server('./public');
const requestHandler = (request, response) => {
    console.log(request.url);
    request.addListener('end', function () {
        fileServer.serve(request, response, function (e, res) {
            if (e && (e.status === 404)) { // If the file wasn't found
                 fileServer.serveFile('/404.html', 404, {}, request, response);
            }
        });
    }).resume();
}

const server = http.createServer(requestHandler)

server.listen(port, (err) => {
    if (err) {
        return console.log('something bad happened', err);
    }

    console.log(`server is listening on ${port}`);
});

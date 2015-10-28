var express = require('express'),
    app = express();

// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res){
    res.sendFile(__dirname + '/public/licence_holders.html');
});

// listen on port 3000
app.listen(3000);
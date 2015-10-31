var express = require('express'),
    app = express();

app.set('view engine', 'ejs');

// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res){
    res.render('pages/index');
});

// listen on port 3000
app.listen(3000);

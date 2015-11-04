var express = require('express'),
    CartoDbClient = require('./cartodb_client').CartoDbClient;

CartoDbClient.initialize();

var app = express();
app.set('view engine', 'ejs');

// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res){
    res.render('pages/index', {
        companies: CartoDbClient.companies,
        licenses: CartoDbClient.licenses
    });
});

// listen on port 3000
app.listen(3000);
console.log("App is running at http://localhost:3000");
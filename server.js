var express = require('express')
    DataService = require('./data-service').DataService;

var app = express();

app.set('view engine', 'ejs');

// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res) {
    res.render('pages/index', {
        licenses: DataService.licenses,
        companies: DataService.companies
    });
});

app.get('/data', function(req, res) {
    res.send(DataService.polygonData);
});

DataService.getGeoData(function() {
    // after fetching the GeoJSON data, listen on port 3000
    app.listen(3000);
    console.log("App is running at http://localhost:3000");
});

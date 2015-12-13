var express = require('express'),
    DataService = require('./data-service').DataService
    ua = require('universal-analytics'),
    secret = require('./secret'),
    auth = require("http-auth");

// Define variables for basic authentication. Issue #69
var basic = auth.basic({
  authRealm: "Private area",
  file: __dirname + "/data/users.htpasswd"
});

var app = express();

// Basic HTTP authentication
app.use(auth.connect(basic));

app.set('view engine', 'ejs');

// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res) {

    //Record Google Analytics only when sent from live server
    //Note live server has a secret.js that contains the GA_ID
    //whilest devs shouldn't. See comments on PR #63.
    if (secret.GA_ID) {
        visitor = ua(secret.GA_ID);
        visitor.pageview("/").send();
    }

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

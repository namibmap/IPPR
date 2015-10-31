// Configuration for connection to CartoDB's data
// TODO: Put the CartoDB stuff in another file?
var CartoDB = require('cartodb');
var secret = require('./secret.js');
var client = new CartoDB({user: secret.USER, api_key: secret.API_KEY});

// Connect to CartoDB's namibmap account and send query
client.on('connect', function() {
    console.log("Connected to CartoDB! :-)");

    //Retrieve list of all company names. Data is returned in JSON
    var sql_companies = "SELECT company_name FROM companies";
    client.query(sql_companies, function(err, data){
    // JSON parsed data or error messages are returned
    })
});

// Client is a stream object so you can pipe responses as new line delimited JSON
// Saving response to file 
// TODO: Can we pass this to EJS directly?
var output = require('fs').createWriteStream(__dirname + '/companies.json');
client.pipe(output);
client.connect();

//ExpressJS stuff
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

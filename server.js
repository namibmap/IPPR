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
    
    //Retrieve list of concessions/blocks and PELs they are related to
    var sql_PEL_and_concessions = "SELECT concession_number, licenses.license_number  \
		FROM concessions, licenses \
		WHERE concession_license_id = licenses.license_id";

	//Queries can be chained
    client.query(sql_companies, function(err, data){})
    .query(sql_PEL_and_concessions, function(err, data){})
});

// client is a stream object so you can pipe responses as new line delimited JSON
// Saving response to file 
// TODO: Can we pass this to EJS directly or read the response.json instead?
var output = require('fs').createWriteStream(__dirname + '/response.json');
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

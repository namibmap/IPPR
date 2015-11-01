// Configuration for connection to CartoDB's data
// TODO: Put the CartoDB stuff in another file?
var CartoDB = require('cartodb');
var secret = require('./secret.js');
var client = new CartoDB({user: secret.USER, api_key: secret.API_KEY});

// Connect to CartoDB's namibmap account and send query
client.on('connect', function() {
    console.log("Connected to CartoDB!");

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

var companies = [];
var licenses = {};
client.on('data',function(buffer){
  var CartoDBdataStream = JSON.parse(buffer);
  for (var i=0; i<CartoDBdataStream.rows.length; i++){
    if (CartoDBdataStream.rows[i].company_name){
        companies.push(CartoDBdataStream.rows[i].company_name);
    }
    if (CartoDBdataStream.rows[i].license_number){
        var key = CartoDBdataStream.rows[i].license_number;
        if (key in licenses){
            licenses[key].push(CartoDBdataStream.rows[i].concession_number);
        } else {
            licenses[key] = [CartoDBdataStream.rows[i].concession_number];
        }
    }
  }
});

client.connect();


//ExpressJS stuff
var express = require('express'),
    app = express();

app.set('view engine', 'ejs');

// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res){
    res.render('pages/index', {
        companies: companies,
        licenses: licenses
    });
});

// listen on port 3000
app.listen(3000);
console.log("App is running at http://localhost:3000");

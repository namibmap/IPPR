// Configuration for connection to CartoDB's data
// TODO: Put the CartoDB stuff in another file?
var CartoDB = require('cartodb');
var secret = require('./secret.js');
var client = new CartoDB({user: secret.USER, api_key: secret.API_KEY});

// Connect to CartoDB's namibmap account and send query
client.on('connect', function() {
    console.log("Connected to CartoDB!");

    //Retrieve list of all company names and ids. Data is returned in JSON
    var sql_companies = "SELECT company_name, company_id FROM companies";	//company_name
    
    //Retrieve list of concessions/blocks and PELs they are related to  ASSUMING concession_license_id = company_id
    var sql_PEL_and_concessions = "SELECT concession_number, concession_license_id, licenses.license_number  \
		FROM concessions, licenses \
		WHERE concession_license_id = licenses.license_id";

	//Queries can be chained
    client.query(sql_companies, function(err, data){})
    .query(sql_PEL_and_concessions, function(err, data){})
});
//associate company ID with its name for cross referencing
function companyRecord(companyName, companyId){
	this.name = companyName;
	this.id = companyId;
}
//associate concession_license_id with concession for cross referencing
function concessionLicense(concessionNum, concessionId){
	this.concession = concessionNum;
	this.id = concessionId;
}
var companies = [];
var licenses ={};

client.on('data',function(buffer){
  var CartoDBdataStream = JSON.parse(buffer);
  for (var i=0; i<CartoDBdataStream.rows.length; i++){
    if (CartoDBdataStream.rows[i].company_name && CartoDBdataStream.rows[i].company_id){
		var thisCompany = new companyRecord(CartoDBdataStream.rows[i].company_name, CartoDBdataStream.rows[i].company_id);
		companies.push(thisCompany);	//store name and id for each company	
    }
    if (CartoDBdataStream.rows[i].license_number){
        var key = CartoDBdataStream.rows[i].license_number;
		var thisConcession = new concessionLicense(CartoDBdataStream.rows[i].concession_number, CartoDBdataStream.rows[i].concession_license_id);
        if (key in licenses){
            licenses[key].push(thisConcession);	//replaced CartoDBdataStream.rows[i].concession_number
        } else {
            licenses[key] = [CartoDBdataStream.rows[i].license_number];	//replaced concession_number
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

var express = require('express'),
    fs = require('fs'),
    Secret = require('./secret'),
    request = require('request'),
    jsonfile = require('jsonfile'),
    data = require('./GeoData'),
    data_obj = JSON.parse(data.body),
    licenses_sorted = {},
    companies_sorted = [];


(function sortOutData(){
    for (i=0; i<data_obj.features.length; i++){
            var key = data_obj.features[i].properties.license_number;
            if (key in licenses_sorted) {
                licenses_sorted[key].push(data_obj.features[i].properties.concession_number);
            } else {
                licenses_sorted[key] = [data_obj.features[i].properties.concession_number];
            }
            if ( companies_sorted.indexOf(data_obj.features[i].properties.company_name) <0 ){
                companies_sorted.push(data_obj.features[i].properties.company_name);
            }
        }
    return licenses_sorted, companies_sorted;
})()

var app = express();

app.set('view engine', 'ejs');

request('https://namibmap.cartodb.com/api/v2/sql?format=GeoJSON&q=SELECT concessions.the_geom, concession_number, license_number, company_name FROM concessions, licenses, companies, license_holdings WHERE concessions.concession_license_id = licenses.license_id AND license_holdings.license_holding_company_id = companies.company_id AND license_holdings.license_holding_license_id = licenses.license_id&api_key='+Secret.API_KEY, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    jsonfile.writeFile(__dirname + '/GeoData.json', response, function(err){
                    //console.log(err);
                })
  }
})


// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res){
       res.render('pages/index', {
            data:data_obj,
            licenses: licenses_sorted,
            companies: companies_sorted
       });
});

request('https://namibmap.cartodb.com/api/v2/sql?format=GeoJSON&q=SELECT concessions.the_geom, concession_number, license_number, company_name FROM concessions, licenses, companies, license_holdings WHERE concessions.concession_license_id = licenses.license_id AND license_holdings.license_holding_company_id = companies.company_id AND license_holdings.license_holding_license_id = licenses.license_id LIMIT 1&api_key='+Secret.API_KEY, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    jsonfile.writeFile(__dirname + '/GeoData.json', response, function(err){
                    //console.log(err);
                })
  }
})


// listen on port 3000
app.listen(3000);
console.log("App is running at http://localhost:3000");
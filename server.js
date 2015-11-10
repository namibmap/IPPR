var express = require('express'),
    companies = require('./companies.json'),
    modifyJSON = require('./helpers/modifyJSON').modifyJSON,
    licenses_sorted = modifyJSON.sortLicenses(),
    updateJSON = require('./helpers/updateJSON').updateJSON;

// check if updated JSON needs to fetched from CartoDB
updateJSON.checkFileTimeStamp();

var app = express();

app.set('view engine', 'ejs');

// serve static files from public folder
app.use(express.static(__dirname +'/public'));

app.get('/', function(req, res){
       res.render('pages/index', {
            companies: companies,
            licenses: licenses_sorted
       });
});

// listen on port 3000
app.listen(3000);
console.log("App is running at http://localhost:3000");
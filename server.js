var express = require('express'),
    fs = require('fs'),
    companies, modifyJSON, licenses_sorted;

(function checkIfJSONExists(){
    fs.exists('./companies.json', function(exists){
        if (exists){
            var updateJSON = require('./helpers/updateJSON').updateJSON;
             // check if need to fetch JSON from CartoDB
             updateJSON.checkFileTimeStamp();
             createJSONVariables();
        } else{
            var CartoDbClient = require('./cartodb_client').CartoDbClient;
            CartoDbClient.initialize();
            createJSONVariables();
        }
    })
})();

function createJSONVariables(){
    console.log('reading variables...');
    setTimeout(function(){
            companies = require('./companies.json'),
            modifyJSON = require('./helpers/modifyJSON').modifyJSON,
            licenses_sorted = modifyJSON.sortLicenses();
    }, 2000);
}


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
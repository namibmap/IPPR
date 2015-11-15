var CartoDB = require('cartodb'),
    jsonfile = require('jsonfile'),
    Secret = require('./secret'),
    client = new CartoDB({
        user: Secret.USER, 
        api_key: Secret.API_KEY
    });

function initialize() {
    // Connect to CartoDB's namibmap account and send query
    client.connect();
};

client.on('connect', function() {
    console.log("Connected to CartoDB!");

    //Retrieve list of all company names. Data is returned in JSON
    var sql_companies = "SELECT company_name FROM companies";
        
    //Retrieve list of concessions/blocks and PELs they are related to
    var sql_PEL_and_concessions = "SELECT concession_number, licenses.license_number FROM concessions, licenses WHERE concession_license_id = licenses.license_id";

     client.query(sql_companies, function(err, data){
            jsonfile.writeFile(__dirname + '/companies.json', data, function(err){
                //console.log(err);
            })
          })
          .query(sql_PEL_and_concessions, function(err, data){
            jsonfile.writeFile(__dirname + '/licenses.json', data, function(err){
                //console.log(err);
            })
            console.log('done writing file...');
          });
});

exports.CartoDbClient = {
    initialize: initialize
};
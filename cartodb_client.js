/**
 * https://github.com/Vizzuality/cartodb-nodejs
 * We use CartoDB's client for NodeJS to read
 * data from NamibMap's CartoDB account.
 * 
 * To connect with CartoDB's data, we have server.js
 * that contains the API_KEY.
 *
 * We query the DB for all concessions belonging to 
 * PELs belonging to companies. Then we parse the JSON
 * file and extract the information to populate the
 * companies list and the PELs/concessions in the
 * License_Holders website view.
 *
 */
var CartoDB = require('cartodb'),
    Secret = require('./secret'),
    client = new CartoDB({
        user: Secret.USER, 
        api_key: Secret.API_KEY
    }),
    licenses = {},
    companies = [];

function initialize() {
    // Connect to CartoDB's namibmap account and send query
    client.connect();    
};

client.on('connect', function() {
    console.log("Connected to CartoDB!");

    //Query NamibMap's CartoDB account to extract the related 
    //concessions, PELs and companies.
    var sql_concessions = 
      "SELECT concession_number, license_number, company_name " +
      "FROM concessions, licenses, companies, license_holdings " +
      "WHERE concessions.concession_license_id = licenses.license_id " +
        "AND license_holdings.license_holding_company_id = companies.company_id " +
        "AND license_holdings.license_holding_license_id = licenses.license_id;";

    client.query(sql_concessions, function(err,data){});
});

client.on('data', function(buffer) {
    console.log("Parsing CartoDb data...");    

    //Process CartoDB response JSON object to obtain the related 
    //PELs, concessions and companies for the front-end to hightlight 
    //them upon user interaction
    var CartoDbDataStream = JSON.parse(buffer);
    for (var i = 0; i < CartoDbDataStream.rows.length; i++) {
        if (CartoDbDataStream.rows[i].company_name) {
            if (companies.indexOf(CartoDbDataStream.rows[i].company_name) < 0){
                companies.push(CartoDbDataStream.rows[i].company_name);
            }
        }
        if (CartoDbDataStream.rows[i].license_number) {
            var key = CartoDbDataStream.rows[i].license_number;
            if (key in licenses) {
                licenses[key].push(CartoDbDataStream.rows[i].concession_number);
            } else {
                licenses[key] = [CartoDbDataStream.rows[i].concession_number];
            }
        }
    }
});

exports.CartoDbClient = {
    initialize: initialize,
    licenses: licenses,
    companies: companies
};

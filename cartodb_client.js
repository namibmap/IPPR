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

    //Retrieve list of all company names. Data is returned in JSON
    var sql_companies = "SELECT company_name FROM companies";
        
    //Retrieve list of concessions/blocks and PELs they are related to
    var sql_PEL_and_concessions = "SELECT concession_number, licenses.license_number  \
        FROM concessions, licenses \
        WHERE concession_license_id = licenses.license_id";

    client.query(sql_companies, function(err, data){})
          .query(sql_PEL_and_concessions, function(err, data){});
});

client.on('data', function(buffer) {
    console.log("Parsing CartoDb data...");    

    var CartoDbDataStream = JSON.parse(buffer);
    for (var i = 0; i < CartoDbDataStream.rows.length; i++) {
        if (CartoDbDataStream.rows[i].company_name) {
            companies.push(CartoDbDataStream.rows[i].company_name);
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
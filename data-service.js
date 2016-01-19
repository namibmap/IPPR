var secret = require('./secret'),
    fs = require('fs'),
    request = require('request'),
    jsonfile = require('jsonfile'),
    licenses = {},
    companies = {},
    polygonData = {},
    data, geoData;

function getGeoData(callback) {
    fs.exists('./GeoData.json', function(exists) {
        if (exists) {

            // Use the file on the filesystem to serve the data to the UI
            // TODO: Re-add the code that refreshes this data every x weeks
            console.log('Using the GeoJSON data saved on the file system...');
            filterGeoData(callback);

        } else {

            // Fetch the data from CartoDb and save to filesystem first
            console.log('About to connect to CartoDB to get GeoJSON data...');

            var geoDataRequest = 'https://namibmap.cartodb.com/api/v2/sql?format=GeoJSON&q=SELECT DISTINCT concessions_anonymized.the_geom, concessions_anonymized.concession_number, licenses_anonymized.license_number, companies_anonymized.company_name, companies_anonymized.company_id FROM concessions_anonymized, licenses_anonymized, companies_anonymized, license_holdings_anonymized WHERE concessions_anonymized.concession_license_id = licenses_anonymized.license_id AND license_holdings_anonymized.license_holding_company_id = companies_anonymized.company_id AND license_holdings_anonymized.license_holding_license_id = licenses_anonymized.license_id&api_key=' + secret.API_KEY;

            request(geoDataRequest, function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    jsonfile.writeFile(__dirname + '/GeoData.json', response, function(err) {
                        if (err) {
                            console.log("An error occurred while writing JSON file to system: " + err);
                        }
                        filterGeoData(callback);
                    })
                } else {
                    console.log("An error occurred while fetching the GeoJSON data from CartoDb. Error: " + error + ", Response: " + response);
                }
            });
        }
    });    
}

function filterGeoData(callback) {
    geoData = require('./GeoData'),
    data = JSON.parse(geoData.body);

    for (i = 0; i < data.features.length; i++) {

        // Licenses object will look like:
        // {"PEL001": [2012A, 1720], "PEL050": [2012A]...}
        var license_number = data.features[i].properties.license_number;
        if (license_number in licenses) {
            // Don't show the same concession twice under the same license
            var concession = data.features[i].properties.concession_number;
            if ( licenses[license_number].indexOf(concession) === -1 ) {
                licenses[license_number].push(data.features[i].properties.concession_number);
            }
        } else {
            licenses[license_number] = [data.features[i].properties.concession_number];
        }

        // Companies object will look like:
        // { "1": "Company X", "5": "Company Y"...}
        var company_id = data.features[i].properties.company_id;
        var company_name = data.features[i].properties.company_name;
        if (company_id && company_name) {
            companies[company_id] = company_name;
        }
    }

    polygonData['type'] = data.type;
    polygonData['features'] = data.features;
    
    if (typeof callback == "function") {
        callback();
    }
}

exports.DataService = {
    getGeoData : getGeoData,
    polygonData : polygonData,
    licenses : licenses,
    companies : companies
};

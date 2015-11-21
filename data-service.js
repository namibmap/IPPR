var secret = require('./secret'),
    fs = require('fs'),
    request = require('request'),
    jsonfile = require('jsonfile'),
    licenses = {},
    companies = [],
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

            var geoDataRequest = 'https://namibmap.cartodb.com/api/v2/sql?format=GeoJSON&q=SELECT concessions.the_geom, concession_number, license_number, company_name FROM concessions, licenses, companies, license_holdings WHERE concessions.concession_license_id = licenses.license_id AND license_holdings.license_holding_company_id = companies.company_id AND license_holdings.license_holding_license_id = licenses.license_id&api_key=' + secret.API_KEY;    

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
        var key = data.features[i].properties.license_number;
        if (key in licenses) {
            licenses[key].push(data.features[i].properties.concession_number);
        } else {
            licenses[key] = [data.features[i].properties.concession_number];
        }
        if (companies.indexOf(data.features[i].properties.company_name) < 0){
            companies.push(data.features[i].properties.company_name);
        }
    }

    if (typeof callback == "function") {
        callback();
    }
}

exports.DataService = {
    getGeoData : getGeoData,
    data : data,
    licenses : licenses,
    companies : companies
};
var licenses = require('../licenses.json'),
    licenses_sorted = {};


function sortLicenses(){
    for (i=0; i<licenses.rows.length; i++){
        var key = licenses.rows[i].license_number;
        if (key in licenses_sorted) {
            licenses_sorted[key].push(licenses.rows[i].concession_number);
        } else {
            licenses_sorted[key] = [licenses.rows[i].concession_number];
        }
    }
    return licenses_sorted;
}

exports.modifyJSON = {
    sortLicenses: sortLicenses
};
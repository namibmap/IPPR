var fs = require('fs');

function checkFileTimeStamp(){
    fs.stat('./companies.json', function(err, stats){
        var created = stats.mtime.getTime();
        var current = (new Date).getTime();
        if (moreThanTwoWeeks(created, current)){
            var CartoDbClient = require('../cartodb_client').CartoDbClient;
            CartoDbClient.initialize();
        }
    });
}

function moreThanTwoWeeks(a, b) {
    var diff = Math.abs(b - a);
    if (diff > 1209600){
        return true;
    }
    return false;
}

exports.updateJSON = {
    checkFileTimeStamp: checkFileTimeStamp
};
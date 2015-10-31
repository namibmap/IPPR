'use strict'
$(document).ready(function() {
    $('#datePicker')
        .datepicker({
            dateFormat: "dd/mm/yy"
        })
        .on('change', function(e) {
        });
}); 

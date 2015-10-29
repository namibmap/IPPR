'use strict'
$(document).ready(function() {
    $('#datePicker')
        .datepicker({
            dateFormat: "dd/mm/yy"
        })
        .on('change', function(e) {
        });
    $('#companyList').ready(function(){ 
		 populateList();
	});    
}); 

function populateList(){	//amend to read from JSON data  (JSON URL as parameter
/*	var i=0;
	var coType = "";
	//$('#companyList').attr("height") = "30px";
	for(i=0; i<15; i++){
		coType = "Partner";
		if(i%3 ==0){
			var coType = "Operator";
		}
		var listItem = $("<li class='list-group-item list-header'>" + coType + "</li>");
		if(listItem){
			$('#companyList').append(listItem);
		}
	}
*/	
	var companyURL = "http://localhost/IPPR/frontend/js/companyData.json";
	$.getJSON(companyURL, function(data){
	})
	.done(function( data ) {
 		$.each( data, function( key, val ) {
    		var listItem = $("<li class='list-group-item list-header'>" + val.operator.name + "</li>");
  			if(listItem){
				$('#companyList').append(listItem);
				var items = val.operator.partners;
				$.each(val.operator.partners, function(keyIndex, partnerVal){
					var partnerItem = $("<li class='list-group-item list-block'>" + partnerVal+ "</li>");
					$('#companyList').append(partnerItem);
				});
			}
  		});
  	});	
}
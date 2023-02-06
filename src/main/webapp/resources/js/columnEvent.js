/**
 *  fa-spin
 */

$(document).ready(function() {
	//const apiurl = "http://20.249.17.147:5000/v1/job";
	var targeturl = getContextPath() + "/getstate.do";
	
	
	setInterval(function() {
		$.ajax({
			url: targeturl,
			type: 'GET',
			//data: JSON.stringify(param),
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				
				for(var i = 0; i < result.length; i++){
					if(result[i].State == 1){
						$('#' + result[i].JobId).addClass('fa-spin');
					}
					else{
						$('#' + result[i].JobId).removeClass('fa-spin');
					}
				}
			},
			error: function(e) {
				console.log(e);
			}
		});
	}, 2000); // End setTimeout(function()

	



});



//function to validate input data
$(document).ready(function(){
	$.fn.validateData = (function(value,regrex){
		if(value.match(regrex)){
			return true;
		}else{
			return false;
		}
	})
})

//function to call response pop up
$.fn.checkStatus = function(id,message){ 
		if(id>0){
			$(".response-body").slideDown(200);
			$(".response-back-display").show(200);
			$("#response-text").text(message);
			}
		}
	$("#response-button").click(function(){
		$(".response-body").slideUp(200);
		$(".response-back-display").hide(200);
})
   

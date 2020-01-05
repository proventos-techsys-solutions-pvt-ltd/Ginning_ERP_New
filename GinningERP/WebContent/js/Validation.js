
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
   
//function to call delete pop up
$.fn.confirmDelete = function(id,message){ 
		if(id>0){
			$(".response-body1").slideDown(200);
			$(".response-back-display1").show(200);
			$("#response-text1").text(message);
			}
		}
	
	$("#response-button1").click(function(){
		$(".response-body1").slideUp(200);
		$(".response-back-display1").hide(200);
})

	$("#cancel-button1").click(function(){
		$(".response-body1").slideUp(200);
		$(".response-back-display1").hide(200);
})


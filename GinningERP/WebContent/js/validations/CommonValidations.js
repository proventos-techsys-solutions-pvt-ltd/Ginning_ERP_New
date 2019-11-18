/*----------------------------------Grading page validations------------------------------------*/

function gradingValidations(){
	var status = false;
	var length = $("[name='moisture']").length
	for(i=0; i<length; i++){
		$("[name='moisture']").css("border","1px solid #ced4da");
		if($("[name='moisture']").eq([i]).val()===""){
			status = false;
			$("[name='moisture']").eq([i]).css("border","1px solid red");
			break;
		}else{
			status = true;
		}
		console.log(i);
	}
	return status;
}

//Grading page validations
$.fn.gradingValidationsJ = function(){
	var status = false;
	var length = $("[name='description']").length
	for(i=0; i<length; i++){
		$("[name='description']").css("border","1px solid #ced4da");
		if($("[name='description']").eq([i]).val()===""){
			status = false;
			$("[name='description']").eq([i]).css("border","1px solid red");
			break;
		}else{
			status = true;
		}
		console.log(i);
	}
	return status;
}
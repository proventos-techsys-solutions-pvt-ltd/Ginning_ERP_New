/*----------------------------------Grading page validations------------------------------------*/

function gradingValidations(){
	var status = false;
	var inputLength = document.getElementsByName("moisture").length;
	for(i=0;i<inputLength;i++){
		inputBoxValue = document.getElementsByName("moisture")[i].value;
		if(inputBoxValue===""){
			break;
		}else{
			status = true;
		}
	}
	return status;
}

var uiController = (function(){

	
		var	rstNo = /^[0-9]+$/;
		var rst = document.getElementById("rst").value.trim();
	
	return{
		validate:function(){
			var rst = document.getElementById("rst").value.trim();
			if(rstNo.test(rst)){
					return true;
				}else{
					document.getElementById("rst").style.border ="1px red solid";
					document.getElementById("rst").title ="Enter only numbers";
				}
			}
		}
})();


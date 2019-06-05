/******************GETTING HEIGHT OF ADJACENT PANEL*********************/

var settingHeightofAdjacentPanels = (function(){
	var height = document.getElementById("getHeight").offsetHeight;
	document.getElementsByClassName("scroll")[0].style.height = (height-134.633) + "px";
})();
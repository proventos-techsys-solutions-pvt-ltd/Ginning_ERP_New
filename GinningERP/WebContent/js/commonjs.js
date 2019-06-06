/******************GETTING HEIGHT OF ADJACENT PANEL*********************/
function settingHeightofAdjacentPanels(getHeight,setHeight){
	var height = document.getElementById(getHeight).offsetHeight;
	document.getElementsByClassName(setHeight)[0].style.height = (height-26.75) + "px";
}

/*****************CALL MODAL METHOD***********************************/
function callModalPopup(callingId,calledId){
	document.getElementById(callingId).addEventListener("click",function(){
		$("#"+calledId).modal();
	})
}
/********************ACCESSING TABLE ROW & CELL INDEX**********************/
function getTableDataOnRowClick(tableBodyId,tableRow,className){
	var getTable = document.getElementById(tableBodyId);
	var getRows = getTable.rows;
	var getRowsLength = getRows.length;
	var getAllCells = [];
	var getCellsLengthInRow = [];
	var getCellsData = [];
	var rowData = [];
	for(i=0;i<getRowsLength;i++){
		var getCells = getRows[i].cells;
		var getCellsLength = getRows[i].cells.length;
		getAllCells.push(getCells);
		getCellsLengthInRow.push(getCellsLength);
	}
	for(i=0; i<getCellsLengthInRow[0];i++){//getting values from the row which is clicked
		var value1 = tableRow.cells[i].innerHTML;
		rowData.push(value1);
	}
	/*for(i=0;i<rowData.length;i++){//setting values retrieved from table
		document.getElementsByName(className)[i].value = rowData[i];
	}*/
	document.getElementsByName(className)[0].value = rowData[0];
	document.getElementsByName(className)[1].value = rowData[1];
	document.getElementsByName(className)[2].value = rowData[2];
	document.getElementsByName(className)[3].value = null;
	document.getElementsByName(className)[4].value = "Only";;
	document.getElementsByName(className)[5].value = rowData[3];
}
/*******************************/

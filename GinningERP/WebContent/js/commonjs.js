/******************GETTING HEIGHT OF ADJACENT PANEL*********************/
function settingHeightofAdjacentPanels(getHeight,setHeight){
	var height = document.getElementById(getHeight).offsetHeight;
	document.getElementsByClassName(setHeight)[0].style.height = (height-134.633) + "px";
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
	for(i=0; i<getCellsLengthInRow[0];i++){
		var value1 = tableRow.cells[i].innerHTML;
		rowData.push(value1);
	}
	for(i=0;i<rowData.length;i++){
		document.getElementsByName(className)[i].value = rowData[i];
	}
}
/*******************************/

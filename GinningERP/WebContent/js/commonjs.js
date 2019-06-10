/*************************SET TITLE OF REPORT PAGE********************/
function setTitle(title){
	document.getElementById("report-title").style.padding = ".5rem .5rem .5rem 0";
	document.getElementById("report-title").innerHTML = title;
}
function setSearchPlaceholder(placeholder){
	document.getElementById("searchInput").placeholder = placeholder;
}

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

function callModalPopupWithIndex(calling,calledId){
	var length = document.getElementsByName(calling).length;
	
	for(i=0; i<length; i++){
		document.getElementsByName(calling)[i].addEventListener("click",function(){
			$("#"+calledId).modal();
		})
	}
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
/********************************CREATE TABLE CODE***************************/
function createTable(column,heading){
	var table = document.createElement("table");
	table.setAttribute("id", "dataTable");
	document.body.appendChild(table);
	
	document.getElementById("dataTable").classList.add("table");
	document.getElementById("dataTable").classList.add("table-bordered");
	
	var thead = document.createElement("thead");
	thead.setAttribute("id", "dataTableHead");
	document.getElementById("dataTable").appendChild(thead);
	
	var tbody = document.createElement("tbody");
	tbody.setAttribute("id", "dataTableBody");
	document.getElementById("dataTable").appendChild(tbody);
	  
	for(i=0;i<=(column-1);i++){
		var th = document.createElement("th");
		document.getElementById("dataTableHead").appendChild(th);
		document.getElementsByTagName("th")[i].innerHTML = heading[i];
	}
 
}

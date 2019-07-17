class VendorMaster{
	constructor(tableId){
		this.tableId = tableId;
	}
	
	editVendorMaster(){
		var getTable = document.getElementById(this.tableId);//access table object
		var getRows = getTable.rows; //access row object
		var getRowsLength = getRows.length;//getting rows length
		var getAllCells = [];
		var getCellsLengthInRow = [];
		var getCellsData = [];
		var rowData = [];
		
		console.log(getRowsLength);
	}
	
}

editTableData = new VendorMaster("tableBody");
editTableData.editVendorMaster();


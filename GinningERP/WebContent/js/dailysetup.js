var uiController = (function(){
	
	var ids = { //HTML Element Objects Id's
			addCompanyId: "addCompany",
			companyTable:"companySetupTable"	
	}
	
	var addSetupCompanyRow = function(){//Table row add function
		
		var table = appController.hmtlPageObjectsMethod().companySetupTable; // fetch table object
		var rowNumber = table.rows.length;
		console.log("row number " +rowNumber);
		var row = table.insertRow(rowNumber); // 

		
		if(rowNumber===3 && table.rows[Number(rowNumber-1)].cells[0].children[0].value===""){
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);
			var cell6 = row.insertCell(5);
			var cell7 = row.insertCell(6);
			var cell8 = row.insertCell(7);
			var cell9 = row.insertCell(8);
			var cell10 = row.insertCell(9);
			var cell11 = row.insertCell(10);
			
			cell1.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell2.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell3.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell4.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell5.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell6.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell7.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell8.innerHTML = '<td><input class="form-control form-control-sm" name="firstChequeNo" id="firstChequeNo"></td>';
			cell9.innerHTML = '<td><input class="form-control form-control-sm" name="lastChequeNo" id="lastChequeNo"></td>';
			cell10.innerHTML = '<td><button type="button" class="btn btn-success btn-sm" id="" name="">Setup</button></td>';
			cell11.innerHTML = '<td><button type="button" class="btn btn-success btn-sm" id="" name="">Update</button></td>'
				
		}else if(table.rows[Number(rowNumber-1)].cells[0].children[0].value!==""){
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);
			var cell6 = row.insertCell(5);
			var cell7 = row.insertCell(6);
			var cell8 = row.insertCell(7);
			var cell9 = row.insertCell(8);
			var cell10 = row.insertCell(9);
			var cell11 = row.insertCell(10);
			
			cell1.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell2.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell3.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell4.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell5.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell6.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell7.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="" readonly></td>';
			cell8.innerHTML = '<td><input class="form-control form-control-sm" name="firstChequeNo" id="firstChequeNo"></td>';
			cell9.innerHTML = '<td><input class="form-control form-control-sm" name="lastChequeNo" id="lastChequeNo"></td>';
			cell10.innerHTML = '<td><button type="button" class="btn btn-success btn-sm" id="" name="">Setup</button></td>';
			cell11.innerHTML = '<td><button type="button" class="btn btn-success btn-sm" id="" name="">Update</button></td>'
		}
		
		
	}
	
	return {
		htmlElementIds:function(){
			return ids; // returns HMTL element Object Id's
		},
		
		tableRow:function(){
			return addSetupCompanyRow; // returns table row
		}
	
	}
	
})();


var appController = (function(){
	
	var hmtlPageObjects = {//Fetching the html objects 
			addCompanyButton: document.getElementById(uiController.htmlElementIds().addCompanyId),
			companySetupTable:document.getElementById(uiController.htmlElementIds().companyTable)
			
	}
	
	

	hmtlPageObjects.addCompanyButton.addEventListener("click",uiController.tableRow());//Event listener's 
	
	return {
		
		hmtlPageObjectsMethod:function(){
			return hmtlPageObjects;
		},
		
		test:function(){
			console.log(hmtlPageObjects.addCompanyButton);
		}
	}
	
})();
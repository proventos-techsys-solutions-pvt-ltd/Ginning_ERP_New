var uiController = (function(){
	
	var ids = { //HTML Element Objects Id's
			addCompanyId: "addCompany",
			companyTable: "companySetupTable",
			companyTableBody:"tableBody",
			lockUsersButton: "lockUsers",
			setupButton: "setup",
			updateButton:"update",
			companyId : "companyId",
			heapId : "todayHeap",
			chequeBankId : "chequeBankId",
			bonusAmountId: "bonusAmount"
	}
	
	var tableIds = {
			srNoTable : "srNoTable",
			dateTable : "dateTable",
			setupTimeTable : "setupTimeTable",
			discardTimeTable : "discardTimeTable",
			companyNameTable : "companyNameTable",
			heapTable : "heapTable",
			bankTable : "bankTable",
			submitButton : "setup",
			updateButton : "update"
	}
	
	var insertTableRow = function(){//insert table row
		
		if(table.rows[Number(rowNumber-1)].cells[1].children[0].value!==""){
			
		var table = appController.hmtlPageObjectsMethod().companySetupTableBody; // fetch table object
		var rowNumber = table.rows.length; // gives the row count
			
			var row = table.insertRow(rowNumber); // 
			
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
			
			cell1.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="setupId" readonly></td>';
			cell2.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="srNoTable" readonly></td>';
			cell3.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="dateTable" readonly></td>';
			cell4.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="setupTimeTable" readonly></td>';
			cell5.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="companyNameTable" readonly></td>';
			cell6.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="heapTable" readonly></td>';
			cell7.innerHTML = '<td><input type="text" class="form-control form-control-sm" id="" name="bankTable" readonly></td>';
			cell8.innerHTML = '<td><input class="form-control form-control-sm" name="firstChequeNo" id="firstChequeNo"></td>';
			cell9.innerHTML = '<td><input class="form-control form-control-sm" name="lastChequeNo" id="lastChequeNo"></td>';
			cell10.innerHTML = '<td><button type="button" class="btn btn-success btn-sm" id="" name="setup">Setup</button></td>';
			cell11.innerHTML = '<td><button type="button" class="btn btn-success btn-sm" id="" name="update">Update</button></td>'
				
				
			}
	}
	
	var addSetupCompanyRow = function(){//Table row add function
		
		if(appController.getDataForSetup().getCompanyName !== null && appController.getDataForSetup().getTodayHeap !== null && 
				appController.getDataForSetup().getBankName !== null &&
				appController.getDataForSetup().getBonusAmount !== null	
		){
			
			
		var table = appController.hmtlPageObjectsMethod().companySetupTableBody; // fetch table object
		var rowNumber = table.rows.length; // gives the row count
		console.log("new row number"+rowNumber);
			
		console.log(appController.getDataForSetup().getCompanyId);
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[0].querySelector('input').value = "1";
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[1].querySelector('input').value = "1";
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[2].querySelector('input').value = appController.getDateAndTime().date;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[3].querySelector('input').value = appController.getDateAndTime().time;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[4].querySelector('input').value = appController.getDataForSetup().getCompanyName;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[4].querySelector('input').setAttribute("data-company-id",appController.getDataForSetup().getCompanyId);
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[5].querySelector('input').value = appController.getDataForSetup().getTodayHeap;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[6].querySelector('input').value = appController.getDataForSetup().getBankName;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[6].querySelector('input').setAttribute("data-bank-id",appController.getDataForSetup().getBankId);
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[9].querySelector('button').disabled = false;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[10].querySelector('button').disabled = true;
				
				//insertTableRow();//calling insert row function
		
		}else{
			alert("PLEASE SELECT COMPANY NAME, HEAP AND BANK");
		}
		
		
		
		
		
	}
	
	/*var setupCompany = function(){
		var table = appController.hmtlPageObjectsMethod().companySetupTable; // fetch table object
		var rowNumber = table.rows.length;
		
		var hid = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[0].querySelector('input').value;
		var srNo = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[1].querySelector('input').value;
		var date = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[2].querySelector('input').value;
		var sTime = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[3].querySelector('input').value = appController.getDateAndTime().time;
		var dTime = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[4].querySelector('input').value = "00:00";
		var companyName = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[5].querySelector('input').innerHTML;
		var heap = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[6].querySelector('input').value;
		var bank = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[7].querySelector('input').value;
		var cStart = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[8].querySelector('input').value;
		var cEnd = document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[9].querySelector('input').value;
		
		document.getElementById(ids.companyTable).rows[(rowNumber-2)].cells[10].querySelector('button').disabled = true;
		
	}*/
	
	
	return {
		htmlElementIds:function(){
			return ids; // returns HMTL element Object Id's
		},
		
		tableRow:function(){
			return addSetupCompanyRow(); // returns table row
		},
		
		/*setupCompanyFun:function(){
			return setupCompany; // setup company for the day
		},*/
	
	}
	
})();




var appController = (function(){
	var hmtlPageObjects = {//Fetching the html objects 
			addCompanyButton : document.getElementById(uiController.htmlElementIds().addCompanyId),
			companySetupTable :document.getElementById(uiController.htmlElementIds().companyTable),
			companySetupTableBody :document.getElementById(uiController.htmlElementIds().companyTableBody),
			//lockUsers :document.getElementById(uiController.htmlElementIds().lockUsersButton),
			setupButton :document.getElementById(uiController.htmlElementIds().setupButton),
			updateButton :document.getElementById(uiController.htmlElementIds().updateButton)
	}
	
	//lock all buttons
	//hmtlPageObjects.lockUsers.disabled = "true";
	hmtlPageObjects.setupButton.disabled = "true";
	hmtlPageObjects.updateButton.disabled = "true";
	
	/*var lockAllUsers = function(){//this will lock all the users to setup new company
		alert("Do you want to end session of users?");
		hmtlPageObjects.addCompanyButton.disabled = false;
		hmtlPageObjects.lockUsers.disabled = "true";
	}*/
	
	var getDateAndTime = function(){ // get date and time 
		var todayDateAndTime = new Date();
		return 	dateAndTime={
					date :todayDateAndTime.getDate()+"/"+(todayDateAndTime.getMonth()+1)+"/"+todayDateAndTime.getFullYear() ,
					time :todayDateAndTime.getHours()+":"+todayDateAndTime.getMinutes()
		}
	} 
	
	hmtlPageObjects.addCompanyButton.addEventListener("click",uiController.tableRow);//Event listener's on click of add company button this should add a row 
	//hmtlPageObjects.setupButton.addEventListener("click",uiController.setupCompanyFun());//Event listener's call on click of submit button of table
	//hmtlPageObjects.lockUsers.addEventListener("click",lockAllUsers);//Event listener's
	
	
	var addDataForSetup = function(){ // getting data from input field to add to table
		var validData = null;
		var companyId = document.getElementById(uiController.htmlElementIds().companyId).value.trim();
		var companyName = document.getElementById(uiController.htmlElementIds().companyId).options[document.getElementById(uiController.htmlElementIds().companyId).selectedIndex].text.trim();
		var todayHeap =  document.getElementById(uiController.htmlElementIds().heapId).value.trim();
		var bankName = document.getElementById(uiController.htmlElementIds().chequeBankId).options[document.getElementById(uiController.htmlElementIds().chequeBankId).selectedIndex].text.trim();
		var bankId = document.getElementById(uiController.htmlElementIds().chequeBankId).value.trim();
		var bonusAmount = document.getElementById(uiController.htmlElementIds().bonusAmountId).value.trim();
				
		if(companyName ==="" || companyName ==="Select" && todayHeap ==="" || todayHeap ==="Select" && bankName ==="" || bankName ==="Select" && bonusAmount ==="" ){
			validData = {
					getCompanyName : null,
					getTodayHeap : null,
					getBankName : null,
					getBonusAmount: null
			};
		}else{
			validData = {
					getCompanyName : companyName,
					getTodayHeap : todayHeap,
					getBankName : bankName,
					getBonusAmount :bonusAmount,
					getCompanyId : companyId,
					getBankId : bankId
					
			};
		}
		return validData;
	}
	
	
	return {
		
		hmtlPageObjectsMethod:function(){
			return hmtlPageObjects;
		},
		
		getDataForSetup:function(){
			return addDataForSetup();// to fill row with data to setup company
		},
		
		getDateAndTime:function(){
			return getDateAndTime();
		},
		
		test:function(){
			console.log(hmtlPageObjects.addCompanyButton);
		}
	}
	
})();
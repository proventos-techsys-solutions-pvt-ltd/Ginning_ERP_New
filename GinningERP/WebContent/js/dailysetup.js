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
	
	var validationsCriteria = {
			gradeRate : /^[0-9]+$/
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
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[0].querySelector('input').value = "0";
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[1].querySelector('input').value = rowNumber;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[2].querySelector('input').value = appController.getDateAndTime().date;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[3].querySelector('input').value = appController.getDateAndTime().time;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[4].querySelector('input').value = appController.getDataForSetup().getCompanyName;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[4].querySelector('input').setAttribute("data-company-id",appController.getDataForSetup().getCompanyId);
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[5].querySelector('input').value = appController.getDataForSetup().getTodayHeap;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[6].querySelector('input').value = appController.getDataForSetup().getBankName;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[6].querySelector('input').setAttribute("data-bank-id",appController.getDataForSetup().getBankId);
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[7].querySelector('input').value = appController.getDataForSetup().getBonusAmount;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[10].querySelector('button').disabled = false;
				document.getElementById(ids.companyTableBody).rows[(rowNumber-1)].cells[11].querySelector('button').disabled = true;
				
				//insertTableRow();//calling insert row function
		
		}else{
			alert("PLEASE SELECT COMPANY NAME, HEAP AND BANK");
		}
	}
	return {
		htmlElementIds:function(){
			return ids; // returns HMTL element Object Id's
		},
		
		tableRow:function(){
			return addSetupCompanyRow(); // returns table row
		},
		validate:function(){
			return validationsCriteria();// return validation parameters
		}
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
	hmtlPageObjects.setupButton.disabled = "true";
	hmtlPageObjects.updateButton.disabled = "true";
	
	
	var getDateAndTime = function(){ // get date and time 
		var todayDateAndTime = new Date();
		return 	dateAndTime={
					date :todayDateAndTime.getDate()+"/"+(todayDateAndTime.getMonth()+1)+"/"+todayDateAndTime.getFullYear() ,
					time :todayDateAndTime.getHours()+":"+todayDateAndTime.getMinutes()+":"+todayDateAndTime.getSeconds()
		}
	} 
	
	hmtlPageObjects.addCompanyButton.addEventListener("click",uiController.tableRow);//Event listener's on click of add company button this should add a row 
	
	
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
			console.log("working");
		}
		return validData;
	}
	
	var validateInputData = function(rowIndex){//validations 
		var validate =  /^[0-9]+$/;
		var chequeValidate = /^[0-9]{6}$/;
		var globalValidationStatus = false;
		
		var firstChequeNo = document.getElementById(uiController.htmlElementIds().companyTableBody).rows[rowIndex].cells[8].querySelector('input');
		var lastChequeNo = document.getElementById(uiController.htmlElementIds().companyTableBody).rows[rowIndex].cells[9].querySelector('input');
		var lengthOfGradeRates = document.getElementsByName("gradeRate").length;
		
		if(chequeValidate.test(firstChequeNo.value.trim())){
			firstChequeNo.style.border = "2px solid green";
				if(chequeValidate.test(lastChequeNo.value.trim())){
					lastChequeNo.style.border = "2px solid green";
				}else{
					lastChequeNo.style.border = "2px solid red";
					return globalValidationStatus = false;
				}
		}else{
			firstChequeNo.style.border = "2px solid red";
			return globalValidationStatus = false;;
		}
		
		if(firstChequeNo.value.trim()>lastChequeNo.value.trim()){
			alert("Error in cheque numbers.")
			firstChequeNo.style.border = "2px solid red";
			lastChequeNo.style.border = "2px solid red";
			globalValidationStatus = false;
			
		}else{
			for(i=0;i<lengthOfGradeRates;i++){
				if(validate.test(document.getElementsByName("gradeRate")[i].value.trim())){
					globalValidationStatus = true;
				}else{
					globalValidationStatus = false;
					break;
				}
			}
			if(globalValidationStatus===false){
				alert("Only numbers are acceptable in General Grade Rate Table");
			}
		}
		console.log(globalValidationStatus);
		return globalValidationStatus;
		
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
		
		validateCompanyAndGradeData:function(rowIndex){
			return validateInputData(rowIndex);
		}
	}
	
})();

/***************************************************************************
 * 												Validations on pop up form for cash
 */
$(document).ready(function(){
	$("#addCashButton").click(function(){
		if($.fn.validateData($("#addCashDate").val(),/^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/)){
			$("#addCashDate").css("border","1px solid green");
			if($.fn.validateData($("#addCashReference").val(),/^[A-Za-z0-9 ]+$/)){
				$("#addCashReference").css("border","1px solid green");
				if($.fn.validateData($("#addCashVoucher").val(),/^[0-9 ]+$/)){
					$("#addCashVoucher").css("border","1px solid green");
					if(!$.fn.validateData($("#addCashAccount").val(),/^\s$/)){
						$("#addCashAccount").css("border","1px solid green");
						if($("#addCashDescription").val()!=""){
							$("#addCashDescription").css("border","1px solid green");
							if($.fn.validateData($("#addCashAmount").val(),/^[0-9]+[.][0-9]{2}$/)){
								$("#addCashAmount").css("border","1px solid green");
								if(!$.fn.validateData($("#addCashMode").val(),/^\s/)){
									$("#addCashForm").submit(); // Submitting form from here
								}else{
									alert("Please add the bank from setup bank.")
									$("#addCashAmount").css("border","1px solid red");
								}
							}else{
								alert("Please check the amount entered.")
								$("#addCashAmount").css("border","1px solid red");
							}
						}else{
							alert("Description cannot be left blank .")
							$("#addCashDescription").css("border","1px solid red");
						}
					}else{
						alert("Please add cash account using chart of accounts .")
						$("#addCashAccount").css("border","1px solid red");
					}
				}else{
					alert("Voucher number not present, contact administrator.")
					$("#addCashVoucher").css("border","1px solid red");
				}
			}else{
				alert("Check the reference.")
				$("#addCashReference").css("border","1px solid red");
			}
		}else{
			alert("Invalid date entered.")
			$("#addCashDate").css("border","1px solid red");
		}
	})
})


/***************************************************************************
 * 												Validations on pop up form for bank
 */
$(document).ready(function(){
	$("#submitBankAddition").click(function(){
		if($.fn.validateData($("#addBankDate").val(),/^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/)){
			$("#addBankDate").css("border","1px solid green");
			if($.fn.validateData($("#addBankReference").val(),/^[A-Za-z0-9 ]+$/)){
				$("#addBankReference").css("border","1px solid green");
				if($.fn.validateData($("#addBankVoucher").val(),/^[0-9 ]+$/)){
					$("#addBankVoucher").css("border","1px solid green");
					if(!$.fn.validateData($("#addBankAccountId").val(),/^\s$/)){
						$("#addBankAccountId").css("border","1px solid green");
						if($("#addBankDesc").val()!=""){
							$("#addBankDesc").css("border","1px solid green");
							if($.fn.validateData($("#addBankAmount").val(),/^[0-9]+[.][0-9]{2}$/)){
								$("#addBankAmount").css("border","1px solid green");
								if(!$.fn.validateData($("#addBankMode").val(),/^\s/)){
									$("#addBankForm").submit(); // Submitting form from here
								}else{
									alert("Please add the cash accounts from chart of accounts.")
									$("#addBankMode").css("border","1px solid red");
								}
							}else{
								alert("Please check the amount entered.")
								$("#addBankAmount").css("border","1px solid red");
							}
						}else{
							alert("Description cannot be left blank .")
							$("#addBankDesc").css("border","1px solid red");
						}
					}else{
						alert("Please bank accounts using bank setup .")
						$("#addBankAccountId").css("border","1px solid red");
					}
				}else{
					alert("Voucher number not present, contact administrator.")
					$("#addBankVoucher").css("border","1px solid red");
				}
			}else{
				alert("Check the reference.")
				$("#addBankReference").css("border","1px solid red");
			}
		}else{
			alert("Invalid date entered.")
			$("#addBankDate").css("border","1px solid red");
		}
	})
})




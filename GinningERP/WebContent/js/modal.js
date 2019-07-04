/**************RESET COMPLETE FORM ON RELOADING OF DOCUMENT***************/
document.getElementById("adminApprovalForm").reset();


/*********CALLING CASH PAYMENT MODAL*******************/
$('#cashCheckbox').on('change', function(e){
		   if(e.target.checked){
		     $('#cashPaymentModal').modal();
		   }
		});

/***********ACCESSING CASH PAYMENT MODAL DATA***************/

document.getElementById("cashPaymentSaveBtn").addEventListener("click",function(e){
	if(e.target.id = "cashPaymentSaveBtn"){
		alert("Cash Payment");
	}else if(e.target.id = "chequePaymentSaveBtn"){
		alert("Bank Payment");
	}
	getCashModalData();
	addPaymentDetailsToTable();
	document.getElementById("cashCheckbox").disabled = true; 
})

document.getElementById("cashPaymentClaseBtn").addEventListener("click",function(){
		document.getElementById("cashCheckbox").checked = false; 
})



/*********CALLING CHEQUE PAYMENT MODAL*******************/
$('#chequeCheckbox').on('change', function(e){
		   if(e.target.checked){
		     $('#chequePaymentModal').modal();
		   }
		});

/***************ACCESSING CHEQUE PAYMENT MODAL DATA***************************************************/
document.getElementById("chequePaymentSaveBtn").addEventListener("click",function(){
	getCashModalData();
	addPaymentDetailsToTable();
	document.getElementById("chequeCheckbox").disabled = true; 
})

document.getElementById("chequePaymentCloseBtn").addEventListener("click",function(){
		document.getElementById("chequeCheckbox").checked = false; 
})


/*********RTGS NEFT PAYMENT MODAL*******************/
$('#rtgsCheckbox').on('change', function(e){
		   if(e.target.checked){
		     $('#transferPaymentModal').modal();
		   }
		});
/***************ACCESSING RTGS NEFT PAYMENT MODAL DATA***************************************************/
document.getElementById("transferPaymentSaveBtn").addEventListener("click",function(){
	getCashModalData();
	addPaymentDetailsToTable();
	document.getElementById("rtgsCheckbox").disabled = true; 
})

document.getElementById("transferPaymentCloseBtn").addEventListener("click",function(){
		document.getElementById("rtgsCheckbox").checked = false; 
})



/**************************ADD TABLE HEADER ****************************/
function tableHeader(){
	var paymentTableDetails = document.getElementById("paymentDetailsTableHead");
	var headerRow = paymentTableDetails.insertRow(0);
	headerRow.className = "table-back";
	console.log(headerRow);
	var cell1 = headerRow.insertCell(0);
	var cell2 = headerRow.insertCell(1);
	var cell3 = headerRow.insertCell(2);
	var cell4 = headerRow.insertCell(3);
	var cell5 = headerRow.insertCell(4);
	
	cell1.innerText = "Mode of Payment";
	cell2.innerText = "Voucher No/Cheque No";
	cell3.innerText = "Amount";
	cell4.innerText = "";
	cell5.innerText = "";
	
}

/************************ACCESS DATA FROM FORMS*************************/
function getCashModalData(){
	var modeOfPayment = null;
	var voucherNoChequeNo = null;
	var amount = null;
	
	
	
	var cashReceiptNo = document.getElementById("cashReceiptNo").value; 
	var amountToPay = document.getElementById("amountToPayCash").value;
	
	var cashPaymentData = {
			"modeOfPayment" : "Cash",
			"cashReceiptNo" : cashReceiptNo,
			"amountToPay" : amountToPay
	}
	return cashPaymentData;
}


/***************PAYMENT DETAILS TABLE*************/
function addPaymentDetailsToTable(){
	if(document.getElementById("paymentDetailsTableHead").rows.length>0){
		
	}else{
		tableHeader();// ADDING TABLE HEADER ROW WHEN NO ROWS ARE PRESENT IN HEADER SECTION
	}
	
	var paymentTableDetails = document.getElementById("paymentDetailsTableBody");
	var rows = paymentTableDetails.rows;
	var rowLength = rows.length;
		
	var newRow = paymentTableDetails.insertRow(rowLength);
	var cell1 = newRow.insertCell(0);
	var cell2 = newRow.insertCell(1);
	var cell3 = newRow.insertCell(2);
	var cell4 = newRow.insertCell(3);
	var cell5 = newRow.insertCell(4);
	
	var tableData = getCashModalData();
	cell1.innerHTML = tableData.modeOfPayment;
	cell2.innerHTML = tableData.cashReceiptNo;
	cell3.innerHTML = tableData.amountToPay;
	cell4.innerHTML = "<img src='../property/img/edit.png' alt='Edit'>";
	cell5.innerHTML = "<img src='../property/img/delete.png' alt='Edit'>";;
	
	cell4.className = "text-center";
	cell5.className = "text-center";
	
}

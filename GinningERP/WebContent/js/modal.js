/**************RESET COMPLETE FORM ON RELOADING OF DOCUMENT***************/
document.getElementById("adminApprovalForm").reset();


/*********CALLING CASH PAYMENT MODAL*******************/
$('#cashCheckbox').on('change', function(e){
		   if(e.target.checked){
		     $('#cashPaymentModal').modal();
		   }
		});
/***********ACCESSING CASH PAYMENT MODAL DATA***************/
function getCashModalData(){
	var cashReceiptNo = document.getElementById("cashReceiptNo").value; 
	var vendorName = document.getElementById("vendorName").value;
	var amountToPay = document.getElementById("amountToPay").value;
	var cashPaymentData = {
			"cashReceiptNo" : cashReceiptNo,
			"vendorName" : vendorName,
			"amountToPay" : amountToPay
	}
	return cashPaymentData;
}
document.getElementById("cashPaymentSaveBtn").addEventListener("click",function(){
	getCashModalData();
	addPaymentDetailsToTable();
	document.getElementById("cashCheckbox").disabled = true; 
})

document.getElementById("cashPaymentClaseBtn").addEventListener("click",function(){
		document.getElementById("cashCheckbox").checked = false; 
})

/*********CHEQUE PAYMENT MODAL*******************/
$('#chequeCheckbox').on('change', function(e){
		   if(e.target.checked){
		     $('#chequePaymentModal').modal();
		   }
		});
/***************PAYMENT DETAILS TABLE*************/
function addPaymentDetailsToTable(){
	var paymentTableDetails = document.getElementById("paymentDetailsTable");
	var rows = paymentTableDetails.rows;
	var rowLength = rows.length;
	var newRow = paymentTableDetails.insertRow(rowLength);
	var cell1 = newRow.insertCell(0);
	var cell2 = newRow.insertCell(1);
	var cell3 = newRow.insertCell(2);
	var cell4 = newRow.insertCell(3);
	var date = Date(Date.now).toString();
	var tableData = getCashModalData();
	cell1.innerHTML = date;
	cell2.innerHTML = 'Cash';
	cell3.innerHTML = tableData.amountToPay;
	cell4.innerHTML = 'D';
	
	console.log(tableData);
}

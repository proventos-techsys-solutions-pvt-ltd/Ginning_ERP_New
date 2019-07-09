/**************RESET COMPLETE FORM ON RELOADING OF DOCUMENT***************/
document.getElementById("adminApprovalForm").reset();


/*********CALLING PAYMENT MODAL*******************/
$('#cashCheckbox').on('change', function(e){
		   if(e.target.checked){
		     $('#cashPaymentModal').modal();
		   }
		});

$('#chequeCheckbox').on('change', function(e){
	   if(e.target.checked){
	     $('#chequePaymentModal').modal();
	   }
	});

$('#rtgsCheckbox').on('change', function(e){
	   if(e.target.checked){
	     $('#transferPaymentModal').modal();
	   }
	});

/*************************************************************************************/
var paymentDetails = [];

function paymentModal(targetedId){
	paymentData = [];
	if(targetedId === "cashPaymentSaveBtn"){
		paymentData.splice(0,0,"Cash Payment");
		paymentData.splice(1,0,document.getElementById("cashReceiptNo").value);
		paymentData.splice(2,0,document.getElementById("amountToPayCash").value);
	}else if(targetedId === "chequePaymentSaveBtn"){
		paymentData.splice(0,0,"Bank Payment");
		paymentData.splice(1,0,document.getElementById("chequeNo").value);
		paymentData.splice(2,0,document.getElementById("chequeAmount").value);
	}else if(targetedId === "transferPaymentSaveBtn"){
		paymentData.splice(0,0,"RTGS/NEFT Payment");
		paymentData.splice(1,0,document.getElementById("rnno").value);
		paymentData.splice(2,0,document.getElementById("rnAmount").value);
	}
	return paymentData;
}


document.getElementById("cashPaymentSaveBtn").addEventListener("click",function(e){
	paymentDetails = paymentModal(e.target.id);
	addPaymentDetailsToTable();
	document.getElementById("cashCheckbox").disabled = true;
});
document.getElementById("chequePaymentSaveBtn").addEventListener("click",function(e){
	paymentDetails = paymentModal(e.target.id);
	addPaymentDetailsToTable();
	document.getElementById("chequeCheckbox").disabled = true;
});
document.getElementById("transferPaymentSaveBtn").addEventListener("click",function(e){
	paymentDetails = paymentModal(e.target.id);
	addPaymentDetailsToTable();
	document.getElementById("rtgsCheckbox").disabled = true;
});



/**************************ADD TABLE HEADER ****************************/
function tableHeader(){
	var paymentTableDetails = document.getElementById("paymentDetailsTableHead");
	var headerRow = paymentTableDetails.insertRow(0);
	headerRow.className = "table-back";

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


/***************ADDIND DATA TO PAYMENT DETAILS TABLE*************/
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
	
	cell1.innerHTML = paymentDetails[0];
	cell2.innerHTML = paymentDetails[1];
	cell3.innerHTML = paymentDetails[2];
	cell4.innerHTML = "<img src='../property/img/edit.png' alt='Edit' onclick='editRow(this)'>";
	cell5.innerHTML = "<img src='../property/img/delete.png' alt='Edit' onclick='deleteRow(this)'>";
	
	cell4.className = "text-center";
	cell5.className = "text-center";
	
}

/*******************************DELETING TABLE ROW***********************************************/
function deleteRow(r) {
	  var rowNo = r.parentNode.parentNode.rowIndex;
	  document.getElementById("paymentTable").deleteRow(rowNo);
	}

function editRow(r){
	var rowNo = r.parentNode.parentNode.rowIndex;
	var modeOfPayment = document.getElementById("paymentTable").rows[rowNo].cells[0].innerHTML;
	if(modeOfPayment === "Cash Payment"){
		 $('#cashPaymentModal').modal();
	}else if(modeOfPayment === "Bank Payment"){
		 $('#chequePaymentModal').modal();
	}else if(modeOfPayment === "RTGS/NEFT Payment"){
		$('#transferPaymentModal').modal();
	}
}
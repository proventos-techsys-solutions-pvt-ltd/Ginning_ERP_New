<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<html lang="en">
   <head>
     	<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap CSS -->
	  	<link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  	<link rel="stylesheet" href="../styles/WBStyle.css">
	  	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	  	<script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
     <title>Vendor Payment</title>
   </head>
<body>
	<%@include file="../accounts_operation_view/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2 tile-background-row border-bottom">
				<div class="col-md-3">
					<label class="lbl-rm-all">Search</label>
					<div class="d-flex justify-content-start align-items-center">
						<input type="text" class="form-control" id="searchInvoiceNo" name="searchInvoiceNo" placeholder="Invoice No">
						<button type="button" class="btn btn-success btn-no-radius" onclick="fetchInvoiceData(document.getElementById('searchInvoiceNo').value)">Fetch</button>
					</div>
					<div class="col-md-4">
						<button type="button" class="btn btn-success btn-no-radius lbl-rm-l" onclick="openInNewTab(document.getElementById('invoiceId').value)">Print Invoice</button>
					</div>
				</div>
				<div class="col-md-4 offset-md-5">
					<div class="d-flex justify-content-end align-items-center">
						<div class="log">
							<div class="heading">Balance Cash</div>
							<div class="amt">100000</div>
						</div>
						<div class="log">
							<div class="heading">Cheque Leaf</div>
							<div class="amt" id="chequeLeaves">12</div>
						</div>
						<div class="log">
							<div class="heading">Total RTGS/NEFT</div>
							<div class="amt">12</div>
						</div>
					</div>
				</div>
		</div>
		<div class="row tile-background-row">
			<div class="col-md-8">
				<div class="">
					<input type="hidden" id="invoiceId" name="invoiceId" />
					<input type="hidden" id="customerId" name="customerId" />
					<input type="hidden" id="customerName" name="customerName" />
					<div class="form-row">
						<div class="col-md-3">
							<label class="lbl-rm-all">Customer Information</label>
							<textarea id="customerInfo" name="customerInfo" class="form-control " rows="4" readonly></textarea>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Invoice No</label>
							<input type="text" class="form-control " id="invoiceNo" name="invoiceNo" readonly>
							<label class="lbl-rm-all">Date</label>
							<input type="text" class="form-control " id="invoiceDate" name="invoiceDate" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Total Amount to Pay</label>
							<input type="text" class="form-control " id="totalAmount" name="totalAmount" readonly>
							<label class="lbl-rm-all">Status</label>
							<input type="text" class="form-control " id="invoiceStatus" name="invoiceStatus" value="Paid" readonly>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cash</label>
							<div class="d-flex justify-content-start align-items-center">
								<input type="text" class="form-control" id="cashAmount" name="cashAmount" readonly>
								<button type="button" class="btn btn-success btn-no-radius" onclick="submitCash()" id="payCash">Pay</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque</label>
							<input type="text" class="form-control" id="chequeAmount" name="" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank</label>
							<select type="text" class="form-control" id="chequeBank" name="chequeBank">
								<c:Bank />
							</select>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque No</label>
							<input type="text" class="form-control" id="chequeNo" name="chequeNo" placeholder="Cheque No.">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Date</label>
							<input type="date" class="form-control" id="chequeDate" name="chequeDate" value="">
						</div>
						<div class="col-md-4">
							<label class="lbl-rm-all">Name</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control" id="nameOnCheque" name="nameOnCheque" placeholder="Name on Cheque">
							<button type="button" class="btn btn-success btn-no-radius" onclick="submitChequeData()" id="payCheque">Pay</button>&nbsp;
							<button type="button" class="btn btn-success btn-no-radius">Void</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">RTGS/NEFT</label>
							<input type="text" class="form-control" id="rtgsAmount" name="rtgsAmount" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank Name</label>
							<input type="text" class="form-control" id="rtgsBank" name="rtgsBank" placeholder="RTGS Bank Name">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Account No</label>
							<input type="text" class="form-control" id="rtgsAccountNo" name="rtgsAccountNo" placeholder="Account No.">
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">IFSC Code</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control" id="rtgsIfsc" name="rtgsIfsc" placeholder="IFSC Code">
							<button type="button" class="btn btn-success btn-no-radius" onclick="submitRtgsData()" id="payRtgs">Pay</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top" id="pdcCashSection" hidden>
						<div class="col-md-auto">
							<label class="lbl-rm-all">PDC Cash</label>
							<div class="d-flex justify-content-start align-items-center">
								<input type="text" class="form-control" id="pdcCashAmount" name="pdcCashAmount" readonly>
								<button type="button" class="btn btn-success btn-no-radius" onclick="submitPdcCash()" id="payPdcCash">Pay</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top" id="pdcRtgsSection" hidden>
						<div class="col-md-auto">
							<label class="lbl-rm-all">PDC RTGS/NEFT</label>
							<input type="text" class="form-control" id="pdcRtgsAmount" name="pdcRtgsAmount" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank Name</label>
							<input type="text" class="form-control" id="pdcRtgsBank" name="pdcRtgsBank" placeholder="RTGS Bank Name">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Account No</label>
							<input type="text" class="form-control" id="pdcRtgsAccountNo" name="pdcRtgsAccountNo" placeholder="Account No.">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">RTGS Date</label>
							<input type="date" class="form-control" id="pdcRtgsDate" name="pdcRtgsDate" readonly>
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">IFSC Code</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control" id="pdcRtgsIfsc" name="pdcRtgsIfsc" placeholder="IFSC Code">
							<button type="button" class="btn btn-success btn-no-radius" onclick="submitPdcRtgs()" id="payPdcRtgs">Pay</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top" id="pdcChequeSection" hidden>
						<div class="col-md-auto">
							<label class="lbl-rm-all">PDC</label>
							<input type="text" class="form-control" id="pdcChequeAmount" name="pdcChequeAmount" readonly>
							<input type="hidden" id="pdcId" name="pdcId" />
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank</label>
							<select class="form-control" id="pdcBank" name="pdcBank">
								<c:Bank />
							</select>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">PDC No</label>
							<input type="text" class="form-control" id="pdcNo" name="pdcNo" placeholder="Cheque No.">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">PDC Date</label>
							<input type=date class="form-control" id="pdcDate" name="pdcDate" value="" readonly>
						</div>
						<div class="col-md-4">
							<label class="lbl-rm-all">Payee Name</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control" id="pdcPayeeName" name="pdcPayeeName" placeholder="Name on Cheque">
							<button type="button" class="btn btn-success  btn-no-radius" id="payPdc" onclick="submitPdc()">Pay</button>&nbsp;
							<button type="button" class="btn btn-success  btn-no-radius">Void</button>
							</div>
						</div>
					</div>
				<form id='paymentForm' action="../processing/submitPayment.jsp" target="_blank">
					<input type="hidden" id="data" name="data" />	
				</form>
				</div>
			</div>
			<div class="col-md-4 border-left">
				<div class="tile-background-row">
				<table class="table table-bordered">
					<thead class="table-back">
						<tr>
							<th>Invoice No</th>
							<th>Customer Name</th>
							<th>RST</th>
							<th>Amount to Pay</th>
						</tr>
					</thead>
					<tbody id="tableBody">
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	
	
	//Get current date and time
	function setCurrentDate(){
		var today = new Date();
		 var dd = today.getDate();
		    var mm = today.getMonth()+1; //January is 0!
		    var yyyy = today.getFullYear();

		    if(dd<10){
		        dd='0'+dd;
		    } 
		    if(mm<10){
		        mm='0'+mm;
		    } 

		    todayDate = yyyy+'-'+mm+'-'+dd; 
		    formattedDate = dd+'-'+mm+'-'+yyyy;
		var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
		var dateTime = formattedDate+' '+time;
		
		document.getElementById("chequeDate").value = todayDate;
	}
	
	
	function getPendingInvReport(){
		var url="${pageContext.request.contextPath}/processing/pendingInvoiceReport.jsp";
		if(window.XMLHttpRequest){  
			invReport=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			invReport=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			invReport.onreadystatechange=getInvReport;  
			console.log("AJAX Req sent");
			invReport.open("GET",url,true);  
			invReport.send();  
		}catch(e){alert("Unable to connect to server");}
	}

	//Get response of Daily Setup Check performed by AJAX
	function getInvReport(){
		if(invReport.readyState == 4){
			var response = this.response.trim();
			var data = JSON.parse(response);
			console.log(data);
			setPendingTable(data);
		} 
	}
	
	function setPendingTable(data){
		
		var table = document.getElementById("tableBody");
		for(i=0;i<data.length;i++){
			var noOfRows = table.rows.length;
			var row = table.insertRow(noOfRows);
			
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			
			cell1.innerHTML = data[i].invoiceNo;
			cell2.innerHTML = data[i].customerName;
			cell3.innerHTML = data[i].rst;
			cell4.innerHTML = data[i].pendingAmount;
		}
	}
	
	
	//Send AJAX req to chech Daily setup
	function checkDailySetup(){
		var url="${pageContext.request.contextPath}/processing/checkDailySetup.jsp";
		if(window.XMLHttpRequest){  
			dailySetup=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			dailySetup=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			dailySetup.onreadystatechange=getDailySetupRecords;  
			console.log("AJAX Req sent");
			dailySetup.open("GET",url,true);  
			dailySetup.send();  
		}catch(e){alert("Unable to connect to server");}
	}

	//Get response of Daily Setup Check performed by AJAX
	function getDailySetupRecords(){
		if(dailySetup.readyState == 4){
			var response = this.response.trim();
			console.log("daily Setup---"+response);
			if(Number(response) > 0){
				$.unblockUI
			}
			else if(Number(response) <= 0){
				$.blockUI();
			}
		} 
	}
	
	window.onload = function(){
		getDailySetupData();
		getPendingInvReport();
	}
	
	function getDailySetupData(){
		url = "../processing/setDailyInvSetup.jsp";
		if(window.XMLHttpRequest){  
			fetchDailySetupRequest=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchDailySetupRequest=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			fetchDailySetupRequest.onreadystatechange=fetchDailySetupData;  
			console.log("AJAX Req sent");
			fetchDailySetupRequest.open("GET",url,true);  
			fetchDailySetupRequest.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function  fetchDailySetupData(){
		if(fetchDailySetupRequest.readyState == 4){
			var response = this.response.trim();
			var data = JSON.parse(response);
			setDailySetupData(data);
		}
	}
	
	function setDailySetupData(data){
			var bank =  document.getElementById('chequeBank');
			for(i=0;i<bank.options.length;i++){
				if(data.bankId != Number(bank.options[i].value)){
					bank.options[i].disabled = true;
				}
				else if(data.bankId === Number(bank.options[i].value)){
					bank.options[i].selected = true;
				}
			}
			
			var bank =  document.getElementById('pdcBank');
			for(i=0;i<bank.options.length;i++){
				if(data.bankId != Number(bank.options[i].value)){
					bank.options[i].disabled = true;
				}
				else if(data.bankId === Number(bank.options[i].value)){
					bank.options[i].selected = true;
				}
			}
			document.getElementById('chequeLeaves').innerHTML = data.totalCheques;
		}
	
	function fetchInvoiceData(invoiceNo){
			url = "../processing/getDataForOperator.jsp?invoiceNo="+invoiceNo;
			if(window.XMLHttpRequest){  
				fetchInvoiceReq=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchInvoiceReq=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				fetchInvoiceReq.onreadystatechange=getInvoiceData;  
				console.log("AJAX Req sent");
				fetchInvoiceReq.open("GET",url,true);  
				fetchInvoiceReq.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		
		//Get data from AJAX request
		function getInvoiceData(){
			if(fetchInvoiceReq.readyState == 4){
				var response = this.response.trim();
				console.log(response);
				if(Number(response) === 0){
					window.alert('Invalid Invoice Number entered. Please check the Invoice No. and search again.')
				}else{
					var data = JSON.parse(response);
					setData(data);
				}
			}
		}
		
		function setData(data){
			
			/* document.getElementById('pdcAmount').disabled = false ;
			document.getElementById('pdcNo').disabled = false ;
			document.getElementById('pdcDate').disabled = false ;
			document.getElementById('pdcPayeeName').disabled = false ;
			document.getElementById('pdcBank').disabled = false ;
			document.getElementById('pdcSubmit').disabled = false ;
			document.getElementById('pdcAmount').value = "" ;
			document.getElementById('pdcNo').value = "" ;
			document.getElementById('pdcDate').value = "" ;
			document.getElementById('pdcPayeeName').value = "" ; */
			
			document.getElementById('payCash').disabled = false ;
			document.getElementById('payCheque').disabled = false ;
			document.getElementById('payRtgs').disabled = false ;
			document.getElementById('payPdcCash').disabled = false ;
			document.getElementById('payPdcRtgs').disabled = false ;
			document.getElementById('payPdc').disabled = false ;
			
			
			document.getElementById('invoiceNo').value = data.invoiceNo ;
			document.getElementById('invoiceId').value = data.invoiceId;
			document.getElementById('customerId').value = data.customerId;
			document.getElementById('customerInfo').value = data.customerName +'\n' + data.customerAddress + '\n' + data.customerMobile  ;
			document.getElementById('customerName').value = data.customerName;
			document.getElementById('invoiceDate').value = data.invoiceDate ;
			document.getElementById('totalAmount').value = data.totalAmount ;
			document.getElementById('invoiceStatus').value = data.paidByOperator ;
			document.getElementById('cashAmount').value = data.cashAmount ;
			document.getElementById('nameOnCheque').value = data.customerName ;
			document.getElementById('chequeAmount').value = data.chequeAmount ;
			document.getElementById('chequeNo').value = "" ;
			document.getElementById('rtgsAmount').value = data.rtgsAmount ;
			document.getElementById('rtgsBank').value = "" ;
			document.getElementById('rtgsAccountNo').value = "" ;
			document.getElementById('rtgsIfsc').value = "" ;
			
			if(data.hasOwnProperty('pdcAmount')){
				if(data.pdcPaymentMode === 'CHEQUE'){
					document.getElementById('pdcId').value = data.pdcId ;
					document.getElementById('pdcChequeAmount').value = data.pdcAmount ;
					document.getElementById('pdcNo').value = "" ;
					document.getElementById('pdcDate').value = data.pdcPayDate ;
					document.getElementById('pdcPayeeName').value = "" ;
					document.getElementById('pdcPayeeName').value = data.customerName;
					document.getElementById('pdcChequeSection').hidden=false;
					document.getElementById('pdcCashSection').hidden=true;
					document.getElementById('pdcRtgsSection').hidden=true;
				}else if(data.pdcPaymentMode === 'RTGS'){
					document.getElementById('pdcId').value = data.pdcId ;
					document.getElementById('pdcRtgsAmount').value = data.pdcAmount;
					document.getElementById('pdcRtgsBank').value = '' ;
					document.getElementById('pdcRtgsAccountNo').value = '' ;
					document.getElementById('pdcRtgsIfsc').value = '' ;
					document.getElementById('pdcRtgsDate').value = data.pdcPayDate;
					document.getElementById('pdcRtgsSection').hidden=false;
					document.getElementById('pdcChequeSection').hidden=true;
					document.getElementById('pdcCashSection').hidden=true;
				}else if(data.pdcPaymentMode === 'CASH'){
					document.getElementById('pdcId').value = data.pdcId ;
					document.getElementById('pdcCashAmount').value = data.pdcAmount;
					document.getElementById('pdcCashSection').hidden=false;
					document.getElementById('pdcRtgsSection').hidden=true;
					document.getElementById('pdcChequeSection').hidden=true;
				}
			}else if(!data.hasOwnProperty('pdcAmount')){
				document.getElementById('pdcCashSection').hidden=true;
				document.getElementById('pdcRtgsSection').hidden=true;
				document.getElementById('pdcChequeSection').hidden=true;
				
			}
			
			setCurrentDate();
		}
		
		
		function submitChequeData(){
			
			var chequeJson = {};
			chequeJson['dataType'] = 'cheque';
			chequeJson['chequeAmount']= document.getElementById('chequeAmount').value;
			var bank = document.getElementById('chequeBank');
			chequeJson['chequeBankId'] = bank.value;
			chequeJson['chequeBankName'] = bank.options[bank.selectedIndex].text.split('-')[0].trim();
			chequeJson['chequeNo'] = document.getElementById('chequeNo').value;
			chequeJson['chequeDate'] = document.getElementById('chequeDate').value;
			chequeJson['chequeName'] = document.getElementById('nameOnCheque').value;
			chequeJson['invoiceId'] = document.getElementById('invoiceId').value;
			chequeJson['invoiceNo'] = document.getElementById('invoiceNo').value;
			chequeJson['customerId'] = document.getElementById('customerId').value;
			chequeJson['customerName'] = document.getElementById('customerName').value;
			
			var chequeInfo = JSON.stringify(chequeJson);
			document.getElementById('data').value = chequeInfo;
			console.log(chequeInfo);
			document.getElementById('payCheque').disabled = true;
			document.getElementById('paymentForm').submit();
			//submitDataAjax(chequeInfo);
		}
		
	function submitRtgsData(){
			
			var rtgsJson = {};
			rtgsJson['dataType'] = 'rtgs';
			rtgsJson['rtgsAmount']= document.getElementById('rtgsAmount').value;
			rtgsJson['rtgsBank'] = document.getElementById('rtgsBank').value;
			rtgsJson['rtgsAccountNo'] = document.getElementById('rtgsAccountNo').value;
			rtgsJson['rtgsIfsc'] = document.getElementById('rtgsIfsc').value;
			rtgsJson['rtgsDate'] = document.getElementById('invoiceDate').value;
			rtgsJson['invoiceId'] = document.getElementById('invoiceId').value;
			rtgsJson['invoiceNo'] = document.getElementById('invoiceNo').value;
			rtgsJson['customerId'] = document.getElementById('customerId').value;
			rtgsJson['customerName'] = document.getElementById('customerName').value;
			
			var rtgsInfo = JSON.stringify(rtgsJson);
			console.log(rtgsInfo);
			document.getElementById('data').value = rtgsInfo;
			document.getElementById('payRtgs').disabled = true;
			//document.getElementById('paymentForm').submit();
			submitDataAjax(rtgsInfo);
		}
	
	function submitCash(){
		var cashJson = {};
		
		cashJson['dataType'] = 'cash';	
		cashJson['cashAmount'] = document.getElementById('cashAmount').value;
		cashJson['invoiceId'] = document.getElementById('invoiceId').value;
		cashJson['customerName'] = document.getElementById('customerName').value;
		cashJson['customerId'] = document.getElementById('customerId').value;
		cashJson['invoiceNo'] = document.getElementById('invoiceNo').value;
		
		var cashInfo = JSON.stringify(cashJson);
		document.getElementById('data').value = cashInfo;
		document.getElementById('payCash').disabled = true;
		
		//document.getElementById('paymentForm').submit();
		submitDataAjax(cashInfo);
	}
	
   function submitPdc(){
	   
	   var pdcJson = {};
	   
	   pdcJson['dataType'] = 'pdc';
	   pdcJson['pdcId'] =  document.getElementById('pdcId').value;
	   pdcJson['invoiceId'] = document.getElementById('invoiceId').value;
	   pdcJson['pdcAmount'] =  document.getElementById('pdcChequeAmount').value;
	   pdcJson['pdcNo'] = document.getElementById('pdcNo').value;
	   pdcJson['pdcDate'] = document.getElementById('pdcDate').value;
	   pdcJson['pdcPayeeName'] = document.getElementById('pdcPayeeName').value;
	   pdcJson['pdcBank'] = document.getElementById('pdcBank').value;
	   var bank = document.getElementById('pdcBank');
	   pdcJson['pdcBankName'] = bank.options[bank.selectedIndex].text.split('-')[0].trim();
	   pdcJson['customerId'] = document.getElementById('customerId').value;
	   pdcJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	   
	   var pdcInfo = JSON.stringify(pdcJson);
	   console.log(pdcInfo);
	   document.getElementById('data').value = pdcInfo;
	   document.getElementById('payPdc').disbled = true;
	   
	   document.getElementById('paymentForm').submit();
	   //submitDataAjax(pdcInfo);
   }	
   
   function submitPdcRtgs(){
	   
	   var pdcRtgsJson = {};
	   
	   pdcRtgsJson['dataType'] = 'pdcRtgs';
	   pdcRtgsJson['pdcId'] = document.getElementById('pdcId').value;
	   pdcRtgsJson['invoiceId'] = document.getElementById('invoiceId').value;
	   pdcRtgsJson['pdcRtgsAmount'] =  document.getElementById('pdcRtgsAmount').value;
	   pdcRtgsJson['pdcRtgsBank'] = document.getElementById('pdcRtgsBank').value;
	   pdcRtgsJson['pdcRtgsAccountNo'] = document.getElementById('pdcRtgsAccountNo').value;
	   pdcRtgsJson['pdcRtgsIfsc'] = document.getElementById('pdcRtgsIfsc').value;
	   pdcRtgsJson['pdcRtgsDate'] = document.getElementById('pdcRtgsDate').value;
	   pdcRtgsJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	   pdcRtgsJson['customerId'] = document.getElementById('customerId').value;
	   pdcRtgsJson['customerName'] = document.getElementById('customerName').value;
		
		var pdcRtgsInfo = JSON.stringify(pdcRtgsJson);
		console.log(pdcRtgsJson);
		document.getElementById('data').value = pdcRtgsInfo;
		document.getElementById('payPdcRtgs').diabled = true;
		//document.getElementById('paymentForm').submit();
		submitDataAjax(pdcRtgsInfo);

   }
   
   function submitPdcCash(){
	   var cashJson = {};
		
		cashJson['dataType'] = 'cash';	
		cashJson['pdcCashAmount'] = document.getElementById('cashAmount').value;
		cashJson['invoiceId'] = document.getElementById('invoiceId').value;
		cashJson['customerName'] = document.getElementById('customerName').value;
		cashJson['customerId'] = document.getElementById('customerId').value;
		cashJson['invoiceNo'] = document.getElementById('invoiceNo').value;
		
		var cashInfo = JSON.stringify(cashJson);
		document.getElementById('data').value = cashInfo;
		document.getElementById('payPdcCash').disabled = true;
		//document.getElementById('paymentForm').submit();
		submitDataAjax(cashInfo);
   }
		
	checkDailySetup();
	setCurrentDate()
	
	function openInNewTab(invoiceId) {
		  var win = window.open("../report/InvoicePDFPrintOnly.jsp?invoiceId="+invoiceId, '_blank');
		  win.focus();
		}
	
	document.addEventListener('click',function(e){
		if(e.srcElement.tagName === 'TR' && e.srcElement.parentNode.id === 'tableBody'){
			var invoiceNo = e.srcElement.children[0].innerHTML.trim();
			fetchInvoiceData(invoiceNo);
		}
		if(e.srcElement.tagName === 'TD' && e.srcElement.parentNode.parentNode.id === 'tableBody'){
			var row = e.srcElement.parentNode;
			var invoiceNo = row.children[0].innerHTML.trim();
			fetchInvoiceData(invoiceNo);
		}
	})
	
	function submitDataAjax(data){
		console.log(data);
		url = "../processing/submitPayment.jsp?data="+data;
		if(window.XMLHttpRequest){  
			submitData=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			submitData=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			submitData.onreadystatechange=getResponse;  
			console.log("AJAX Req sent");
			submitData.open("GET",url,true);  
			submitData.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function getResponse(){
		if(submitData.readyState == 4){
			var response = this.response.trim();
			console.log(response);
		}
	}
	
	</script>
</body>
</html>	
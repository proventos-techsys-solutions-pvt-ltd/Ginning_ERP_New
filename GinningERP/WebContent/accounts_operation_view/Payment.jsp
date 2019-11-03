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
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	  	<script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
     <title>Vendor Payment</title>
   </head>
<body>
	<%@include file="../accounts_operation_view/NavBar.jsp" %>
	<div class="container-fluid">
		<div class="row mt-2 tile-background-row border-bottom">
				<div class="col-md-5">
					<label class="lbl-rm-all">Search</label>
					<div class="d-flex justify-content-start align-items-center">
						<input type="text" class="form-control" id="searchInvoiceNo" name="searchInvoiceNo" placeholder="Invoice No">
						<button type="button" class="btn btn-success btn-no-radius" onclick="fetchInvoiceData(document.getElementById('searchInvoiceNo').value)">Fetch</button>
						<button type="button" class="btn btn-success btn-no-radius lbl-rm-l btn_width-for-justify ml-1" onclick="openInNewTab(document.getElementById('invoiceId').value)">Print Invoice</button>
					</div>
				</div>
				<div class="col-md-4 offset-md-3">
					<div class="d-flex justify-content-end align-items-center">
					<!--<div class="log">
							<div class="heading">Balance Cash</div>
							<div class="amt">100000</div>
						</div>  -->	
						<div class="log">
							<div class="heading">Cheque Leaf</div>
							<div class="amt" id="chequeLeaves">0</div>
						</div>
						<div class="log">
							<div class="heading">Total RTGS/NEFT</div>
							<div class="amt" id="rtgsCount">11</div>
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
					<input type="hidden" id="companyId" name="companyId" />
					<input type="hidden" id="accountPayableId" name="accountPayableId" />
					<input type="hidden" id="dsBankId" name="dsBankId" />
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
					<div class="col-md-3">
						<input type="hidden" id="cashPaymentStatus" value="0" />
							<label class="lbl-rm-all">Cash Account</label>
							<div class="d-flex justify-content-start align-items-center">
								<select class="form-control" id="cashAccountId" name="cashAccountId">
									<c:CashLedgerTag/>
								</select>
							</div>
						</div>
					<div class="col-md-auto">
							<label class="lbl-rm-all">Cash</label>
							<div class="d-flex justify-content-start align-items-center">
								<input type="text" class="form-control input-cash" id="cashAmount" name="cashAmount" readonly>
							</div>
					</div>
					<div class="form-row border-top">
					<input type="hidden" id="chequeId" value="0" />
					<input type="hidden" id="chequePaymentStatus" value="0" />
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque</label>
							<input type="text" class="form-control input-cash" id="chequeAmount" value="0" name="" readonly>
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
							<button type="button" class="btn btn-success btn-no-radius" onclick="PrintChequeData(document.getElementById('chequeId').value)" id="payCheque">Print</button>&nbsp;
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<input type="hidden" id="rtgsPaymentStatus" value="0" />
						<div class="col-md-auto">
							<label class="lbl-rm-all">RTGS/NEFT</label>
							<input type="text" class="form-control input-cash" id="rtgsAmount" name="rtgsAmount" value="0" readonly>
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
							</div>
						</div>
					</div>
					<div class="form-row border-top" id="pdcCashSection" style="width:100%;" hidden>
						<input type="hidden" id="pdcCashPaymentStatus" value="0" />
						<div class="col-md-4">
							<label class="lbl-rm-all">PDC Cash Amount</label>
							<input type="text" class="form-control input-cash" id="pdcCashAmount" name="pdcCashAmount" value="0" readonly>
						</div>
							<div class="col-md-4">
							<label class="lbl-rm-all">PDC Cash Account</label>
								<select class="form-control" id="pdcCashAccountId" name="pdcCashAccountId">
									<option>
										<c:CashLedgerTag/>
									</option>
								</select>
							</div>
							</div>
					<div class="form-row border-top" id="pdcRtgsSection" hidden>
						<input type="hidden" id="pdcRtgsPaymentStatus" value="0" />
						<div class="col-md-auto">
							<label class="lbl-rm-all">PDC RTGS/NEFT</label>
							<input type="text" class="form-control input-cash" id="pdcRtgsAmount" name="pdcRtgsAmount" value="0" readonly>
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
							</div>
						</div>
					</div>
					<div class="form-row border-top" id="pdcChequeSection" hidden>
						<input type="hidden" id="pdcChequeId" value="0"/>
						<input type="hidden" id="pdcChequePaymentStatus" value="0" />
						<div class="col-md-auto">
							<label class="lbl-rm-all">PDC</label>
							<input type="text" class="form-control input-cash" id="pdcChequeAmount" name="pdcChequeAmount" value="0" readonly>
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
							<button type="button" class="btn btn-success  btn-no-radius" id="payPdc" onclick="PrintChequeData(document.getElementById('pdcChequeId').value)">Print</button>&nbsp;
							</div>
						</div>
					</div>
					<div class="form-row border-top" style="width:100%;" >
					<div class="col-md-12">
						<div class="d-flex justify-content-end align-items-center">
							<button type="button" class="btn btn-success  btn-no-radius" id="submitButton" >Submit Payment</button>
							<button type="button" class="btn btn-success  btn-no-radius ml-1" id="" onclick="location.reload()">Reset</button>
						</div>
					</div>
					</div>
				<form id='paymentForm' action="../processing/submitPayment.jsp" target="_blank">
					<input type="hidden" id="data" name="data" />	
				</form>
				</div>
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
	
	<!-- Response modal pop up -->
<div class="response-back-display"></div>
<div class="response-body">
	<div class="response-header">
		<h5>Information</h5>
	</div>
	<div class="response-content">
		<div class="d-flex justify-content-center align-items-center">
		<h5 id="response-text" class="ml-4"></h5>
		</div>
	</div>
	<div class="response-footer">
		<button type="button" class="btn btn-success btn-response" id="response-button">Ok</button>
	</div>
</div>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/Validation.js"></script>
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
				$.unblockUI();
			}
			else if(Number(response) <= 0){
				$.blockUI();
			}
		} 
	}
	
	window.onload = function(){
		getDailySetupData();
		getPendingInvReport();
	};
	
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
			var chequeBank =  document.getElementById('chequeBank');
			for(i=0;i<chequeBank.options.length;i++){
				if(chequeBank.bankId != Number(chequeBank.options[i].value)){
					chequeBank.options[i].disabled = true;
				}
				else if(chequeBank.bankId === Number(chequeBank.options[i].value)){
					chequeBank.options[i].selected = true;
			}
			
			var pdcBank =  document.getElementById('pdcBank');
			for(i=0;i<pdcBank.options.length;i++){
				if(pdcBank.bankId != Number(pdcBank.options[i].value)){
					pdcBank.options[i].disabled = true;
				}
				else if(data.bankId === Number(pdcBank.options[i].value)){
					pdcBank.options[i].selected = true;
				}
			}
			
			var cashAccounts = document.getElementById('cashAccountId');
			for(i=0;i<cashAccounts.options.length;i++){
				if(data.companyId != Number(cashAccounts.options[i].getAttribute('data-company-id'))){
					cashAccounts.options[i].disabled = true;
				}
				else if(data.companyId === Number(cashAccounts.options[i].getAttribute('data-company-id'))){
					cashAccounts.options[i].selected = true;
				}
			}
			
			var pdcCashAccounts = document.getElementById('pdcCashAccountId');
			for(i=0;i<pdcCashAccounts.options.length;i++){
				if(data.companyId != Number(pdcCashAccounts.options[i].getAttribute('data-company-id'))){
					pdcCashAccounts.options[i].disabled = true;
				}
				else if(data.companyId === Number(pdcCashAccounts.options[i].getAttribute('data-company-id'))){
					pdcCashAccounts.options[i].selected = true;
				}
			}
			
			document.getElementById('companyId').value = data.companyId;
			document.getElementById('chequeLeaves').innerHTML = data.totalCheques;
			document.getElementById('accountPayableId').value = data.accPayableId;
			document.getElementById('dsBankId').value = data.bankId;
			getRtgsCount(document.getElementById('companyId').value);
		}
	}
	
	
	function getRtgsCount(companyId){
		console.log(companyId);
		url = "../processing/getTodaysRtgsCount.jsp?companyId="+companyId;
		if(window.XMLHttpRequest){  
			fetchRtgsCount=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchDailySetupRequest=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			fetchRtgsCount.onreadystatechange=fetchRtgsCountData;  
			console.log("AJAX Req sent");
			fetchRtgsCount.open("GET",url,true);  
			fetchRtgsCount.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function fetchRtgsCountData(){
		if(fetchRtgsCount.readyState == 4){
			var response = this.response.trim();
			document.getElementById('rtgsCount').innerHTML = response;	
		}
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
					window.alert('Invalid Invoice Number entered. Please check the Invoice No. and search again.');
				}else{
					var data = JSON.parse(response);
					setData(data);
					//console.log(data);
				}
			}
		}
		
		function setData(data){
			console.log(data);
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
			
			setCurrentDate();
			var invoiceJson = data.invoiceJson;
			
			document.getElementById('invoiceNo').value = invoiceJson.invoiceNo ;
			document.getElementById('invoiceId').value = invoiceJson.invoiceId;
			document.getElementById('customerId').value = invoiceJson.customerId;
			document.getElementById('customerInfo').value = invoiceJson.customerName +'\n' + invoiceJson.customerAddress + '\n' + invoiceJson.customerMobile  ;
			document.getElementById('customerName').value = invoiceJson.customerName;
			document.getElementById('invoiceDate').value = invoiceJson.invoiceDate ;
			document.getElementById('totalAmount').value = invoiceJson.totalAmount ;
			
			
			if(data.hasOwnProperty("cashJson")){
				var cashJson = data.cashJson;
				document.getElementById('cashAmount').value = cashJson.amount ;
				document.getElementById('cashPaymentStatus').value = cashJson.paymentStatus;
				if(Number(cashJson.paymentStatus) === 1){
					document.getElementById("cashAccountId").value = cashJson.accountId;
				}
			}
			if(data.hasOwnProperty("chequeJson")){
				var chequeJson = data.chequeJson;
				document.getElementById('chequeAmount').value = chequeJson.amount ;
				document.getElementById('chequePaymentStatus').value = chequeJson.paymentStatus ;
				if(Number(chequeJson.paymentStatus) === 1){
					document.getElementById('chequeBank').value = chequeJson.bankId;
					document.getElementById('chequeNo').value = chequeJson.chequeNo ;
					document.getElementById('chequeDate').value = chequeJson.chequeDate ;
					document.getElementById('nameOnCheque').value = chequeJson.customerName ;
					document.getElementById('chequeId').value = chequeJson.id ;
				}else{
					document.getElementById('chequeNo').value = "" ;
					document.getElementById('nameOnCheque').value = invoiceJson.customerName ;
					}
				}
			if(data.hasOwnProperty("rtgsJson")){
				var rtgsJson = data.rtgsJson;
				document.getElementById('rtgsAmount').value = rtgsJson.amount ;
				document.getElementById('rtgsPaymentStatus').value = rtgsJson.paymentStatus ;
				if(Number(rtgsJson.paymentStatus) === 1){
					document.getElementById('rtgsBank').value = rtgsJson.bankName ;
					document.getElementById('rtgsBank').value = rtgsJson.bankName ;
					document.getElementById('rtgsAccountNo').value = rtgsJson.accountNo ;
					document.getElementById('rtgsIfsc').value = rtgsJson.ifscCode ;
				}else{
					document.getElementById('rtgsBank').value = "" ;
					document.getElementById('rtgsAccountNo').value = "" ;
					document.getElementById('rtgsIfsc').value = "" ;
				}
			}
			if(data.hasOwnProperty('pdcJson')){
				var pdcJson = data.pdcJson;
				if(invoiceJson.pdcPaymentMode === 'CHEQUE'){
					document.getElementById('pdcId').value = invoiceJson.pdcId ;
					document.getElementById('pdcChequeAmount').value = invoiceJson.pdcAmount ;
					document.getElementById('pdcChequeSection').hidden=false;
					document.getElementById('pdcCashSection').hidden=true;
					document.getElementById('pdcRtgsSection').hidden=true;
					document.getElementById('pdcChequePaymentStatus').value = pdcJson.pdcPayStatus ;
					if(Number(pdcJson.pdcPayStatus) === 1){
						document.getElementById('pdcChequeId').value = pdcJson.chequeId;
						document.getElementById('pdcDate').value = pdcJson.chequeDate;
						document.getElementById('pdcPayeeName').value = pdcJson.customerName;
						document.getElementById('pdcNo').value = pdcJson.chequeNo ;
					}else{
						document.getElementById('pdcChequeId').value = "";
						document.getElementById('pdcDate').value = invoiceJson.pdcPayDate ;
						document.getElementById('pdcPayeeName').value = invoiceJson.customerName;
						document.getElementById('pdcNo').value = "";
					}
				}else if(invoiceJson.pdcPaymentMode === 'RTGS'){
					document.getElementById('pdcId').value = invoiceJson.pdcId ;
					document.getElementById('pdcRtgsAmount').value = invoiceJson.pdcAmount;
					document.getElementById('pdcRtgsPaymentStatus').value = pdcJson.pdcPayStatus;
					if(Number(pdcJson.pdcPayStatus) === 1){
						document.getElementById('pdcRtgsBank').value = pdcJson.bankName ;
						document.getElementById('pdcRtgsAccountNo').value = pdcJson.accountNo ;
						document.getElementById('pdcRtgsIfsc').value = pdc.ifscCode ;
						document.getElementById('pdcRtgsDate').value = invoiceJson.pdcPayDate;
					}else{
						document.getElementById('pdcRtgsBank').value = '' ;
						document.getElementById('pdcRtgsAccountNo').value = '' ;
						document.getElementById('pdcRtgsIfsc').value = '' ;
						document.getElementById('pdcRtgsDate').value = invoiceJson.pdcPayDate;
					}
					document.getElementById('pdcRtgsSection').hidden=false;
					document.getElementById('pdcChequeSection').hidden=true;
					document.getElementById('pdcCashSection').hidden=true;
					document.getElementById('pdcCashSection').hidden=true;
				}else if(invoiceJson.pdcPaymentMode === 'CASH'){
					document.getElementById('pdcId').value = invoiceJson.pdcId ;
					document.getElementById('pdcCashAmount').value = invoiceJson.pdcAmount;
					document.getElementById('pdcCashPaymentStatus').value = pdcJson.pdcPayStatus;
					if(Number(pdcJson.pdcPayStatus) === 1){
						document.getElementById('pdcCashAccountId').value = pdcJson.accountId  ;
					}
					document.getElementById('pdcCashSection').hidden=false;
					document.getElementById('pdcRtgsSection').hidden=true;
					document.getElementById('pdcChequeSection').hidden=true;
				}
			}else if(!data.hasOwnProperty('pdcJson')){
				document.getElementById('pdcCashSection').hidden=true;
				document.getElementById('pdcRtgsSection').hidden=true;
				document.getElementById('pdcChequeSection').hidden=true;
			}
			if(Number(invoiceJson.paidByOperator) === 1){
				document.getElementById('invoiceStatus').value = "Paid by Operator";
				var inputElements = document.getElementsByTagName('input');
				var selectElements = document.getElementsByTagName('select');
				var submitButton = document.getElementById('submitButton');
				
				for(i=0; i<inputElements.length; i++){
					inputElements[i].disabled = true;
				}
				for(j=0; j<selectElements.length; j++){
					selectElements[j].disabled = true;
				}
				submitButton.disabled = true;
			}else{
				document.getElementById('invoiceStatus').value = "Payment Pending";
			}
		}
		/******************************************************
						VALIDATING DATA
		*******************************************************/
		
		$.fn.validateCheque = (function(){//validating cheque function
			if($.fn.validateData($("#chequeNo").val(),/^[0-9]{6}$/)){
				if(!$.fn.validateData($("#nameOnCheque").val(),/^\s*$/)){
					return true;
				}else{
					$.fn.checkStatus(1,"Invalid name on cheque!.");
					return false;
				}
			}else{
				$.fn.checkStatus(1,"Invalid cheque number!.");
				return false;
			}
		});
		
		$.fn.validateRtgs = (function(){//validating rtgs
			if(!$.fn.validateData($("#rtgsBank").val(),/^\s*$/)){
				if(!$.fn.validateData($("#rtgsAccountNo").val(),/^\s*$/)){
					if(!$.fn.validateData($("#rtgsIfsc").val(),/^\s*$/)){
						return true;
					}else{
						$.fn.checkStatus(1,"Invalid IFSC Code number!.");
				}
				}else{
					$.fn.checkStatus(1,"Invalid account number!.");
				}			
			}else{
				$.fn.checkStatus(1,"Invalid bank name!.");
			}
		});
		
		$.fn.validatePdcRtgs = (function(){//validating pdc rtgs
			if(!$.fn.validateData($("#pdcRtgsBank").val(),/^\s*$/)){
				if(!$.fn.validateData($("#pdcRtgsAccountNo").val(),/^\s*$/)){
					if(!$.fn.validateData($("#pdcRtgsIfsc").val(),/^\s*$/)){
						return true;
					}else{
						$.fn.checkStatus(1,"Invalid PDC IFSC Code number!.");
				}
				}else{
					$.fn.checkStatus(1,"Invalid PDC account number!.");
				}			
			}else{
				$.fn.checkStatus(1,"Invalid PDC bank name!.");
			}
		});
		
		$.fn.validatePdcCheque = (function(){//validating pdc cheque function
			if($.fn.validateData($("#pdcNo").val(),/^[0-9]{6}$/)){
				if(!$.fn.validateData($("#pdcPayeeName").val(),/^\s*$/)){
					return true;
				}else{
					$.fn.checkStatus(1,"Invalid name on Pdc cheque!.");
				}
			}else{
				$.fn.checkStatus(1,"Invalid cheque Pdc number!.");
			}
		});
		
		//validating data on form submission
		$(document).ready(function(){
			$("#submitButton").click(function(){
				if($("#chequeAmount").val()!=0){
					if($.fn.validateCheque()=== true){
						if($("#rtgsAmount").val()!=0){
							if($.fn.validateRtgs()===true){
								if($("#pdcRtgsSection").is(":hidden")){
									$("#pdcRtgsAmount").val("");
									$("#pdcRtgsBank").val("");
									$("#pdcRtgsAccountNo").val("");
									$("#pdcRtgsDate").val("");
									$("#pdcRtgsIfsc").val("");
									if(($("#pdcChequeSection").is(":hidden"))){
										$("#pdcChequeAmount").val("");
										$("#pdcBank").val("");
										$("#pdcNo").val("");
										$("#pdcDate").val("");
										$("#pdcPayeeName").val("");
										submitPayment();//calling submit function after reseting hidden fields values
									}else{
										if($.fn.validatePdcCheque()===true){
											submitPayment();
										}
									}
								}else{
									if($.fn.validatePdcRtgs()===true){
										if(($("#pdcChequeSection").is(":hidden"))){
											$("#pdcChequeAmount").val("");
											$("#pdcBank").val("");
											$("#pdcNo").val("");
											$("#pdcDate").val("");
											$("#pdcPayeeName").val("");
											submitPayment();//calling submit function after reseting hidden fields values
										}else{
											if($.fn.validatePdcCheque()===true){
												submitPayment();
											}
										}
									}
								}
							}else{
								//if rtgs amount is zero
								$("#rtgsAmount").val("");
								$("#rtgsBank").val("");
								$("#rtgsAccountNo").val("");
								$("#rtgsDate").val("");
								$("#rtgsIfsc").val("");
								if($("#pdcRtgsSection").is(":hidden")){
									$("#pdcRtgsAmount").val("");
									$("#pdcRtgsBank").val("");
									$("#pdcRtgsAccountNo").val("");
									$("#pdcRtgsDate").val("");
									$("#pdcRtgsIfsc").val("");
									if(($("#pdcChequeSection").is(":hidden"))){
										$("#pdcChequeAmount").val("");
										$("#pdcBank").val("");
										$("#pdcNo").val("");
										$("#pdcDate").val("");
										$("#pdcPayeeName").val("");
										submitPayment();//calling submit function after reseting hidden fields values
									}else{
										if($.fn.validatePdcCheque()===true){
											submitPayment();
										}
									}
								}else{
									if($.fn.validatePdcRtgs()===true){
										if(($("#pdcChequeSection").is(":hidden"))){
											$("#pdcChequeAmount").val("");
											$("#pdcBank").val("");
											$("#pdcNo").val("");
											$("#pdcDate").val("");
											$("#pdcPayeeName").val("");
											submitPayment();//calling submit function after reseting hidden fields values
										}else{
											if($.fn.validatePdcCheque()===true){
												submitPayment();
											}
										}
									}
								}
							}
						}
					}
				}else{
					//if check amoount is not zero
					$("#chequeAmount").val("");
					$("#chequeBank").val("");
					$("#chequeNo").val("");
					$("#chequeDate").val("");
					$("#nameOnCheque").val("");
					if($("#rtgsAmount").val()!=0){//checking rtgs data when cheque data is zero
						if($.fn.validateRtgs()===true){
							if($("#pdcRtgsSection").is(":hidden")){
								$("#pdcRtgsAmount").val("");
								$("#pdcRtgsBank").val("");
								$("#pdcRtgsAccountNo").val("");
								$("#pdcRtgsDate").val("");
								$("#pdcRtgsIfsc").val("");
								if(($("#pdcChequeSection").is(":hidden"))){
									$("#pdcChequeAmount").val("");
									$("#pdcBank").val("");
									$("#pdcNo").val("");
									$("#pdcDate").val("");
									$("#pdcPayeeName").val("");
									submitPayment();//calling submit function after reseting hidden fields values
								}else{
									if($.fn.validatePdcCheque()===true){
										submitPayment();
									}
								}
							}else{
								if($.fn.validatePdcRtgs()===true){
									if(($("#pdcChequeSection").is(":hidden"))){
										$("#pdcChequeAmount").val("");
										$("#pdcBank").val("");
										$("#pdcNo").val("");
										$("#pdcDate").val("");
										$("#pdcPayeeName").val("");
										submitPayment();//calling submit function after reseting hidden fields values
									}else{
										if($.fn.validatePdcCheque()===true){
											submitPayment();
										}
									}
								}
							}
						}
					}
				}
			});
		});
		
		
		
		function submitPayment(){//submit form data
			var cashAmount = document.getElementById('cashAmount').value;
			var chequeAmount = document.getElementById('chequeAmount').value;
			var rtgsAmount = document.getElementById('rtgsAmount').value;
			var pdcCashFlag = document.getElementById('pdcCashSection').hasAttribute('hidden');
			var pdcChequeFlag = document.getElementById('pdcChequeSection').hasAttribute('hidden');
			var pdcRtgsFlag = document.getElementById('pdcRtgsSection').hasAttribute('hidden');
			
			var parentJson = {};
			parentJson['invoiceId'] = document.getElementById('invoiceId').value;
			
			if(Number(cashAmount) > 0){
				var cashJson = submitCash();
				parentJson['cashJson'] = cashJson;
			}
			if(Number(chequeAmount) > 0){
				var chequeJson = submitChequeData();
				parentJson['chequeJson'] = chequeJson;
			}
			if(Number(rtgsAmount) > 0){
				var rtgsJson = submitRtgsData();
				parentJson['rtgsJson'] = rtgsJson;
			}
			if(pdcCashFlag === false){
				var pdcCashJson = submitPdcCash();
				parentJson['pdcCashJson'] = pdcCashJson;
			}
			if(pdcChequeFlag === false){
				var pdcChequeJson = submitPdc();
				parentJson['pdcChequeJson'] = pdcChequeJson;
			}
			if(pdcRtgsFlag === false){
				var pdcRtgsJson = submitPdcRtgs();
				parentJson['pdcRtgsJson'] = pdcRtgsJson;
			}
			
			console.log(parentJson);
			var jsonData = JSON.stringify(parentJson);
			
			document.getElementById("submitButton").disabled = true;
			
			submitDataAjax(jsonData);
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
			chequeJson['bankAccountId'] = bank.options[bank.selectedIndex].getAttribute('data-account-id');
			chequeJson['accountPayableId'] = document.getElementById('accountPayableId').value;
			chequeJson['paymentStatus'] = document.getElementById('chequePaymentStatus').value;
			
			return chequeJson;
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
			rtgsJson['dsBankId'] = document.getElementById('dsBankId').value;
			rtgsJson['accountPayableId'] = document.getElementById('accountPayableId').value;
			rtgsJson['companyId'] = document.getElementById('companyId').value;
			rtgsJson['paymentStatus'] = document.getElementById('rtgsPaymentStatus').value;
			
			return rtgsJson;
		}
	
	function submitCash(){
		var cashJson = {};
		
		cashJson['dataType'] = 'cash';	
		cashJson['cashAmount'] = document.getElementById('cashAmount').value;
		cashJson['invoiceId'] = document.getElementById('invoiceId').value;
		cashJson['customerName'] = document.getElementById('customerName').value;
		cashJson['customerId'] = document.getElementById('customerId').value;
		cashJson['invoiceNo'] = document.getElementById('invoiceNo').value;
		cashJson['accountPayableId'] = document.getElementById('accountPayableId').value;
		cashJson['cashAccountId'] = document.getElementById('cashAccountId').value;
		cashJson['paymentStatus'] = document.getElementById('cashPaymentStatus').value;
		
		return cashJson;
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
	   pdcJson['bankAccountId'] = bank.options[bank.selectedIndex].getAttribute('data-account-id');
	   pdcJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	   pdcJson['bankAccountId'] = bank.options[bank.selectedIndex].getAttribute('data-account-id');
	   pdcJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	   pdcJson['paymentStatus'] = document.getElementById('pdcChequePaymentStatus').value;
	   
	   return pdcJson;
	   
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
	   pdcRtgsJson['dsBankId'] = document.getElementById('dsBankId').value;
	   pdcRtgsJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	   pdcRtgsJson['companyId'] = document.getElementById('companyId').value;
	   pdcRtgsJson['paymentStatus'] = document.getElementById('pdcRtgsPaymentStatus').value;

		return pdcRtgsJson;

   }
   
   function submitPdcCash(){
	   var pdcCashJson = {};
		
	  	pdcCashJson['dataType'] = 'cash';	
		pdcCashJson['pdcCashAmount'] = document.getElementById('pdcCashAmount').value;
		pdcCashJson['invoiceId'] = document.getElementById('invoiceId').value;
		pdcCashJson['customerName'] = document.getElementById('customerName').value;
		pdcCashJson['customerId'] = document.getElementById('customerId').value;
		pdcCashJson['invoiceNo'] = document.getElementById('invoiceNo').value;
		pdcCashJson['accountPayableId'] = document.getElementById('accountPayableId').value;
		pdcCashJson['cashAccountId'] = document.getElementById('pdcCashAccountId').value;
		pdcCashJson['paymentStatus'] = document.getElementById('pdcCashPaymentStatus').value;
		
		return pdcCashJson;
   }
		
	checkDailySetup();
	setCurrentDate();
	
	function openInNewTab(invoiceId) {
		if(Number(invoiceId) === 0 || invoiceId===""){
			alert("Invalid Invoice No.");
		}
		else{
		  var win = window.open("../report/InvoicePDFPrintOnly.jsp?invoiceId="+invoiceId, '_blank');
		  win.focus();
			}
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
			var ids = response.split(',');
			document.getElementById("chequeId").value = ids[1];
			document.getElementById("pdcChequeId").value = ids[2];
			console.log(response);
			getPendingInvReport();
			$.fn.checkStatus(ids[0],"Payment Information has been saved successfully!")
		}
	}
	
	function voidCheque(chequeId){
		console.log(data);
		if(Number(chequeId)>0){
		
			url = "../processing/voidCheque.jsp?chequeId="+chequeId;
			if(window.XMLHttpRequest){  
				chqVoid=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				chqVoid=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				chqVoid.onreadystatechange=getDelChqId;  
				console.log("AJAX Req sent");
				chqVoid.open("GET",url,true);  
				chqVoid.send();  
			}catch(e){alert("Unable to connect to server");}
		}else if (Number(chequeId) === 0) {
			alert("Invalid cheque");
		}
	}
	
	
	function getDelChqId(){
		if(chqVoid.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			$.fn.checkStatus(response,"Cheque is void.")
		}
	}
	
	function PrintChequeData(chequeId){
		 var win = window.open("../report/Cheque.jsp?chequeId="+chequeId, '_blank');
		  win.focus();	
	}
	
	
	
	/**************************************
	Response window code
	**************************************/
	<%-- var sessionId = {
			"getSessionId":<%=session.getAttribute("gradeSubmitFlag") %>,
	}

	$(document).ready(function(){
		$.fn.checkStatus(sessionId.getSessionId,"Grading information has been saved successfully!")
	}) --%>
	
	</script>
</body>
</html>	
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
     <title>Vendor Payment</title>
   </head>
<body>
	<%@include file="../accounts_operation_view/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2 tile-background-row">
				<div class="col-md-3">
					<label class="lbl-rm-all">Search</label>
					<div class="d-flex justify-content-start align-items-center">
						<input type="text" class="form-control form-control-sm" id="searchInvoiceNo" name="searchInvoiceNo" placeholder="Invoice No">
						<button type="button" class="btn btn-success btn-sm btn-no-radius" onclick="fetchInvoiceData(document.getElementById('searchInvoiceNo').value)">Fetch</button>
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
							<div class="amt">12</div>
						</div>
						<div class="log">
							<div class="heading">Total RTGS/NEFT</div>
							<div class="amt">12</div>
						</div>
					</div>
				</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-8">
				<div class="tile-background-row">
					<input type="hidden" id="invoiceId" name="invoiceId" />
					<input type="hidden" id="customerId" name="customerId" />
					<input type="hidden" id="customerName" name="customerName" />
					<div class="form-row">
						<div class="col-md-3">
							<label class="lbl-rm-all">Customer Information</label>
							<textarea id="customerInfo" name="customerInfo" class="form-control form-control-lg" rows="3" readonly></textarea>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Invoice No</label>
							<input type="text" class="form-control form-control-sm" id="invoiceNo" name="invoiceNo" readonly>
							<label class="lbl-rm-all">Date</label>
							<input type="text" class="form-control form-control-sm" id="invoiceDate" name="invoiceDate" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Total Amount to Pay</label>
							<input type="text" class="form-control form-control-sm" id="totalAmount" name="totalAmount" readonly>
							<label class="lbl-rm-all">Status</label>
							<input type="text" class="form-control form-control-sm" id="invoiceStatus" name="invoiceStatus" value="Paid" readonly>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cash</label>
							<div class="d-flex justify-content-start align-items-center">
								<input type="text" class="form-control form-control-sm" id="cashAmount" name="cashAmount" readonly>
								<button type="button" class="btn btn-success btn-sm btn-no-radius">Print</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque</label>
							<input type="text" class="form-control form-control-sm" id="chequeAmount" name="" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank</label>
							<select type="text" class="form-control form-control-sm" id="chequeBank" name="chequeBank">
								<c:Bank />
							</select>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque No</label>
							<input type="text" class="form-control form-control-sm" id="chequeNo" name="chequeNo" placeholder="Cheque No.">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Date</label>
							<input type="date" class="form-control form-control-sm" id="chequeDate" name="chequeDate">
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">Name</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control form-control-sm" id="nameOnCheque" name="nameOnCheque" placeholder="Name on Cheque">
							<button type="button" class="btn btn-success btn-sm btn-no-radius" onclick="submitChequeData()">Pay</button>&nbsp;
							<button type="button" class="btn btn-success btn-sm btn-no-radius">Void</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">RTGS/NEFT</label>
							<input type="text" class="form-control form-control-sm" id="rtgsAmount" name="rtgsAmount" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank Name</label>
							<input type="text" class="form-control form-control-sm" id="rtgsBank" name="rtgsBank" placeholder="RTGS Bank Name">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Account No</label>
							<input type="text" class="form-control form-control-sm" id="rtgsAccountNo" name="rtgsAccountNo" placeholder="Account No.">
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">IFSC Code</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control form-control-sm" id="rtgsIfsc" name="rtgsIfsc" placeholder="IFSC Code">
							<button type="button" class="btn btn-success btn-sm btn-no-radius" onclick="submitRtgsData()">Pay</button>
							</div>
						</div>
					</div>
				<form id='paymentForm' action="../processing/submitPayment.jsp" target="_blank">
				<input type="hidden" id="output" name="output" />	
				</form>
				</div>
			</div>
			<div class="col-md-4">
				<div class="tile-background-row">
				<table class="table table-bordered">
					<thead class="table-back">
						<tr>
							<th>RST</th>
							<th>Invoice No</th>
							<th>Customer Name</th>
							<th>Amount to Pay</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	
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
				//$.unblockUI
			}
			else if(Number(response) <= 0){
				//$.blockUI();
			}
		} 
	}
	
	window.onload = function(){
		getDailySetupData();
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
			var bank=  document.getElementById('chequeBank');
			for(i=0;i<bank.options.length;i++){
				if(data.bankId != Number(bank.options[i].value)){
					bank.options[i].disabled = true;
				}
				else if(data.bankId === Number(bank.options[i].value)){
					bank.options[i].selected = true;
				}
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
					window.alert('Invalid Invoice Number entered. Please check the Invoice No. and search again.')
				}else{
					var data = JSON.parse(response);
					setData(data);
				}
			}
		}
		
		function setData(data){
			
			document.getElementById('invoiceNo').value = data.invoiceNo ;
			document.getElementById('invoiceId').value = data.invoiceId;
			document.getElementById('customerId').value = data.customerId;
			document.getElementById('customerInfo').value = data.customerName +'\n' + data.customerAddress + '\n' + data.customerMobile  ;
			document.getElementById('customerName').value = data.customerName;
			document.getElementById('invoiceDate').value = data.invoiceDate ;
			document.getElementById('totalAmount').value = data.totalAmount ;
			document.getElementById('invoiceStatus').value = data.paidByOperator ;
			document.getElementById('cashAmount').value = data.cashAmount ;
			document.getElementById('chequeAmount').value = data.chequeAmount ;
			document.getElementById('chequeBank').value = "" ;
			document.getElementById('chequeNo').value = "" ;
			document.getElementById('nameOnCheque').value = "" ;
			document.getElementById('rtgsAmount').value = data.rtgsAmount ;
			document.getElementById('rtgsBank').value = "" ;
			document.getElementById('rtgsAccountNo').value = "" ;
			document.getElementById('rtgsIfsc').value = "" ;
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
			chequeJson['invoiceNo'] = document.getElementById('searchInvoiceNo').value;
			chequeJson['customerId'] = document.getElementById('customerId').value;
			chequeJson['customerName'] = document.getElementById('customerName').value;
			
			var chequeInfo = JSON.stringify(chequeJson);
			document.getElementById('output').value = chequeInfo;
			console.log(chequeInfo);
			document.getElementById('paymentForm').submit();
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
			rtgsJson['invoiceNo'] = document.getElementById('searchInvoiceNo').value;
			rtgsJson['customerId'] = document.getElementById('customerId').value;
			rtgsJson['customerName'] = document.getElementById('customerName').value;
			
			var rtgsInfo = JSON.stringify(rtgsJson);
			console.log(rtgsInfo);
			document.getElementById('output').value = rtgsInfo;
			
			document.getElementById('paymentForm').submit();
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
		document.getElementById('output').value = cashJson;
		
		document.getElementById('paymentForm').submit();
	}
		
	checkDailySetup();
	
	</script>
</body>
</html>	
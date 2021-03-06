<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
 <link rel="stylesheet" href="../styles/WBStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Chart Of Accounts</title>
</head>
<body>
 <%@include file="NavBar.jsp" %>
	<div class="container-fluid ">
	 	<div class="row  row-background mt-2">
				<div class="col-md-12">
				<div class="d-flex justify-content-start align-items-center">
						<h4>Expenses</h4>
						</div>
				</div>
			</div>
		<form action="../processing/addExpense.jsp" method="post">
			<div class="row row-background">
				<div class="col-md-3">
						<label class="lbl-rm-l ">Select Company</label> 
				<select class="form-control " name="companyId" id="companyId" onchange="setPaymentModes(this.value)">
					<option selected="selected" disabled>Select</option>
					<c:Company />
				</select>
			</div>
			<div class="col-md-3">
						<label class="lbl-rm-l">Payee</label>
						<input type="text" class="form-control " name="payee" id="payee">
				</div>
			</div>
			
			<div class="row row-background">
				<div class="col-md-2">
						<label class="lbl-rm-l">Date</label>
						<input type="date" class="form-control " name="date" id="date">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-l">Voucher No</label>
						<input type="text" class="form-control " name="voucherNo" id="voucherNo" value="" readonly="readonly">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-l">Reference</label>
						<input type="text" class="form-control " name="voucherReference" id="voucherReference">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-l">Cheque No</label>
						<input type="text" class="form-control " name="chequeNo" id="chequeNo">
				</div>
						<input type="hidden" class="form-control " name="chequeId" id="chequeId">
				<div class="col-md-2" hidden="true" id="updateCheuqeSection">
						<label class="lbl-rm-l">Update/Delete Cheque</label>
						<input type="checkbox" class="form-control " name="updateCheque" id="updateCheque" hidden="true">
				</div>
			</div>
			
			<div class="row mt-2 row-background">
				<div class="col-md-2">
						<label class="lbl-rm-l">Expense Account</label>
						<select class="form-control " name="accountId" id="accountId">
							<option selected="selected" disabled>Select</option>
							<c:ExpenseAccountTag/>
						</select>
				</div>
				<div class="col-md-5">
						<label class="lbl-rm-l">Description</label>
						<input type="text" class="form-control " name="description" id="description">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-l">Amount</label>
						<input type="text" class="form-control " name="amount" id="amount" />
				</div>
				<div class="col-md-3">
						<label class="lbl-rm-l">Payment Mode</label>
						<select class="form-control " name="paymentMode" id="paymentMode">
							<option selected disabled>Select</option>
							<c:BankLedgerTag/>
							<c:CashLedgerTag/>
						</select>
				</div>
			</div>
			</form>
			<div class="row row-background">
				<div class="col-md-2 offset-md-10 text-right">
					<button type="button" class="btn btn-success" id="save-expense-entry">Save</button>
					<button type="button" class="btn  btn-success " id="update-data" disabled>Update</button>
					<button type="button" class="btn  btn-success " id="reset-data" onclick="window.location='../accounts/Record_Expenses.jsp'">Reset</button>
			
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
 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/3.4.1-jq.js"></script>
	<script src="../js/Validation.js"></script>
	<script>
	
	//-----------------------------------Validations
	

	document.getElementById("save-expense-entry").addEventListener("click",function(){
		if(document.getElementById("date").value.trim()!=""){
			if(document.getElementById("voucherNo").value.trim()!=""){
				if(document.getElementById("voucherReference").value.trim()!=""){
					if(document.getElementById("description").value.trim()!=""){
						if(document.getElementById("amount").value.trim()!=""){
							expenseEntry();
						}else{
							alert("Form cannot be left blank!!")
						}
					}else{
						alert("Form cannot be left blank!!")
					}
				}else{
					alert("Form cannot be left blank!!")
				}
			}else{
				alert("Form cannot be left blank!!")
			}
		}else{
			alert("Form cannot be left blank!!")
		}
		
		
		if(document.getElementById("companyId").value.trim()!="Select"){
			if(document.getElementById("accountId").value.trim()!="Select"){
				if(document.getElementById("paymentMode").value.trim()!="Select"){
					
				}else{
					alert("Dropdown must have some values!!")
				}
			}else{
				alert("Dropdown must have some values!!")
			}
		}else{
			alert("Dropdown must have some values!!")
		}
		
	})
	
	
	
	//Updation validation
	document.getElementById("update-data").addEventListener("click",function(){
		if(document.getElementById("date").value.trim()!=""){
			if(document.getElementById("voucherNo").value.trim()!=""){
				if(document.getElementById("voucherReference").value.trim()!=""){
					if(document.getElementById("description").value.trim()!=""){
						if(document.getElementById("amount").value.trim()!=""){
							updateData();
						}else{
							alert("Form cannot be left blank!!")
						}
					}else{
						alert("Form cannot be left blank!!")
					}
				}else{
					alert("Form cannot be left blank!!")
				}
			}else{
				alert("Form cannot be left blank!!")
			}
		}else{
			alert("Form cannot be left blank!!")
		}
		
		
		if(document.getElementById("companyId").value.trim()!="Select"){
			if(document.getElementById("accountId").value.trim()!="Select"){
				if(document.getElementById("paymentMode").value.trim()!="Select"){
					
				}else{
					alert("Dropdown must have some values!!")
				}
			}else{
				alert("Dropdown must have some values!!")
			}
		}else{
			alert("Dropdown must have some values!!")
		}
		
	})
	

	//---------------------------------------validations end here
		function expenseEntry(){
			document.getElementsByTagName('form')[0].submit();
		}
	
		function setPaymentModes(companyId){
			var options = document.getElementById("paymentMode").options;
			for(i=0; i<options.length;i++)
				{
					if(options[i].getAttribute('data-company-id') != companyId && options[i].getAttribute('data-company-id') != 0){
						options[i].hidden=true;
					}else if(options[i].getAttribute('data-company-id') === companyId || options[i].getAttribute('data-company-id') === 0){
						options[i].hidden=false;
					}
				}
		}
		
		
		
		function fetchVoucherNoSeries(){
			var url="../processing/getVoucherNoSeries.jsp";
			if(window.XMLHttpRequest){  
				fetchVoucherNo=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchVoucherNo=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchVoucherNo.onreadystatechange=getVoucherNo;  
				console.log("AJAX Req sent");
				fetchVoucherNo.open("GET",url,true);  
				fetchVoucherNo.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function getVoucherNo(){
			if(fetchVoucherNo.readyState == 4){
				var voucherNo = this.response.trim();
				console.log("voucher---"+voucherNo);
				document.getElementById("voucherNo").value = voucherNo;
			}
		}
		
	fetchVoucherNoSeries();
	
	
	/**********************************************/
	//Fetch data for Updation
	window.onload = function(){
		var params = parseURLParams(window.location.href);
		if(typeof params != "undefined"){
			document.getElementById('save-expense-entry').disabled=true;
			document.getElementById('update-data').disabled=false;
			document.getElementById('updateCheque').hidden=false;
			document.getElementById('updateCheuqeSection').hidden=false;
			sendReqToGetData(params.voucherNo[0]);
		}
	}
	
	function parseURLParams(url) {
	    var queryStart = url.indexOf("?") + 1,
	        queryEnd   = url.indexOf("#") + 1 || url.length + 1,
	        query = url.slice(queryStart, queryEnd - 1),
	        pairs = query.replace(/\+/g, " ").split("&"),
	        parms = {}, i, n, v, nv;
	
	    if (query === url || query === "") return;
	
	    for (i = 0; i < pairs.length; i++) {
	        nv = pairs[i].split("=", 2);
	        n = decodeURIComponent(nv[0]);
	        v = decodeURIComponent(nv[1]);
	
	        if (!parms.hasOwnProperty(n)) parms[n] = [];
	        parms[n].push(nv.length === 2 ? v : null);
	    }
	    return parms;
	}
	
	function sendReqToGetData(voucherNo){
		var url="../processing/getExpenseEntryTrData.jsp?voucherNo="+voucherNo;
		if(window.XMLHttpRequest){  
			fetchTrData=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchTrData=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchTrData.onreadystatechange=getVoucherData;  
			console.log("AJAX Req sent");
			fetchTrData.open("GET",url,true);  
			fetchTrData.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function getVoucherData(){
		if(fetchTrData.readyState == 4){
			var response = this.response;
			var data = JSON.parse(response);
			setDataForUpdation(data);
		}
	}
	
	function setDataForUpdation(data){
		console.log(data);
		document.getElementById("companyId").value = data[0].companyId;
		document.getElementById("voucherNo").value = data[0].voucherNo;
		document.getElementById("date").value = data[0].transactionDate;
		document.getElementById("voucherReference").value = data[0].voucherRef;
		document.getElementById("payee").value = data[0].contactId;
		document.getElementById("description").value = data[0].narration;
		if(Number(data[0].debit)>0){
			document.getElementById("amount").value = data[0].debit;
		}else if(Number(data[0].debit)<=0){
			document.getElementById("amount").value = data[0].credit;
		}
		if(typeof data[0].chequeNo != "undefined"){
			document.getElementById("chequeNo").value= data[0].chequeNo;
			document.getElementById("chequeId").value= data[0].chequeId;
		}else{
			document.getElementById("chequeNo").value= "NA";
			document.getElementById("chequeId").value= "";
		}
		
		for(i=0; i<data.length; i++){
			if(Number(data[i].debit)>0){
				document.getElementById("accountId").value = data[i].accountId;
			}else if(Number(data[i].credit)>0){
				document.getElementById("paymentMode").value = data[i].accountId;
			}
		}
	}
	
	
	function updateData(){
		document.getElementsByTagName('form')[0].action="../processing/updateExpenseEntry.jsp";
		document.getElementsByTagName('form')[0].submit();
	}
	
	
	/**************************************
	Response window code
	**************************************/
	var sessionId = {
			"getSessionId":<%=session.getAttribute("expenseId") %>,
	}
	$(document).ready(function(){
		
		if(sessionId.getSessionId != null){		
			if(Number(sessionId.getSessionId) === 0){
				$.fn.checkStatus(1,"Unable to save Expense!");
			}else if(Number(sessionId.getSessionId) > 0){
				$.fn.checkStatus(sessionId.getSessionId,"Expense has been added successfully!");
			}
		}
	})
<%
session.removeAttribute("expenseId");
%>	
	
	</script>
</body>
</html>
	 
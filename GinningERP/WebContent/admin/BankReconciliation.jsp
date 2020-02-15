<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="../styles/css/all.css">
<title>Bank Reconciliation</title>
</head>
<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	<div class="row row-background">
		<div class="col-md-2">
			<h4>Bank Reconciliation</h4>
		</div>
	</div>
	<div class="row row-background">
		<div class="col-md-3">
				<label>Company: </label>&nbsp;
				<select class="form-control form-control-sm" id="companyId" name="companyId">
					<option selected disabled>Select</option>
					<c:Company/>
				</select>
		</div>
			<div class="col-md-3">
				<label>Bank: </label>&nbsp;
				<select class="form-control form-control-sm" id="bankId" name="bankId">
					<option selected disabled>Select</option>
					<c:Bank/>
				</select>
		</div>
		<div class="col-md-2">
				<label>Date: </label>&nbsp;
				<input type="date" class="form-control form-control-sm" id="date" name="date"> 
		</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-sm btn-success" style="margin-top:32px;" id="fetchRecords">Get Transactions</button>
		</div>
		<div class="col-md-2">
				<button type="button" class="btn btn-sm btn-success" style="margin-top:32px;" id="save">Save</button>
		</div>
	</div>
	
	<div class="row row-background">
		<div class="col-md-12">
			<table class="table table-sm table-bordered">
					<thead>
						<tr>
							<th width="5%">Select</th>
							<th hidden="">Voucher No</th>
							<th hidden="">Transaction Id</th>
							<th width="10%">Date</th>
							<th>Description</th>
							<th>Debit</th>
							<th>Credit</th>
							<th hidden="">chequeNo</th>
						</tr>
					</thead>
					<tbody id="tableBody">
					</tbody>
					<tfoot></tfoot>
			</table>
		</div>
	</div>
	
	<form action="../processing/submitBankReco.jsp" id="recoForm">
		<input type="hidden" id="output" name="output" />
	</form>
	
	<div class="row row-background">
		<div class="col-md-2">
			<label>Statement Ending Balance</label>
			<input type="text" class="form-control form-control-sm" id="sebal" name="" value=0>
		</div>
			<div class="col-md-2">
			<label> - Outstanding Cheques</label>
			<input type="text" class="form-control form-control-sm" id="ostChk" name="" value=0 readonly>
		</div>
		<div class="col-md-2">
			<label> + Deposit In Transit</label>
			<input type="text" class="form-control form-control-sm" id="dit" name=""  value=0 readonly>
		</div>
			<div class="col-md-2">
			<label> - GL Balance</label>
			<input type="text" class="form-control form-control-sm" id="glbal" name="" value=0 readonly>
		</div>
		<div class="col-md-2">
			<label> = Unreconciled Difference</label>
			<input type="text" class="form-control form-control-sm" id="urdiff" name="" value=0 readonly>
		</div>
	</div>
	</div>
	</div>
	</div>
	 <script src="../js/3.4.1-jq.js"></script>
	 <script src="../js/Validation.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	
	 
	
	function fetchReport(){
		var companyId = document.getElementById("companyId").value;
		var bankId = document.getElementById("bankId").value;
		var date = document.getElementById("date").value;
		
		url = "../processing/getBankRecordsForReco.jsp?companyId="+companyId+"&bankId="+bankId+"&date="+date;
		console.log(url);
		if(window.XMLHttpRequest){  
			fetchRequest=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchRequest=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			fetchRequest.onreadystatechange=getLedgerData;  
			console.log("AJAX Req sent");
			fetchRequest.open("GET",url,true);  
			fetchRequest.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function getLedgerData(){
		if(fetchRequest.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			var data = JSON.parse(response);
			setReportInTable(data);
		}
	}
	
	
	document.getElementById("fetchRecords").addEventListener('click',function(e){
		fetchReport();
	});
	
	document.getElementById("companyId").addEventListener("change",function(e){
		var bankOptions = document.getElementById("bankId").options;
		for(i=0; i<bankOptions.length; i++){
			bankOptions[i].disabled = false;
			}
		for(i=0; i<bankOptions.length; i++){
			if(e.srcElement.value != bankOptions[i].getAttribute("data-company-id")){
				bankOptions[i].disabled = true;
			}
		}
	});
	
	function setReportInTable(jsonObj, openingBalance){
		
		var json = jsonObj.array;
		console.log(json);
		var closingBal = jsonObj.closingBalance;
		
		document.getElementById('glbal').value = closingBal;
		
		var table = document.getElementById("tableBody");
		table.innerHTML = "";
	  	var totalDebit = 0;
    	var totalCredit = 0;		
   	
		for(i=0;i<json.length;i++){
			
			var noOfRows = table.rows.length;
			var rows = table.insertRow(noOfRows);
			var cell1 = rows.insertCell(0);
			var cell2 = rows.insertCell(1);
			var cell3 = rows.insertCell(2);
			var cell4 = rows.insertCell(3);
			var cell5 = rows.insertCell(4);
			var cell6 = rows.insertCell(5);
			var cell7 = rows.insertCell(6);
			var cell8 = rows.insertCell(7);
			
			cell1.align='center';
			cell2.hidden = true;
			cell3.hidden = true;
			cell8.hidden = true;
			
			if(Number(json[i].recoStatus) === 1){
				cell1.innerHTML = "<input type='checkbox' name='check' checked>";
			}else if(Number(json[i].recoStatus) === 0){
				cell1.innerHTML = "<input type='checkbox' name='check'>";
			}
			
			cell2.innerHTML = json[i].voucherNo;
			cell3.innerHTML = json[i].transactionId;
			cell4.innerHTML = json[i].transactionDate;
			cell5.innerHTML = json[i].narration;
			if(Number(json[i].credit) >0){
				cell7.innerHTML = json[i].credit;
				cell6.innerHTML = 0;
			}else if(Number(json[i].debit) >0){
				cell6.innerHTML = json[i].debit;
				cell7.innerHTML = 0;
			}
			cell8.innerHTML = json[i].chequeNo;
		}
			
		//Outstanding Check = Total of Debit  +  Total of Credit
		function calculateDebitTotal() {
         	var rowCount = $("#tableBody tr").length;
         	var totalDebit = 0;
         	for(i=0;i<rowCount;i++){
         		var totdr = 0;
         		if ($("#tableBody tr").eq(i).find("td:eq(5)").text()===""){
         			totdr = 0;
         		}else{
         			totdr = parseInt($("#tableBody tr").eq(i).find("td:eq(5)").text());
         		}
         		totalDebit = totalDebit+ totdr;
         	}
         	return (totalDebit);
		}
		
		function calculateCreditTotal(){
			var rowCount = $("#tableBody tr").length;
         	var totalCredit = 0;
        	for(i=0;i<rowCount;i++){
        		var totcr = 0;
				if ($("#tableBody tr").eq(i).find("td:eq(6)").text()===""){
         			totcr = 0;
         		}else{
         			totcr = parseInt($("#tableBody tr").eq(i).find("td:eq(6)").text());
         		}
         		totalCredit = totalCredit+ totcr;
        	}
        	return (totalCredit);
		}
			$("#ostChk").val(calculateCreditTotal());
			$("#dit").val(calculateDebitTotal());
	}
	
	//********unreconciled difference*********//
	$("#sebal,#ostChk,#dit,#glbal").change(function(){
		calculateUnreconciled();
	})
	
	function calculateUnreconciled(){
		$("#urdiff").val(parseInt($("#sebal").val())+parseInt($("#ostChk").val())+parseInt($("#dit").val())-parseInt($("#glbal").val()));
	}
	
	/*
	$("table").click(function(){
		var indexOfRow = 0 ;//$("#tableBody td").parent().index();
		var chkbox = $('#tableBody tr').eq(0).find(':checkbox').prop("checked"); //returns true or false
		if(chkbox === true){
			$("#ostChk").val(parseInt($("#ostChk").val())+parseInt($("#tableBody tr").eq(0).find("td:eq(6)").text()))
		}
	})*/
	
	//change outstanding cheque value on changing the checkboxes
	document.addEventListener("change",function(e){
		if(e.srcElement.name==="check"){
			var table = document.getElementById('tableBody');
			var outstandingCheques = document.getElementById('ostChk');
			var depositInTransit = document.getElementById('dit');
			var checkbox = e.srcElement;
			if(checkbox.checked === true){
				var rowIndex = checkbox.parentNode.parentNode.rowIndex-1;
				var debit = table.rows[rowIndex].cells[5].innerHTML;
				var credit = table.rows[rowIndex].cells[6].innerHTML;
				if(Number(debit)>0){
					depositInTransit.value = Number(depositInTransit.value)-Number(debit);
				}else if(Number(credit)>0){
					outstandingCheques.value = Number(outstandingCheques.value)-Number(credit);
				}
			}else if(checkbox.checked === false){
				var rowIndex = checkbox.parentNode.parentNode.rowIndex-1;
				var debit = table.rows[rowIndex].cells[5].innerHTML;
				var credit = table.rows[rowIndex].cells[6].innerHTML;
				if(Number(debit)>0){
					depositInTransit.value = Number(depositInTransit.value)+Number(debit);
				}else if(Number(credit)>0){
					outstandingCheques.value = Number(outstandingCheques.value)+Number(credit);
				}
			}
			calculateUnreconciled();
		}
	});
	

	function submitReco(){
		var parentObj = {};
		var closingGlBal = document.getElementById('glbal').value;
		var closingBankBal = document.getElementById('sebal').value;
		var companyId = document.getElementById('companyId').value;
		var bankId = document.getElementById('bankId').value;
		var recoDate = document.getElementById('date').value;
		var bankDropDown = document.getElementById('bankId');
		var bankGlId = bankDropDown.options[bankDropDown.options.selectedIndex].getAttribute("data-account-id");
		
		var table = document.getElementById("tableBody");
		
		parentObj.closingGlBal = closingGlBal;
		parentObj.closingBankBal = closingBankBal;
		parentObj.companyId = companyId;
		parentObj.companyId = companyId;
		parentObj.bankId = bankId;
		parentObj.recoDate = recoDate;
		parentObj.bankGlId = bankGlId;
		
		var jsonArr = [];
		
		for(i=0; i<table.childElementCount; i++){
			if(table.rows[i].cells[0].children[0].checked === true){
				var jsonObj = {};
				jsonObj.transactionId = table.rows[i].cells[2].innerHTML;
				jsonObj.voucherNo = table.rows[i].cells[1].innerHTML;
				jsonArr.push(jsonObj);
			}
		}
		parentObj.recoDetails = jsonArr;
		console.log(parentObj);
		document.getElementById('output').value = JSON.stringify(parentObj);
		document.getElementById('recoForm').submit();
	}
	
	document.getElementById("save").addEventListener('click',function(e){
		submitReco();
	});
	

	/***********************
	Side bar 
************************/
   $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
	
   /**************************************
	Response window code
	**************************************/
	var sessionId = {
			"getSessionId":<%=session.getAttribute("recoId") %>,
	}
	$(document).ready(function(){
		if(sessionId.getSessionId != null){		
			if(Number(sessionId.getSessionId) === 0){
				$.fn.checkStatus(1,"Unable to save Bank Reco data!");
			}else if(Number(sessionId.getSessionId) > 0){
				$.fn.checkStatus(sessionId.getSessionId,"Bank Reconciliation has been recorded successfully!");
			}
		}
	});
<%
session.removeAttribute("recoId");
%>		

	</script>
</body>
</html>
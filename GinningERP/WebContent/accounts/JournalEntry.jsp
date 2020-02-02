<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
 <link rel="stylesheet" href="../styles/WBStyle.css">
<link rel="stylesheet" href="../styles/css/all.css">
<title>Journal Entry</title>
</head>
<body>
 <%@include file="NavBar.jsp" %>
<div class="container-fluid ">
	<div class="row row-background mt-2">
		<div class="col-md-2">
			<h4>Journal Entry</h4>
		</div>
	</div>

	<div class="row row-background">
		<div class="col-md-2 text-right">
			<label style="margin-bottom:0px;">Company Selected</label>
		</div>
		<div class="col-md-4">
			<select class="form-control  ml-2"  id="select-company">
			<option selected disabled>Select</option>
			<c:Company/>
			</select>
		</div>
		<div class="col-md-2 text-right">
			<label style="margin-bottom:0px;">Voucher No</label>
		</div>
		<div class="col-md-4">
			<input type="text" class="form-control  ml-2" id="voucherNo" name="voucherNo" readonly>
		</div>
	</div>
	
		<div class="row  row-background">
		<div class="col-md-2 text-right">
			<label style="margin-bottom:0px;">Date</label>
		</div>
		<div class="col-md-4">
			<input type="date" class="form-control  ml-2" id="journal-entry-date" name="journal-entry-date-name">
		</div>
		<div class="col-md-2 text-right">
			<label style="margin-bottom:0px;">Reference:</label>
		</div>
		<div class="col-md-4">
			<input type="text" class="form-control  ml-2" id="journal-entry-reference" name="journal-entry-reference-name">
		</div>
	</div>
	
		<div class="row  row-background">
			<div class="col-md-12">
				<table class="table table-sm table-bordered">
					<thead>
						<tr>
							<th width="20%">Account Id</th>
							<th>Description</th>
							<th width="10%">Debit</th>
							<th width="10%">Credit</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr class="tdindex">
							<td>
								<select class="form-control "  name="journal-entry-accountid-name">
									<option selected disabled>Select</option>
									<c:AccountLedgerWithoutPurchaseTag/>
								</select>
							</td>
							<td>
								<input type="text" class="form-control  "  name="desciption-name">
							</td>
							<td>
								<input type="text" class="form-control  "  name="debit-name">
							</td>
							<td>
								<input type="text" class="form-control  "  name="credit-name">
							</td>
						</tr>
						<tr class="tdindex">
							<td>
								<select class="form-control "  name="journal-entry-accountid-name">
									<option selected disabled>Select</option>
									<c:AccountLedgerWithoutPurchaseTag/>
								</select>
							</td>
							<td>
								<input type="text" class="form-control  "  name="desciption-name" >
							</td>
							<td>
								<input type="text" class="form-control  "  name="debit-name">
							</td>
							<td>
								<input type="text" class="form-control  "  name="credit-name">
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" class="text-right"><b>Total</b></td>
							<td class="text-center" id="debit-total"><b>0.00</b></td>
							<td class="text-center" id="credit-total"><b>0.00</b></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		
		<div class="row row-background">
			<div class="col-md-6 d-flex justify-content-start align-items-center">
					<button type="button" class="btn  btn-success btn_width" id="add-row">Add Row</button>
					<button type="button" class="btn  btn-success ml-2 btn_width" id="remove-row">Remove Row</button>
			</div>
			
			<div class="col-md-6 d-flex justify-content-end align-items-center">
					<button type="button" class="btn  btn-success btn_width" id="save-data">Save</button>
					<button type="button" class="btn  btn-success ml-2 btn_width" id="update-data" disabled>Update</button>
					<button type="button" class="btn  btn-success ml-2 btn_width" id="reset-data" onclick="window.location='../accounts/JournalEntry.jsp'">Reset</button>
			</div>
		</div>
</div>
<form id="form" action="../processing/addTransactionFromJournalEntry.jsp" method="post">
	<input type="hidden" id="output" name="data">
</form>

<!-- Response modal pop up -->
<div class="response-back-display"></div>
<div class="response-body">
	<div class="response-header">
		<h5>Information</h5>
	</div>
	<div class="response-content">
		<div class="d-flex justify-content-center align-items-center">
		<h5 id="response-text" ></h5>
		</div>
	</div>
	<div class="response-footer">
		<button type="button" class="btn btn-success btn-response" id="response-button">Ok</button>
	</div>
</div>


	 <script src="../js/3.4.1-jq.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	 <script src="../js/Validation.js"></script>
	<script>
		//Jquery code starting here no other separate file to be maintained
		
		/********************validations***************************/
		
		/******************Grand total of table data
		*/
		$.fn.getGrossTotalOfDebit = function(){
			var $tblrows = $("#tbody tr");
			$tblrows.each(function (index) {
			    var $tblrow = $(this);
			    $tblrow.find("input[name='debit-name']").on('keyup', function () {
			    var subTotal = $("input[name='debit-name']").val();
			    if (!isNaN(subTotal)) {
			    	$tblrow.find('#debit-total').val(subTotal);
			    	var grandTotal = 0;
			    	  $("input[name='debit-name']").each(function () {
			    	        var stval = parseFloat($(this).val());
			    	        grandTotal += isNaN(stval) ? 0 : stval;
			    	    });
			    	    $('#debit-total').text(grandTotal);
			    }
			    	});
			});
		}
		
		$.fn.getGrossTotalOfCredit = function(){
			var $tblrows = $("#tbody tr");
			$tblrows.each(function (index) {
			    var $tblrow = $(this);
			    $tblrow.find("input[name='credit-name']").on('keyup', function () {
			    var subTotal = $("input[name='credit-name']").val();
			    if (!isNaN(subTotal)) {
			    	$tblrow.find('#credit-total').val(subTotal);
			    	var grandTotal = 0;
			    	  $("input[name='credit-name']").each(function () {
			    	        var stval = parseFloat($(this).val());
			    	        grandTotal += isNaN(stval) ? 0 : stval;
			    	    });
			    	    $('#credit-total').text(grandTotal);
			    }
			    	});
			});
		}

		
	$.fn.validateDataDetails = function(){
			var status = false;
			var totalRow = $("#tbody tr").length;
			for(i=0;i<totalRow;i++){
				if($.fn.validateData($("select[name='journal-entry-accountid-name']").eq(i).val(),/^[0-9]+$/)){
					$("select[name='journal-entry-accountid-name']").eq(i).css("border","1px solid green");
					if($.fn.validateData($("input[name='desciption-name']").eq(i).val(),/^[a-zA-Z0-9 ]+$/)){
						$("input[name='desciption-name']").eq(i).css("border","1px solid green");
						if($.fn.validateData($("input[name='debit-name']").eq(i).val(),/^[0-9]+$/)){
							$("input[name='debit-name']").eq(i).css("border","1px solid green");
							if($.fn.validateData($("input[name='credit-name']").eq(i).val(),/^[0-9]+$/)){
								$("input[name='credit-name']").eq(i).css("border","1px solid green");
									status = true;
							}else{
								$.fn.checkStatus(1,"Only numbers are allowed.")
								$("input[name='credit-name']").eq(i).css("border","1px solid red");
							}
						}else{
							$.fn.checkStatus(1,"Only numbers are allowed.")
							$("input[name='debit-name']").eq(i).css("border","1px solid red");
						}
					}else{
						$.fn.checkStatus(1,"Check description.")
						$("input[name='desciption-name']").eq(i).css("border","1px solid red");
					}
				}else{
					$.fn.checkStatus(1,"Invalid account Id.")
					$("select[name='journal-entry-accountid-name']").eq(i).css("border","1px solid red");
				}
			}
			return status;
		}
		
	
	
		/***************Add remove row
		*/
		$(document).ready(function(){
			$("#add-row").click(function(){
				$("#tbody tr:last").after(
						"<tr class='tdindex'><td><select class='form-control '  name='journal-entry-accountid-name'><option selected disabled>Select</option>"+
						"<c:AccountLedgerWithoutPurchaseTag/>"+
						"</select>"+
						"</td><td><input type='text' class='form-control '  name='desciption-name'>	</td>"+
						"<td><input type='text' class='form-control '  name='debit-name'></td>"+
						"<td><input type='text' class='form-control '  name='credit-name'></td></tr>"
						)
						$.fn.getGrossTotalOfDebit();
						$.fn.getGrossTotalOfCredit();
			})
		})
		
			$(document).ready(function(){
			$("#remove-row").click(function(){
				if($("#tbody tr").length>2){
					$("#tbody tr:last").remove()
				}else{
					$.fn.checkStatus(1,"Cannot delete rows.")
				}
			})
		})
		
		
		//$.fn.getGrossTotalOfDebit();
		//$.fn.getGrossTotalOfCredit();
		
	/*************Get data from table to save in database*/

	$.fn.getTableData = function(){
		var totalRow = $("#tbody tr").length;
		var tableData = [];
		for(i=0; i<totalRow;i++){
			var detailTableData = {
					"transactionDate":$("#journal-entry-date").val(),
					"voucherNo":$("#voucherNo").val(),
					"voucherReference":$("#journal-entry-reference").val(),
					"accountId":$("select[name='journal-entry-accountid-name'] option:selected").eq(i).val(),
					"description":$("input[name='desciption-name']").eq(i).val(),
					"debit":$("input[name='debit-name']").eq(i).val(),
					"credit":$("input[name='credit-name']").eq(i).val(),
			}
			tableData.push(detailTableData);
		}
		console.log(tableData);
		return tableData;
	}
	
	$("#save-data").click(function(){
		if($.fn.validateDataDetails() === true){
			if($("#select-company").val()!=null){
				if($("#voucherNo").val()!=""){
					if($("#journal-entry-date").val()!=""){
						if($("#journal-entry-reference").val()!=""){
							if($("#debit-total").text()!="0.00" && $("#credit-total").text()!="0.00"  ){
								if($("#debit-total").text()===$("#credit-total").text()){
									submitData();
								}else{
									$.fn.checkStatus(1,"Debit and Credit should match.")
								}
							}else{
								$.fn.checkStatus(1,"You have made unwanted refresh, re-enter values in debit and credit side.")
							}
						}else{
							$.fn.checkStatus(1,"Please enter reference.")
						}
					}else{
						$.fn.checkStatus(1,"Date not entered.")
					}
				}else{
					$.fn.checkStatus(1,"Incorrect voucher no.")
				}
			}else{
				$.fn.checkStatus(1,"Please select the company.")
			}
		}else{
			$.fn.checkStatus(1,"Incorrect data entered, please check.")
		}
	})
	
	$("#update-data").click(function(){
		if($.fn.validateDataDetails() === true){
			if($("#select-company").val()!=null){
				if($("#voucherNo").val()!=""){
					if($("#journal-entry-date").val()!=""){
						if($("#journal-entry-reference").val()!=""){
							if($("#debit-total").text()!="0.00" && $("#credit-total").text()!="0.00"  ){
								if($("#debit-total").text()===$("#credit-total").text()){
									updateData();
								}else{
									$.fn.checkStatus(1,"Debit and Credit should match.")
								}
							}else{
								$.fn.checkStatus(1,"You have made unwanted refresh, re-enter values in debit and credit side.")
							}
						}else{
							$.fn.checkStatus(1,"Please enter reference.")
						}
					}else{
						$.fn.checkStatus(1,"Date not entered.")
					}
				}else{
					$.fn.checkStatus(1,"Incorrect voucher no.")
				}
			}else{
				$.fn.checkStatus(1,"Please select the company.")
			}
		}else{
			$.fn.checkStatus(1,"Incorrect data entered, please check.")
		}
	})
		
	//Make debit or credit field read only
	document.addEventListener("change",function(e){
		var table = document.getElementById('tbody');
		if(e.srcElement.name==="debit-name"){
			var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-1;
			if(Number(e.srcElement.value) > 0){
				table.rows[rowIndex].cells[3].children[0].value=0;
				table.rows[rowIndex].cells[3].children[0].setAttribute('readonly', true);
			}else if(Number(e.srcElement.value) <= 0){
				table.rows[rowIndex].cells[3].children[0].value="";
				table.rows[rowIndex].cells[3].children[0].removeAttribute('readonly');
			}
		}else if(e.srcElement.name==="credit-name"){
			var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-1;
			if(Number(e.srcElement.value) > 0){
				table.rows[rowIndex].cells[2].children[0].value=0;
				table.rows[rowIndex].cells[2].children[0].setAttribute('readonly', true);
			}else if(Number(e.srcElement.value) <= 0){
				table.rows[rowIndex].cells[2].children[0].value="";
				table.rows[rowIndex].cells[2].children[0].removeAttribute('readonly');
			}
		}
	});
	
	
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
			document.getElementById('save-data').disabled=true;
			document.getElementById('update-data').disabled=false;
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
		var url="../processing/getJournalEntryTrData.jsp?voucherNo="+voucherNo;
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
			calculateTotal("debit");
			calculateTotal("credit");
		}
	}
	
	function setDataForUpdation(data){
		console.log(data);
		document.getElementById("select-company").value = data[0].companyId;
		document.getElementById("voucherNo").value = data[0].voucherNo;
		document.getElementById("journal-entry-date").value = data[0].transactionDate;
		document.getElementById("journal-entry-reference").value = data[0].voucherReference;
		var table = document.getElementById("tbody");
		table.innerHTML = "";
		for(i=0; i<data.length; i++){
			var noOfRows = table.rows.length;
			var row = table.insertRow(noOfRows);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			
			cell1.innerHTML = "<td><select class='form-control '  name='journal-entry-accountid-name'><option selected disabled>Select</option>"+
							  "<c:AccountLedgerWithoutPurchaseTag/>"+
							  "</select>"+
							  "</td>"
			document.getElementsByName("journal-entry-accountid-name")[i].value=data[i].accountId;
			cell2.innerHTML = "</td><td><input type='text' class='form-control '  name='desciption-name' value="+data[i].narration+"></td>";
			if(Number(data[i].debit)>0){
				cell3.innerHTML = "<td><input type='text' class='form-control '  name='debit-name' value="+data[i].debit+"></td>";
				cell4.innerHTML = "<td><input type='text' class='form-control '  name='credit-name' value='0' readonly></td>";
			
			}else if(Number(data[i].credit)>0){
				cell3.innerHTML = "<td><input type='text' class='form-control '  name='debit-name' value='0' readonly></td>";
				cell4.innerHTML = "<td><input type='text' class='form-control '  name='credit-name' value="+data[i].credit+"></td>";
			}
		}
	}
	
	function calculateTotal(trType){
		if(trType==="credit"){
			var creditCells = document.getElementsByName("credit-name");
			var total=0;
			for(i=0; i<creditCells.length; i++){
				total = Number(total) + Number(creditCells[i].value);
				$('#credit-total').text(total);
			}
		}else if(trType==="debit"){
			var debitCells = document.getElementsByName("debit-name");
			var total=0;
			for(i=0; i<debitCells.length; i++){
				total = Number(total) + Number(debitCells[i].value);
				$('#debit-total').text(total);
			}
		}
	}
	
	
	document.addEventListener('keyup',function(e){
		if(e.srcElement.name==="credit-name"){
			calculateTotal("credit");
		}else if(e.srcElement.name==="debit-name"){
			calculateTotal("debit");
		}
	});
	
	function updateData(){
		document.getElementById('form').action="../processing/updateJournalEntry.jsp";
		var jsonData = $.fn.getTableData();
		var data = JSON.stringify(jsonData);
		document.getElementById("output").value=data;
		document.getElementById("form").submit();
	}
	
	
	function submitData(){
		document.getElementById('form').action="../processing/addTransactionFromJournalEntry.jsp";
		var jsonData = $.fn.getTableData();
		var data = JSON.stringify(jsonData);
		document.getElementById("output").value=data;
		document.getElementById("form").submit();
	}
	
	/**************************************
	Response window code
	**************************************/
	var sessionId = {
			"getSessionId":<%=session.getAttribute("transactionId") %>,
	}
	$(document).ready(function(){
		if(Number(sessionId.getSessionId) === 0){
			$.fn.checkStatus(1,"Unable to save transaction!")
		}else if(Number(sessionId.getSessionId) > 0){
			$.fn.checkStatus(sessionId.getSessionId,"Transaction has been recorded successfully!")
		}
		
	});
<%
session.removeAttribute("transactionId");
%>		
		</script>
</body>
</html>
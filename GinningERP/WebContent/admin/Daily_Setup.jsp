<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Daily Setup</title>
</head>

<body>

<%@include file="../admin/Top_Nav.html" %>
<div class="container-fluid container-mr-t">
	<%@include file="../admin/Side_bar.html" %>
			<div class="row mt-2 row-background border-bottom">
				<div class="col-md-3">
					<div class="d-flex justify-content-start align-items-center">
						<img src="../property/img/factory.png" alt="warehouse">&nbsp;
						<h4 class="lbl-rm-all">Daily Setup</h4>
					</div>
				</div>
				<div class="col-md-3">
					<h4 class="lbl-rm-all" id="todaysDate"></h4>
				</div>
				
				<div class="col-md-3 offset-md-3 text-right">
					<button type="button" class="btn btn-success" id="addCompany">Add Company</button>
				</div>
			</div>
			<form id="dailySetupForm" action='../processing/addDailySetup.jsp'>
					<input type="hidden" name="dailySetupOutput" id="dailySetupOutput" />
			</form>
			<form id="addChequeForm" action='../processing/addCheques.jsp'>
					<input type="hidden" name="addCheques" id="addCheques" />
			</form>
			<form id="deleteDailySetupForm" action='../processing/deleteDailySetupEntry.jsp'>
					<input type="hidden" name="dailySetupId" id="dailySetupId" />
			</form>
			<div class="row row-background">
				<div class="col-md-3">
						<label class="lbl-rm-l">Setup Company</label>
					<select class="form-control form-control-sm" name="companyId" id="companyId">
						<option selected disabled>Select</option>
						<c:Company />
					</select>
				</div>
				<div class="col-md-2">
					<label class="lbl-rm-l">Heap</label>
					<select class="form-control form-control-sm" name="todayHeap" id="todayHeap">
						<option selected disabled>Select</option>
						<option value="Heap A">Heap A</option>
						<option value="Heap B">Heap B</option>
						<option value="Heap C">Heap C</option>
					</select>
				</div>
				<div class="col-md-3">
		      		<label class="lbl-rm-l">Bank</label>
		      		<div class="">
		      		<select class="form-control form-control-sm" name="chequeBankId" id="chequeBankId">
		      			<option selected disabled>Select</option>
		      			<c:Bank />
		      		</select>
		      		</div>
	      		</div>
	      		<div class="col-md-auto">
					<label class="lbl-rm-l">Bonus Addition</label>
					<input class="form-control form-control-sm" name="bonusAmount" id="bonusAmount" value="0">
				</div>
			</div>
				<div class="row row-background">
					<div class="col-md-12">
						<table class="table table-bordered" id="companySetupTable">
							<thead>
								<tr class="table-back">
									<th rowspan="2" width="5%" >DS ID</th>
									<th rowspan="2" width="5%" style="vertical-align:middle;">Sr No</th>
									<th rowspan="2" width="9%" style="vertical-align:middle;">Date</th>
									<th rowspan="2" width="8%" style="vertical-align:middle;">Setup Time</th>
									<th rowspan="2" width="20%" style="vertical-align:middle;">Company Name</th>
									<th rowspan="2" width="10%" style="vertical-align:middle;">Heap</th>
									<th rowspan="2" width="15%" style="vertical-align:middle;">Bank</th>
									<th rowspan="2" width="5%" style="vertical-align:middle;">Bonus Amount</th>
									<th colspan="2" style="vertical-align:middle;text-align:center;">Cheque Series</th>
									<th rowspan="2" width="5%" style="vertical-align:middle;">Setup</th>
									<th rowspan="2" width="5%" style="vertical-align:middle;">Update</th>
									<th rowspan="2" >Weighment Entries</th>
									<th rowspan="2"></th>
								</tr>
								<tr class="table-back">
									<th width="7%" style="vertical-align:middle;text-align:center;">From</th>
									<th width="7%" style="vertical-align:middle;text-align:center;">To</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							 	<tr>
							 	
									<td>
										<input type="text" class="form-control form-control-sm" id="setupId" name="setupId" readonly>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="srNoTable" name="srNoTable" >
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="dateTable" name="dateTable" >
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="setupTimeTable" name="setupTimeTable" >
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="companyNameTable" name="companyNameTable" data-company-id="" value="" >
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="heapTable" name="heapTable" >
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="bankTable" name="bankTable" data-bank-id="" >
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="bonusAmountTable" name="bonusAmountTable" >
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" name="firstChequeNo" id="firstChequeNo"/>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" name="lastChequeNo" id="lastChequeNo"/>
									</td>
									<td>
										<button type="button" class="btn btn-success btn-sm" id="setup" name="setup">Setup</button>
									</td>
									<td>
										<button type="button" class="btn btn-success btn-sm" id="update" name="update">Update</button>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="weighmentEntries" name="weighmentEntries" readonly>
									</td>
									<td>
										<img src="../property/img/delete.png" alt="delete">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row row-background">
						<div class="col-md-6">
							<table class="table table-bordered">
								<thead>
									<tr class="table-back">
										<th colspan="3" style="vertical-align:middle;text-align:center;">General Rates</th>
									</tr>
									<tr class="table-back">
										<th width="5%" >Sr No</th>
										<th width="20%">Grade</th>
										<th width="20%">Rate</th>
									</tr>
								</thead>
								<tbody id="gradeTableBody">
								</tbody>
							</table>
						</div>
						
							<div class="col-md-6">
							<table class="table table-bordered">
								<thead>
									<tr class="table-back">
										<th colspan="3" style="vertical-align:middle;text-align:center;">Bonus Card Rates</th>
									</tr>
									<tr class="table-back">
										<th width="5%" >Sr No</th>
										<th width="20%">Grade</th>
										<th width="20%">Rate</th>
									</tr>
								</thead>
								<tbody id="bonusTableBody">
								</tbody>
							</table>
						</div>
						
					</div>
				
			<div class="row  row-background border-top">
					<div class="col-md-3">
						<div class="d-flex justify-content-start align-items-center">
						<img src="../property/img/purse.png" alt="warehouse">&nbsp;
						<h4 class="lbl-rm-b">Cash Balance</h4>
						</div>
						<input type="text" id="responseId" name="" value="<%=session.getAttribute("setupId") %>">
					</div>
					
					<div class="col-md-3">
						<div class="d-flex justify-content-start align-items-center">
						<input type="text" class="form-control form-control-sm" name="cashAddition" id="cashAddition" readonly>
						&nbsp;&nbsp;
						<img src="../property/img/add.png" alt="add" class="ctm-hover" id="callCashModal">
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="d-flex justify-content-start align-items-center">
						<img src="../property/img/purse.png" alt="warehouse">&nbsp;
						<h4 class="lbl-rm-b">Bank Balance</h4>
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="d-flex justify-content-start align-items-center">
						<input type="text" class="form-control form-control-sm" name="bankAddition" id="bankAddition" readonly>
						&nbsp;&nbsp;
						<img src="../property/img/add.png" alt="add" class="ctm-hover" id="callBankModal">
						</div>
					</div>
			</div>
			
			
			<div class="row row-background" id="bankDetails">
				
			</div>
			
			
			<!-- **********************CASH ADDITION POP-UP -->
			<div class="modal fade" id="cashAdditionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-xl" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">Cash Journal Entry</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<form action="../processing/addCashDailySetup.jsp" id="addCashForm">
			      		<div class="form-row">
			      			<div class="col-md-auto">
			      				<label>Date</label>
			      				<input type="date" class="form-control form-control-sm" id="addCashDate" name="addCashDate">
			      			</div>
			      			<div class="col-md-auto">
			      				<label>Reference</label>
			      				<input type="text" class="form-control form-control-sm" id="addCashReference" name="addCashReference">
			      			</div>
			      			<div class="col-md-auto">
			      				<label>Voucher No</label>
			      				<input type="text" class="form-control form-control-sm" id="addCashVoucher" name="addCashVoucher" readonly>
			      			</div>
			      		</div>
			      		<div class="form-row">
			      			<div class="col-md-2">
			      				<label>Account</label>
			      				<select class="form-control form-control-sm" id="addCashAccount" name="addCashAccount">
			      					<c:CashLedgerTag/>
			      				</select>
			      			</div>
			      			<div class="col-md-6">
			      				<label>Description</label>
			      				<input type="text" class="form-control form-control-sm" id="addCashDescription" name="addCashDescription">
			      			</div>
			      			<div class="col-md-2">
			      				<label>Amount</label>
			      				<input type="text" class="form-control form-control-sm" id="addCashAmount" name="addCashAmount">
			      			</div>
			      			<div class="col-md-2">
			      				<label>Mode</label>
			      				<select class="form-control form-control-sm" id="addCashMode" name="addCashMode">
			      					<c:CashAddModeTag/>
			      				</select>
			      			</div>
			      		</div>
			      		
			      	</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary btn-sm" id="addCashButton">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			 <!-- *********************BANK ADDITION************************ -->
			
			<div class="modal fade" id="bankAdditionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-xl" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">Bank Journal Entry</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      		<form action="../processing/addBankDailySetup.jsp" id="addBankForm">
			      		<div class="form-row">
			      			<div class="col-md-auto">
			      				<label>Date</label>
			      				<input type="date" class="form-control form-control-sm" id="addBankDate" name="addBankDate">
			      			</div>
			      			<div class="col-md-auto">
			      				<label>Reference</label>
			      				<input type="text" class="form-control form-control-sm" id="addBankReference" name="addBankReference">
			      			</div>
			      			<div class="col-md-auto">
			      				<label>Voucher No</label>
			      				<input type="text" class="form-control form-control-sm" id="addBankVoucher" name="addBankVoucher" readonly>
			      			</div>
			      		</div>
			      		<div class="form-row">
			      			<div class="col-md-2">
			      				<label>Account</label>
			      				<select class="form-control form-control-sm" id="addBankAccountId" name="addBankAccountId">
			      					<c:BankLedgerTag/>
			      				</select>
			      			</div>
			      			<div class="col-md-6">
			      				<label>Description</label>
			      				<input type="text" class="form-control form-control-sm" id="addBankDesc" name="addBankDesc">
			      			</div>
			      			<div class="col-md-2">
			      				<label>Amount</label>
			      				<input type="text" class="form-control form-control-sm" id="addBankAmount" name="addBankAmount">
			      			</div>
			      			<div class="col-md-2">
			      				<label>Mode</label>
			      				<select class="form-control form-control-sm" id="addBankMode" name="addBankMode">
			      					<c:BankAddModeTag/>
			      				</select>
			      			</div>
			      		</div>
			      	</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary btn-sm" id="submitBankAddition">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			</div>
		<!-- *********************RESPONSE************************  -->		
		<div class="response-background">
			<div class="response">
				<div class="d-flex justify-content-center align-items-center">
					<div id="responseText"><h4>Company has been setup successfully</h4></div>
				</div>
				<div class="d-flex justify-content-center align-items-center mt-2">
					<button type="button" class="btn btn-success btn-sm ml-1" id="responseBtn">OK</button>
				</div>
			</div>
		</div>
		
	
	
	
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/dailysetup.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	
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
			document.getElementById("addBankVoucher").value = voucherNo;
			document.getElementById("addCashVoucher").value = voucherNo;
		}
	}
	
	function getSetupReport(companyId){
		var url="../processing/fetchDailySetup.jsp";
		if(window.XMLHttpRequest){  
			fetchSetupReport=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchSetupReport=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchSetupReport.onreadystatechange=fetchSetupData;  
			console.log("AJAX Req sent");
			fetchSetupReport.open("GET",url,true);  
			fetchSetupReport.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function fetchSetupData()
	{
		if(fetchSetupReport.readyState == 4){
			var response = this.response.trim();
			setSetupDataInTable(response)
		}
	}
	
	function setSetupDataInTable(response){
		var data = JSON.parse(response);
		var setupArrLength = data.length;
		
		var tableBody = document.getElementById("tableBody");
		if(setupArrLength != 0){
			console.log(data);
			for(i=0; i<=setupArrLength; i++){
				if(i===0){
					tableBody.rows[0].cells[0].children[0].value = data[i].id;
					tableBody.rows[0].cells[1].children[0].value = 1;
					tableBody.rows[0].cells[2].children[0].value = data[i].setupDate;
					tableBody.rows[0].cells[3].children[0].value = data[i].setupTime;
					tableBody.rows[0].cells[4].children[0].setAttribute("data-company-id",data[i].companyId);
					tableBody.rows[0].cells[4].children[0].value = data[i].companyName;
					tableBody.rows[0].cells[5].children[0].value = data[i].cottonHeap;
					tableBody.rows[0].cells[6].children[0].setAttribute("data-bank-id", data[i].bankId);
					tableBody.rows[0].cells[6].children[0].value = data[i].bankName;
					tableBody.rows[0].cells[7].children[0].value = data[i].bonusAmount;
					tableBody.rows[0].cells[8].children[0].value = data[i].firstChequeNo;
					tableBody.rows[0].cells[8].children[0].readOnly = true;
					tableBody.rows[0].cells[9].children[0].value = data[i].lastChequeNo;
					tableBody.rows[0].cells[12].children[0].value = data[i].weighmentEntries;
					tableBody.rows[0].cells[10].children[0].disabled=true;
					tableBody.rows[0].cells[11].children[0].disabled=false;
					
				
				}else if(i === setupArrLength){
					var rowNumber = tableBody.rows.length;
					var row = tableBody.insertRow(rowNumber);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					var cell5 = row.insertCell(4);
					var cell6 = row.insertCell(5);
					var cell7 = row.insertCell(6);
					var cell8 = row.insertCell(7);
					var cell9 = row.insertCell(8);
					var cell10 = row.insertCell(9);
					var cell11 = row.insertCell(10);
					var cell12 = row.insertCell(11);
					var cell13 = row.insertCell(12);
					
					//cell1.hidden=true;
					
					cell1.innerHTML = '<input type="text" class="form-control form-control-sm" id="setupId" name="setupId" value="" readonly>';
					cell2.innerHTML = '<input type="text" class="form-control form-control-sm" id="srNoTable" name="srNoTable" value="'+(i+1)+'" readonly>';
					cell3.innerHTML = '<input type="text" class="form-control form-control-sm" id="dateTable" name="dateTable" value="" readonly>';
					cell4.innerHTML = '<input type="text" class="form-control form-control-sm" id="setupTimeTable" name="setupTimeTable" value="" readonly>';
					cell5.innerHTML = '<input type="text" class="form-control form-control-sm" id="companyNameTable" name="companyNameTable" data-company-id="" value="" readonly>';
					cell6.innerHTML = '<input type="text" class="form-control form-control-sm" id="heapTable" name="heapTable" value="" readonly>';
					cell7.innerHTML = '<input type="text" class="form-control form-control-sm" id="bankTable" name="bankTable" data-bank-id="" value="" readonly>';
					cell8.innerHTML = '<input type="text" class="form-control form-control-sm" id="bonusAmountTable" name="bonusAmountTable" value="" readonly>';
					cell9.innerHTML = '<input type="text" class="form-control form-control-sm" id="firstChequeNo" name="firstChequeNo" value="">';
					cell10.innerHTML = '<input type="text" class="form-control form-control-sm" id="lastChequeNo" name="lastChequeNo" value="">';
					cell11.innerHTML = '<button type="button" class="btn btn-success btn-sm" id="setup" name="setup" disabled="false">Setup</button>';
					cell12.innerHTML = '<button type="button" class="btn btn-success btn-sm" id="update" name="update" disabled="false">Update</button>';
					cell13.innerHTML = '<input type="text" class="form-control form-control-sm" id="weighEntries" name="weighEntries" value="" readonly>';
					
				}
				else{
					var rowNumber = tableBody.rows.length;
					var row = tableBody.insertRow(rowNumber);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					var cell5 = row.insertCell(4);
					var cell6 = row.insertCell(5);
					var cell7 = row.insertCell(6);
					var cell8 = row.insertCell(7);
					var cell9 = row.insertCell(8);
					var cell10 = row.insertCell(9);
					var cell11 = row.insertCell(10);
					var cell12 = row.insertCell(11);
					var cell13 = row.insertCell(12);
					var cell14 = row.insertCell(13);
					//cell1.hidden=true;
					
					cell1.innerHTML = '<input type="text" class="form-control form-control-sm" id="setupId" name="setupId" value="'+data[i].id+'" readonly>';
					cell2.innerHTML = '<input type="text" class="form-control form-control-sm" id="srNoTable" name="srNoTable" value="'+(i+1)+'" readonly>';
					cell3.innerHTML = '<input type="text" class="form-control form-control-sm" id="dateTable" name="dateTable" value="'+data[i].setupDate+'" readonly>';
					cell4.innerHTML = '<input type="text" class="form-control form-control-sm" id="setupTimeTable" name="setupTimeTable" value="'+data[i].setupTime+'" readonly>';
					cell5.innerHTML = '<input type="text" class="form-control form-control-sm" id="companyNameTable" name="companyNameTable" data-company-id="'+data[i].companyId+'" value="'+data[i].companyName+'" readonly>';
					cell6.innerHTML = '<input type="text" class="form-control form-control-sm" id="heapTable" name="heapTable" value="'+data[i].cottonHeap+'" readonly>';
					cell7.innerHTML = '<input type="text" class="form-control form-control-sm" id="bankTable" name="bankTable" data-company-id="'+data[i].bankId+'" value="'+data[i].bankName+'" readonly>';
					cell8.innerHTML = '<input type="text" class="form-control form-control-sm" id="bonusAmountTable" name="bonusAmountTable" value="'+data[i].bonusAmount+'" readonly>';
					cell9.innerHTML = '<input type="text" class="form-control form-control-sm" id="firstChequeNo" name="firstChequeNo" value="'+data[i].firstChequeNo+'" readonly>';
					cell10.innerHTML = '<input type="text" class="form-control form-control-sm" id="lastChequeNo" name="lastChequeNo" value="'+data[i].lastChequeNo+'">';
					cell11.innerHTML = '<button type="button" class="btn btn-success btn-sm" id="setup" name="setup" disabled="false">Setup</button>';
					cell12.innerHTML = '<button type="button" class="btn btn-success btn-sm" id="update" name="update" >Update</button>';
					cell13.innerHTML = '<input type="text" class="form-control form-control-sm" id="weighEntries" name="weighEntries" value="'+data[i].weighmentEntries+'" readonly>';
					cell14.innerHTML = '<img src="../property/img/delete.png" alt="delete">';
				
				}
			}
			var inputElements = document.getElementsByTagName("input")
			for(j=0;j<inputElements.length;j++){
				if(inputElements[j].name === "srNoTable" || inputElements[j].name === "dateTable" || inputElements[j].name === "setupTimeTable" || inputElements[j].name === "companyNameTable" ||inputElements[j].name === "heapTable" || inputElements[j].name === "bankTable" || inputElements[j].name === "bonusAmountTable"|| inputElements[j].name === "weighEntries"){
					inputElements[j].setAttribute("readonly","");
				}
			}
		}
	}
	
	 function gradeReport(){
			var url="../processing/gradeReport.jsp";
			
			if(window.XMLHttpRequest){  
				dataRequest=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				dataRequest=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				dataRequest.onreadystatechange=getGradeData;  
				console.log("AJAX Req sent");
				dataRequest.open("GET",url,true);  
				dataRequest.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		
	function getGradeData(){
		
		if(dataRequest.readyState == 4){
			var gradeData = this.response.trim();
			setGradeData(gradeData);
		}
	}
	
	function setGradeData(gradeData){
		var json = JSON.parse(gradeData);
		var table = document.getElementById('gradeTableBody');
		for(i=0; i< json.length; i++){
			var rowNumber = table.rows.length;
			var row = table.insertRow(rowNumber);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			
			cell2.hidden=true;
			cell2.id= "gradeId"+(i+1);
			
			cell1.innerHTML = (i+1);
			cell2.innerHTML = json[i].id;
			cell3.innerHTML = json[i].grade;
			cell4.innerHTML = '<input class="form-control form-control-sm lbl-rm-all" type="text" name="gradeRate" id="gradeRate'+(i+1)+'" value = "'+json[i].rate+'" />';
		}
		setBonusData(gradeData);
	}
	

	function setBonusData(gradeData){
		var json = JSON.parse(gradeData);
		var table = document.getElementById('bonusTableBody');
		document.getElementById("")
		for(i=0; i< json.length; i++){
			var rowNumber = table.rows.length;
			var row = table.insertRow(rowNumber);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			
			cell2.hidden=true;
			cell2.id= "gradeId"+(i+1);
			
			cell1.innerHTML = (i+1);
			cell2.innerHTML = json[i].id;
			cell3.innerHTML = json[i].grade;
			cell4.innerHTML = '<input class="form-control form-control-sm lbl-rm-all" type="text" name="bonusgradeRate" id="bonusgradeRate'+(i+1)+'"  />';
		}
	}
	
	
	callModalPopup("callCashModal","cashAdditionModal"); // Calling Cash Addition Pop-up
	callModalPopup("callBankModal","bankAdditionModal"); // Calling Bank Addition Pop-up
	
	document.addEventListener('click',function(e){// calling submit form function
		if(e.srcElement.name === "setup"){
			var rowIndex = e.srcElement.parentElement.parentElement.rowIndex-2;
			if(appController.validateCompanyAndGradeData(rowIndex) === true){
				submitDailySetup(rowIndex);
			}
		}
	})
	
	function submitDailySetup(rowIndex){
		
		jsonObj = {};
		
		jsonObj['bonusAmount'] = document.getElementsByName('bonusAmountTable')[rowIndex].value
		jsonObj['companyId'] = document.getElementsByName('companyNameTable')[rowIndex].getAttribute("data-company-id");
		jsonObj['date'] = document.getElementsByName('dateTable')[rowIndex].value;
		jsonObj['setupTime'] = document.getElementsByName('setupTimeTable')[rowIndex].value;
		jsonObj['heap'] = document.getElementsByName('heapTable')[rowIndex].value;
		jsonObj['todaysBankId'] = document.getElementsByName('bankTable')[rowIndex].getAttribute("data-bank-id");
		jsonObj['firstChequeNo'] = document.getElementsByName('firstChequeNo')[rowIndex].value;
		jsonObj['lastChequeNo'] = document.getElementsByName('lastChequeNo')[rowIndex].value;
		jsonObj['totalCheques'] = (Number(document.getElementsByName('lastChequeNo')[rowIndex].value)-Number(document.getElementsByName('firstChequeNo')[rowIndex].value)+1).toString();

		jsonArray = [];
		
		var noOfRows = document.getElementById('gradeTableBody').childElementCount;
		for(i=0; i<noOfRows;i++){
			gradeRate = {};
			gradeRate['gradeId'] = document.getElementById('gradeId'+(i+1)).innerHTML;
			gradeRate['gradeRate'] = document.getElementById('gradeRate'+(i+1)).value;
			
			jsonArray.push(gradeRate);
		}
		
		jsonObj['gradeRates'] = jsonArray;
		var jsonStr = JSON.stringify(jsonObj);
		console.log(jsonStr);
		document.getElementById('dailySetupOutput').value=jsonStr;
		document.getElementById('dailySetupForm').submit();
	}

	document.addEventListener('keyup', function(e){
		if(e.srcElement.id.includes('gradeRate')){
			var bonusAmt = Number(document.getElementById('bonusAmount').value);
			var element = document.getElementById('bonus'+e.srcElement.id);
			element.value = Number(e.srcElement.value)+Number(bonusAmt);
		}
	})
	document.addEventListener('keyup', function(e){
		if(e.srcElement.id ==='bonusAmount'){
			var gradeRates = document.getElementsByName('gradeRate');
			var bonusRates = document.getElementsByName('bonusgradeRate');
			for(i=0;i<gradeRates.length;i++){
				gradeRate = gradeRates[i].value;
				bonusRates[i].value = Number(gradeRate)+Number(e.srcElement.value);
			}
		}
	})
	
	document.addEventListener('click',function(e){
		if(e.srcElement.name === "update"){
			var rowIndex = e.srcElement.parentElement.parentElement.rowIndex-2;
			addCheques(rowIndex);
		}
	})
	
	function addCheques(rowIndex){
		
		jsonObj={};
		
		jsonObj['firstChequeNo'] = document.getElementsByName('firstChequeNo')[rowIndex].value;
		jsonObj['lastChequeNo'] = document.getElementsByName('lastChequeNo')[rowIndex].value;
		jsonObj['totalCheques'] = (Number(document.getElementsByName('lastChequeNo')[rowIndex].value)-Number(document.getElementsByName('firstChequeNo')[rowIndex].value)+1).toString();
		jsonObj['setupId'] = document.getElementsByName('setupId')[rowIndex].value;
		var jsonStr = JSON.stringify(jsonObj);
		document.getElementById('addCheques').value=jsonStr;
		document.getElementById('addChequeForm').submit();
	}
	
	function setDisplayDate(){
		var today = new Date();
		var date1 = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		document.getElementById('todaysDate').innerHTML = date1;
	}
	
	document.getElementById("addCashButton").addEventListener("click",function(e){
		document.getElementById("addCashForm").submit();
	})
	
	document.getElementById("submitBankAddition").addEventListener('click',function(e){
		document.getElementById("addBankForm").submit();
	})
	
	document.getElementById("companyId").addEventListener("change",function(e){
			var bankOptions = document.getElementById("chequeBankId").options;
			for(i=0; i<bankOptions.length; i++){
					bankOptions[i].disabled = false;
				}
			for(i=0; i<bankOptions.length; i++){
				if(e.srcElement.value != bankOptions[i].getAttribute("data-company-id")){
					bankOptions[i].disabled = true;
				}
			}
	})
		
	document.addEventListener("click", function(e){
		if(e.srcElement.alt==="delete"){
			var rowIndex = Number(e.srcElement.parentNode.parentNode.rowIndex)-2;
			var tableBody = document.getElementById("tableBody");
			var dailySetupId = tableBody.rows[rowIndex].cells[0].children[0].value;
			deleteDailySetupEntry(dailySetupId);//calling to delete entry method
		}
	})
	
	function deleteDailySetupEntry(dailySetupId){
		document.getElementById("dailySetupId").value = dailySetupId;
		document.getElementById("deleteDailySetupForm").submit()
	}
	
	gradeReport();
	getSetupReport();
	setDisplayDate();
	fetchVoucherNoSeries();
	
	function responseScreen(){
		var responseId= document.getElementById("responseId").value;
		if(responseId>0){
			document.getElementsByClassName("response-background")[0].style.display = "block";
			document.getElementsByClassName("response")[0].style.display = "block";
		}else if(responseId===0){
			document.getElementsByClassName("response-background")[0].style.display = "block";
			document.getElementsByClassName("response")[0].style.display = "block";
			document.getElementById("responseText").querySelector("h4").innerHTML = "Company setup is unsuccessful";
		}else if(responseId===null){
			}
	}
	
	
	document.getElementById("responseBtn").addEventListener("click",function(){
		document.getElementsByClassName("response-background")[0].style.display = "none";
		document.getElementsByClassName("response")[0].style.display = "none";
		document.getElementById("responseId").value=0;
	})
	
	responseScreen();
	</script>
	<% session.removeAttribute("setupId"); %>
</body>
</html>
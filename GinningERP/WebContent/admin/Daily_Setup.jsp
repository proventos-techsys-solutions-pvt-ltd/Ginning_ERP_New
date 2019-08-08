<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
 	<div class="row row-background border-bottom">
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
			<button type="button" class="btn btn-success" id="lockUsers">Lock Users</button>
		</div>
	</div>
	<form action='../processing/addDailySetup.jsp'>
			<input type="hidden" name="dailySetupOutput" id="dailySetupOutput" />
	</form>
    <div class="row row-background">
				<div class="col-md-3">
					<div class="d-flex justify-content-start align-items-center">
						<img src="../property/img/factory.png" alt="warehouse">&nbsp;
						<label class="lbl-rm-l">Setup Company</label>
					</div>
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
	      		<div class="col-md-2">
					<label class="lbl-rm-l">Bonus Addition</label>
					<input class="form-control form-control-sm" name="bonusAmount" id="bonusAmount">
				</div>
			</div>
			<div class="row row-background">
					<div class="col-md-12">
						<table class="table table-bordered" id="companySetupTable">
							<thead>
								<tr class="table-back">
									<th rowspan="2" width="5%" style="vertical-align:middle;">Sr No</th>
									<th rowspan="2" width="8%" style="vertical-align:middle;">Date</th>
									<th rowspan="2" width="8%" style="vertical-align:middle;">Setup Time</th>
									<th rowspan="2" width="8%" style="vertical-align:middle;">Discard Time</th>
									<th rowspan="2" width="25%" style="vertical-align:middle;">Company Name</th>
									<th rowspan="2" width="10%" style="vertical-align:middle;">Heap</th>
									<th rowspan="2" width="15%" style="vertical-align:middle;">Bank</th>
									<th colspan="2" style="vertical-align:middle;text-align:center;">Cheque Series</th>
									<th rowspan="2" width="5%" style="vertical-align:middle;">Setup</th>
									<th rowspan="2" width="5%" style="vertical-align:middle;">Update</th>
								</tr>
								<tr class="table-back">
									<th width="7%" style="vertical-align:middle;text-align:center;">From</th>
									<th width="7%" style="vertical-align:middle;text-align:center;">To</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="text" class="form-control form-control-sm" id="srNoTable" name="srNoTable" readonly>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="dateTable" name="dateTable" readonly>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="setupTimeTable" name="setupTimeTable" readonly>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="discardTimeTable" name="discardTimeTable" readonly>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="companyNameTable" name="companyNameTable" readonly>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="heapTable" name="heapTable" readonly>
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="bankTable" name="bankTable" readonly>
									</td>
									<td>
										<input class="form-control form-control-sm" name="firstChequeNo" id="firstChequeNo"/>
									</td>
									<td>
										<input class="form-control form-control-sm" name="lastChequeNo" id="lastChequeNo"/>
									</td>
									<td>
										<button type="button" class="btn btn-success btn-sm" id="setup" name="setup">Setup</button>
									</td>
									<td>
										<button type="button" class="btn btn-success btn-sm" id="update" name="update">Update</button>
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
				
			<div class="row mt-2 row-background">
				<div class="d-flex justify-content-between align-items-center">
					<img src="../property/img/purse.png" alt="warehouse">&nbsp;
					<h4  class="lbl-rm-b">Cash Details</h4>
				</div>
			</div>
			
			<div class="row row-background">
				<div class="col-md-3">
					<label class="lbl-rm-l">Opening Balance</label>
					<input type="text" class="form-control form-control-sm" name="cashOpening" id="cashOpening" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Addition Today &nbsp;<img src="../property/img/add.png" alt="add" class="ctm-hover" id="callCashModal"></label>
					<input type="text" class="form-control form-control-sm" name="cashAddition" id="cashAddition" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Utilized Today</label>
					<input type="text" class="form-control form-control-sm" name="cashUtilized" id="cashUtilized" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Closing Balance</label>
					<input type="text" class="form-control form-control-sm" name="closingBalance" id="closingBalance" readonly>
				</div>
			</div>
			
			<div class="row mt-2 row-background">
				<div class="d-flex justify-content-between align-items-center">
					<img src="../property/img/account.png" alt="warehouse">&nbsp;
					<h4  class="lbl-rm-b">Bank Details</h4>
				</div>
			</div>
			
			<div class="row row-background" id="bankDetails">
				
			</div>
			
			<!-- **********************CASH ADDITION POP-UP -->
			<div class="modal fade" id="cashAdditionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">Cash Addition Details</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item">
					    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Cash</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Bank</a>
					  </li>
					</ul>
					<div class="tab-content" id="myTabContent">
					<!-- ********************* CASH ADDITION************************ -->
					  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					  	 <form>
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Date</label>
						      		<input type="date" class="form-control form-control-sm" name="addCashDate" id="addCashDate">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Voucher No</label>
						      		<input type="text" class="form-control form-control-sm" name="addCashVoucher" id="addCashVoucher" placeholder="Voucher No.">
					      		</div>
					      	</div> 
				      		<div class="form-row">
					      		<div class="col-md-12">
						      		<label class="lbl-rm-l lbl-rm-t">Description</label>
						      		<input type="text" class="form-control form-control-sm" name="addCashDesc" id="addCashDesc" value="">
					      		</div>
					      	</div> 
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l lbl-rm-t">Amount</label>
						      		<input type="text" class="form-control form-control-sm" name="addCashAmount" id="addCashAmount" value="">
					      		</div>
					      		<div class="col-md-8">
					      			<label class="lbl-rm-l lbl-rm-t">Reference</label>
					      			<input type="text" class="form-control form-control-sm" name="addcashRef" id="addcashRef" value="">
				      			</div>
					      	</div> 
					      </form>
					  </div>
					  
					  
					  <!-- *********************BANK CASH CONTRA ADDITION************************ -->
					  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					  	 <form>
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Date</label>
						      		<input type="text" class="form-control form-control-sm" name="contraBankDate" id="contraBankDate" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Voucher No</label>
						      		<input type="text" class="form-control form-control-sm" name="contraBankVoucher" id="contraBankVoucher" >
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Bank</label>
						      		<select class="form-control form-control-sm" name="contraBankId" id="contraBankId">
						      			<option selected disabled>Select</option>
						      			<c:Bank />
						      		</select>
					      		</div>
					      	</div> 
				      		<div class="form-row">
					      		<div class="col-md-12">
						      		<label class="lbl-rm-l lbl-rm-t">Description</label>
						      		<input type="text" class="form-control form-control-sm" name="contraBankDesc" id="contraBankDesc" value="">
					      		</div>
					      	</div> 
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l lbl-rm-t">Amount</label>
						      		<input type="text" class="form-control form-control-sm" name="contraBankAmt" id="contraBankAmt" value="">
					      		</div>
					      		<div class="col-md-8">
					      			<label class="lbl-rm-l lbl-rm-t">Reference</label>
					      			<input type="text" class="form-control form-control-sm" name="contraBankRef" id="contraBankRef" value="">
				      			</div>
					      	</div> 
					      </form>
					  </div>
					  
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary btn-sm">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			 <!-- *********************BANK ADDITION************************ -->
			
			<div class="modal fade" id="bankAdditionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog " role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">Bank Addition Details</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      		<form>
			      			<div class="form-row">
			      				<div class="col-md-4">
						      		<label class="lbl-rm-l">Date</label>
						      		<input type="text" class="form-control form-control-sm" name="addBankDate" id="addBankDate" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Voucher No</label>
						      		<input type="text" class="form-control form-control-sm" name="addBankVoucher" id="addBankVoucher" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Mode</label>
						      		<select class="form-control form-control-sm" name="addBankMode" id="addBankMode">
						      			<option value="">Cheque</option>
						      			<option value="">RTGS</option>
						      			<option value="">Cash</option>
						      		</select>
					      		</div>
			      			</div>
			      			<div class="form-row">
					      		<div class="col-md-12">
						      		<label class="lbl-rm-l lbl-rm-t">Description</label>
						      		<input type="text" class="form-control form-control-sm" name="addBankDesc" id="addBankDesc" value="">
					      		</div>
					      	</div> 
					      	<div class="form-row">
					      		<div class="col-md-4">
					      			<label class="lbl-rm-l lbl-rm-t">Amount</label>
					      			<input type="text" class="form-control form-control-sm" name="addBankAmount" id="addBankAmount" value="">
				      			</div>
				      			<div class="col-md-8">
					      			<label class="lbl-rm-l lbl-rm-t">Reference</label>
					      			<input type="text" class="form-control form-control-sm" name="addBankRef" id="addBankRef" value="">
				      			</div>
					      	</div>
			      		</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary btn-sm">Save</button>
			      </div>
			    </div>
			  </div>
			</div>     
         
</div>

<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commonjs.js"></script>
<script src="../js/dailysetup.js"></script>
<script>
	
	document.addEventListener('change', function(e){
		if(e.srcElement.id === 'companyId'){
			getCompanyReport(e.srcElement.options[e.srcElement.selectedIndex].value);
		}
	})
	
	function getCompanyReport(companyId){
		var url="../processing/getSetupCompanydata.jsp?companyId="+companyId;
		if(window.XMLHttpRequest){  
			fetchCompReport=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchCompReport=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchCompReport.onreadystatechange=fetchCompanyData;  
			console.log("AJAX Req sent");
			fetchCompReport.open("GET",url,true);  
			fetchCompReport.send();  
		}catch(e){alert("Unable to connect to server");}
	}

	 function fetchCompanyData(){
		 if(fetchCompReport.readyState == 4){
			 var response = this.response.trim();
			 console.log(JSON.parse(response));
			 setCashdata(response);
			 setBankdata(response);
		 }
	 }

	 
	 function setCashdata(data){
		 var obj = JSON.parse(data);
	 }

	 function setBankdata(data)
	 {
		 var obj = JSON.parse(data);
		 var element = document.getElementById("bankDetails");
		 
		 element.innerHTML = '';
		
		 for(i=0; i< obj.banks.length; i++){
		 element.insertAdjacentHTML('beforeend','<div class="col-md-12"><label id="bankName'+(i+1)+'">'+obj.banks[i].bankName+'</label></div>'+
										'<div class="col-md-3">'+
										'<label class="lbl-rm-l">Opening Balance</label>'+
										'<input type="text" class="form-control form-control-sm" name="bankOpening'+(i+1)+'" id="bankOpening'+(i+1)+'" readonly>'+
									'</div>'+
									'<div class="col-md-3">'+
										'<label class="lbl-rm-l">Addition Today <img src="../property/img/add.png" alt="add" class="ctm-hover" name="callBankModal" id="callBankModal"> </label>'+
									'<input type="text" class="form-control form-control-sm" name="bankAddition'+(i+1)+'" id="bankAddition'+(i+1)+'" readonly>'+
									'</div>'+
									'<div class="col-md-3">'+
										'<label class="lbl-rm-l">Utilized Today</label>'+
										'<input type="text" class="form-control form-control-sm" name="bankUtilized'+(i+1)+'" id="bankUtilized'+(i+1)+'" readonly>'+
									'</div>'+
									'<div class="col-md-3">'+
										'<label class="lbl-rm-l">Closing Balance</label>'+
										'<input type="text" class="form-control form-control-sm" name="bankClosing'+(i+1)+'" id="bankClosing'+(i+1)+'" readonly>'+
									'</div>');
		 }
		 
		 setBankTags('contraBankId', obj.banks[0].companyId);
		 setBankTags('chequeBankId', obj.banks[0].companyId);
		 
	 }
	
	 function setBankTags(banktagId, companyId){
		 
		 var bankTag = document.getElementById(banktagId);
			
				for(i=0; i<bankTag.options.length; i++){
					bankTag.options[i].hidden = false;
				}
				bankTag.options[0].selected = true;
				
				for(i=0; i<bankTag.options.length; i++){
					if(companyId != Number(bankTag.options[i].getAttribute("data-company-id"))){
						bankTag.options[i].hidden = true;
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
		console.log(gradeData);
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
			cell4.innerHTML = '<input class="form-control form-control-sm lbl-rm-all" type="text" name="gradeRate'+(i+1)+'" id="gradeRate'+(i+1)+'" />';
		}
		setBonusData(gradeData);
	}
	

	function setBonusData(gradeData){
		var json = JSON.parse(gradeData);
		var table = document.getElementById('bonusTableBody');
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
			cell4.innerHTML = '<input class="form-control form-control-sm lbl-rm-all" type="text" name="bonusgradeRate'+(i+1)+'" id="bonusgradeRate'+(i+1)+'" />';
		}
	}
	
	
	callModalPopup("callCashModal","cashAdditionModal"); // Calling Cash Addition Pop-up
	//callModalPopupWithIndex("callBankModal","bankAdditionModal"); // Calling Bank Addition Pop-up
	
	document.addEventListener('click',function(e){
		if(e.srcElement.id === 'callBankModal')
			{
				$('#bankAdditionModal').modal();
			}
	})
	
	document.addEventListener('click',function(e){
		if(e.srcElement.id === "setup"){
			var rowIndex = e.srcElement.parentElement.parentElement.rowIndex-2;
			console.log("rowIndex---"+rowIndex);
			submitDailySetup(rowIndex);
		}
	})
	
	function submitDailySetup(rowIndex){
		
		jsonObj = {};
		
		jsonObj['bonusAmount'] = document.getElementById('bonusAmount').value
		jsonObj['companyId'] = document.getElementsByName('companyNameTable')[rowIndex].value;
		jsonObj['date'] = document.getElementsByName('dateTable')[rowIndex].value;
		jsonObj['setupTime'] = document.getElementsByName('setupTimeTable')[rowIndex].value;
		jsonObj['discardTime'] = document.getElementsByName('discardTimeTable')[rowIndex].value;
		jsonObj['heap'] = document.getElementsByName('heapTable')[rowIndex].value;
		jsonObj['todaysBankId'] = document.getElementsByName('bankTable')[rowIndex].value;
		jsonObj['firstChequeNo'] = document.getElementsByName('firstChequeNo')[rowIndex].value;
		jsonObj['lastChequeNo'] = document.getElementsByName('lastChequeNo')[rowIndex].value;
		jsonObj['totalCheques'] = Number(document.getElementsByName('lastChequeNo')[rowIndex].value)-Number(document.getElementsByName('firstChequeNo')[rowIndex].value)+1;

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
		
		document.getElementsByTagName('form')[0].submit();
				
	}

	document.addEventListener('keyup', function(e){
		if(e.srcElement.id.includes('gradeRate')){
			var bonusAmt = Number(document.getElementById('bonusAmount').value);
			var element = document.getElementById('bonus'+e.srcElement.id);
			element.value = Number(e.srcElement.value)+Number(bonusAmt);
		}
	})
	
	function setDisplayDate(){
		var today = new Date();
		var date1 = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		document.getElementById('todaysDate').innerHTML = date1;
	}
	
	setDisplayDate();
	gradeReport();
	
	

	</script>

</body>
</html>

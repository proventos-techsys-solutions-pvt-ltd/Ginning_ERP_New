<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
      <title>Daily Transactions Setup</title>
   
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
		<div class="container-fluid">
			<div class="row mt-2 tile-background-row border-bottom">
				<div class="col-md-3">
					<div class="d-flex justify-content-start align-items-center">
						<img src="../property/img/factory.png" alt="warehouse">&nbsp;
						<h4 class="lbl-rm-all">Daily Setup</h4>
					</div>
				</div>
				<div class="col-md-3">
				<% String pattern = "yyyy-MM-dd";
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
				String date = simpleDateFormat.format(new Date()); %>
					<h4 class="lbl-rm-all" id="todaysDate"><%= date %></h4>
				</div>
				
				<div class="col-md-3 offset-md-3 text-right">
					<button type="button" class="btn btn-success" onclick="submitDailySetup()">Add Company</button>
					<button type="button" class="btn btn-success">Lock Users</button>
				</div>
			</div>
			<form action='../processing/addDailySetup.jsp'>
					<input type="hidden" name="dailySetupOutput" id="dailySetupOutput" />
			</form>
			<div class="row tile-background-row">
				<div class="col-md-3">
					<div class="d-flex justify-content-start align-items-center">
						<img src="../property/img/factory.png" alt="warehouse">&nbsp;
						<label class="lbl-rm-l">Setup Company</label>
					</div>
					<select class="form-control form-control-sm" name="companyId" id="companyId">
						<option disabled selected>Select</option>
						<c:Company />
					</select>
				</div>
				<div class="col-md-2">
					<label class="lbl-rm-l">Heap</label>
					<select class="form-control form-control-sm" name="todayHeap" id="todayHeap">
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
				</div>
				
				<div class="row tile-background-row">
					<div class="col-md-12">
						<table class="table table-bordered">
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
										<input type="text" class="form-control form-control-sm" id="" name="">
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="" name="">
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="" name="">
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="" name="">
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="" name="">
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="" name="">
									</td>
									<td>
										<input type="text" class="form-control form-control-sm" id="" name="">
									</td>
									<td>
										<input class="form-control form-control-sm" name="firstChequeNo" id="firstChequeNo"/>
									</td>
									<td>
										<input class="form-control form-control-sm" name="lastChequeNo" id="lastChequeNo"/>
									</td>
									<td>
										<button type="button" class="btn btn-success btn-sm" id="" name="">Setup</button>
									</td>
									<td>
										<button type="button" class="btn btn-success btn-sm" id="" name="">Update</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				
				
				<div class="row tile-background-row">
						<div class="col-md-4">
							<table class="table table-bordered">
								<thead>
									<tr class="table-back">
										<th width="5%" >Sr No</th>
										<th width="20%">Grade</th>
										<th width="20%">Rate</th>
									</tr>
								</thead>
								<tbody id="tableBody">
									<!-- <tr>
										<td align="center">1</td>
										<td>Grade A</td>
										<td><input class="form-control form-control-sm lbl-rm-all" type="text" name="gradeARate" id="gradeARate" /></td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
				
			<div class="row mt-2 tile-background-row">
				<div class="d-flex justify-content-between align-items-center">
					<img src="../property/img/purse.png" alt="warehouse">&nbsp;
					<h4  class="lbl-rm-b">Cash Details</h4>
				</div>
			</div>
			
			<div class="row tile-background-row">
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
			
			<div class="row mt-2 tile-background-row">
				<div class="d-flex justify-content-between align-items-center">
					<img src="../property/img/account.png" alt="warehouse">&nbsp;
					<h4  class="lbl-rm-b">Bank Details</h4>
				</div>
			</div>
			
			<div class="row tile-background-row" id="bankDetails">
				<!-- <div class="col-md-12"><label id="bankName">Bank Name</label></div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Opening Balance</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Addition Today <img src="../property/img/add.png" alt="add" class="ctm-hover" name="callBankModal" id="callBankModal"> </label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Utilized Today</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Closing Balance</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div> -->
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
	<script>
	
	document.addEventListener('change', function(e){
		if(e.srcElement.id === 'companyId'){
			getStockReport(e.srcElement.options[e.srcElement.selectedIndex].value);
		}
	})
	
	document.addEventListener('change', function(e){
		if(e.srcElement.id === 'lastChequeNo'){
			document.getElementById('totalCheques').value = (e.srcElement.value - document.getElementById('firstChequeNo').value)+1;
		}
	})
	
	function getStockReport(companyId){
		var url="../processing/getSetupCompanydata.jsp?companyId="+companyId;
		if(window.XMLHttpRequest){  
			fetchStock=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchStock=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchStock.onreadystatechange=fetchStockData;  
			console.log("AJAX Req sent");
			fetchStock.open("GET",url,true);  
			fetchStock.send();  
		}catch(e){alert("Unable to connect to server");}
	}

	 function fetchStockData(){
		 if(fetchStock.readyState == 4){
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
	 
	 window.onload = function() {
			gradeReport();
		};
	 
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
		var element = document.getElementById('tableBody');
		for(i=0; i< json.length; i++){
			element.insertAdjacentHTML('beforeend','<tr>'+
										'<td align="center">'+(i+1)+'</td>'+
										'<td hidden id="gradeId'+(i+1)+'">'+json[i].id+'</td>'+
										'<td>'+json[i].grade+'</td>'+
										'<td><input class="form-control form-control-sm lbl-rm-all" type="text" name="gradeRate'+(i+1)+'" id="gradeRate'+(i+1)+'" /></td>'+
									'</tr>');
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
	
	function submitDailySetup(){
		
		jsonObj = {};
		
		jsonObj['companyId'] = document.getElementById('companyId').value;
		jsonObj['date'] = document.getElementById('todaysDate').innerHTML;
		jsonObj['heap'] = document.getElementById('todayHeap').value;
		jsonObj['todaysBankId'] = document.getElementById('chequeBankId').value;
		jsonObj['firstChequeNo'] = document.getElementById('firstChequeNo').value;
		jsonObj['lastChequeNo'] = document.getElementById('lastChequeNo').value;
		jsonObj['totalCheques'] = document.getElementById('totalCheques').value;

		jsonArray = [];
		
		var noOfRows = document.getElementById('tableBody').childElementCount;
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
	
	</script>
</body>
</html>
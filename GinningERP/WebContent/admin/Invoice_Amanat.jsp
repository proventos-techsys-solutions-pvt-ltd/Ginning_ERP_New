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
<script src="../js/3.4.1-jq.js"></script>
<script src="../js/3.2.1-jq.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
<title>Amanat Invoice</title>
</head>

<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	 <div class="row row-background border-bottom">
                	<div class="col-md-auto">
               			<div class="d-flex justify-content-start align-items-center">
                			<img src="../property/img/invoicing.png" alt="Invoicing">
                			<h4 class="lbl-rm-all ">Amanat Invoicing</h4>
               			</div>
               		</div>
                </div>
                        <form action="../processing/approvedInvoiceEntry.jsp" id="adminApprovalForm">
                        	<input type="hidden" name="output" id="output" value="" />
                        </form>
                        	<input type="hidden" name="invoiceId" value="" id="invoiceId"/>
                        	<input type="hidden" name="bankId" value="" id="bankId" />
                        	<input type="hidden" name="customerId" value="" id="customerId" />
                        	<input type="hidden" name="accPayableId" value="" id="accPayableId" />
                        	<div class="row row-background">
                        		<div class="col-md-3">
                       			  <label for="" class="lbl-rm-all">Company Name </label>
                                  <select name="companyId" id="companyId" class="form-control form-control-sm" >
                                      <option value="0" selected="selected" disabled="disabled">Select</option>
                                      <c:Company/>
                                  </select>
                        		</div>
                        		<div class="col-md-4 offset-md-5">
                        			<label class="lbl-rm-all">Authorized By</label>
                                    <input id="authorizer" name="authorizer"  type="text" class="form-control form-control-sm" placeholder="" value="<%= currentUser.getName() %>" readonly>
                        		</div>
                        	</div>
                            <div class="row row-background">
                                <div class="col-md-3" hidden>
                                	<label for="" class="lbl-rm-all">RST No </label>
                                	<div class="d-flex justify-content-start align-items-center">
	                                    <input id="rst" name="rst" type="text" class="form-control form-control-sm" placeholder="Search RST">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchData(document.getElementById('rst').value)">Fetch</button>
                                	</div>
                                </div>
                                <div class="col-md-3" >
                                	<label for="" class="lbl-rm-all">Amanat RST No </label>
                                	<div class="d-flex justify-content-start align-items-center">
	                                    <input id="amanatRst" name="amanatRst" type="text" class="form-control form-control-sm" placeholder="Search RST">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchAmanatData(document.getElementById('amanatRst').value)">Fetch</button>
                                	</div>
                                </div>
                                <div class="col-md-4 offset-md-5">
                                   <label class="lbl-rm-all">Customer Name & Address</label>
                                   <textarea id="customerData" name="customerData" class="form-control form-control-sm" rows="3" readonly></textarea>
                                </div>
                               </div>
                               <!-- 
                               <div class="row row-background">
                               		<div class="col-md-3 col-md-3-margin">
                               			<label for="" class="lbl-rm-all">Update Invoice</label>
                                		<div class="d-flex justify-content-start align-items-center">
	                                    <input id="UpdateInvoiceNo" name="" type="text" class="form-control form-control-sm" placeholder="Invoice No">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchInvoiceUpdateData(document.getElementById('UpdateInvoiceNo').value)">Fetch</button>
                                	</div>
                               		</div>
                               </div>
                                -->
                             <div class="row row-background">
                             	<div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Last Authorizer</label>
                                    <input id="lastAuthorizer" name="lastAuthorizer" type="text" class="form-control form-control-sm" placeholder="NA" readonly>
                                </div>
                                 <div class="col-md-1 offset-md-6">
                                    <label for="" class="lbl-rm-all">Voucher No</label>
                                    <input id="voucherNo" name="voucherNo" type="text" class="form-control form-control-sm" placeholder="" readonly>
                                </div>
                                 <div class="col-md-3">
                                    <label for="" class="lbl-rm-all">Account</label>
                                    <select class="form-control form-control-sm" id="accountId" name="accountId">
                                    	<c:PurchaseAccountTag/>
                                    </select>
                                </div>
                             </div>
                            <div class="row row-background">
                                <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Invoice No </label>
                                    <input id="invoiceNo" name="invoiceNo" type="text" class="form-control form-control-sm" placeholder="Invoice No" readonly>
                                </div>
                                 <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Date </label>
                                    <input type="date" id="invoiceDate" name="invoiceDate" class="form-control form-control-sm" readonly>
                                </div>
                                <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Total Quantity </label>
                                    <input type="text" id="totalQty" name="totalQty" class="form-control form-control-sm" readonly>
                                </div>
                                <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Bonus Per Qtl </label>
                                    <div class="input-group input-group-sm ">
									  <div class="input-group-prepend">
									    <div class="input-group-text">
									      <input type="checkbox"  id="bonusCheck" name="bonusCheck">
									    </div>
									  </div>
									  <input type="text" class="form-control form-control-sm"  id="bonusPerQtl" name="bonusPerQtl" readonly>
									</div>
									                                    
                                </div>
                                <div class="col-md-2">
                        			<label for="" class="lbl-rm-all">Membership</label>
                                    <input id="customerMembership" name="customerMembership"  type="text" class="form-control form-control-sm" placeholder="" readonly>
                        		</div>	
                        		<div class="col-md-2">
                        			<label for="" class="lbl-rm-all">Blacklisted</label>
                                    <input id="customerBlacklisted" name="customerBlacklisted"  type="text" class="form-control form-control-sm" placeholder="" readonly>
                        		</div>
                                
                             </div>
                              
                              <div class="row row-background">
                                <div class="col-md-12 col-md-margintop">
                                    <table class="table table-bordered custom-table">
                                        <thead>
                                        <tr class="table-back">
                                            <th width="5%">RST No</th>
                                            <th width="8%">Material</th>
                                            <th width="5%">Quantity</th>
                                            <th width="7%">Grade</th>
                                            <th width="5%">Moisture</th>
                                            <th width="5%">Rate / Qntl</th>
                                            <th width="5%">Amount</th>
                                            <th width="2%" class="text-center">Amanat</th>
                                            <th width="5%" class="text-center">PDC Bonus</th>   
                                        </tr>
                                        </thead>
                                        <tbody id='tableBody'>
                                        <!-- <tr>
                                            <td><input type="text" id="tableRst1" class="form-control form-control-sm" name="tableRst" value="" ></td>
                                            <td><input type="text" id="material1" class="form-control form-control-sm" name="material" value="" ></td>
                                            <td><input type="text" id="quantity1" class="form-control form-control-sm" name="quantity" value="" ></td>
                                            <td><input type="text" id="grade1" class="form-control form-control-sm" name="grade" value="" ></td>
                                            <td><input type="text" id="moisture1" class="form-control form-control-sm" name="moisture" value="" ></td>
                                            <td><input type="text" id="rate1" class="form-control form-control-sm"  name="rate" value="" ></td>
                                            <td><input type="text" id="amount1" class="form-control form-control-sm" name="amount" value="" ></td>
                                            <td class="text-center"><input type="checkbox" id="amanatCheck1" class="lbl-rm-all" name="amanatCheck" value="" ></td>
                                        </tr> -->
                                        </tbody>
                                    </table>
                                </div>
                                </div>
                                <div class="row row-background border-top" >
	                               	 <div class="col-md-6 ">
	                                     <label class="lbl-rm-all">Note :</label>
	                                     <textarea id="note" name="note" class="form-control form-control-lg">Note</textarea>
									</div>
								
									<div class="col-md-2 offset-md-2">
										<div class="row-div">
											<label for="" class="lbl-rm-all">Total Invoice Amt</label> 
	                                    	<input type="text" id="totalAmount" name="totalAmount" class="form-control form-control-sm" value="0" readonly="readonly">
											<label for="" class="lbl-rm-all">Total Bonus</label> 
	                                    	<input type="text" id="totalBonus" name="totalBonus" class="form-control form-control-sm" value="0" readonly="readonly">
										</div>
										
									</div>
									<div class="col-md-2">
										<div class="row-div">
											<label for="" class="lbl-rm-all">PDC Bonus Amount</label> 
	                                    	<input type="text" id="pdcBonusAmount" name="pdcBonusAmount" class="form-control form-control-sm" value="0" readonly="readonly">
	                                    	<label for="" class="lbl-rm-all">Gross Invoice Total</label> 
	                                    	<input type="text" id="grossInvoiceTotal" name="grossInvoiceTotal" class="form-control form-control-sm" value="0" readonly="readonly">
										</div>
	                                 </div>
	                                 
	                             </div>
	                                   
	                                    
                                   <div class="row row-background">
                                   		<div class="col-md-2 offset-md-8" >
										<div class="row-div" id="pdcData">
											<label for="" class="lbl-rm-all">PDC Date</label> 
											<input type="date" class="form-control form-control-sm" name="pdcDate" id="pdcDate" readonly/>
											<label for="" class="lbl-rm-all">PDC Payment Mode</label> 
											<select class="form-control form-control-sm" name="pdcPaymentMode" id="pdcPaymentMode" readonly>
												<c:PaymentModeTag/>
											</select>
										</div>
										</div>			
                                   
	                                   	<div class="col-md-2">
	                                   		<label for="" class="lbl-rm-all">Less: PDC Issued</label> 
		                                    <input type="text" id="totalPdcAmount" name="totalPdcAmount" class="form-control form-control-sm" value="0" readonly="readonly">
	                                   		<label for="" class="lbl-rm-all">Less: Unloading Charges</label> 
		                                    <input type="text" id="unloadingCharges" name="unloadingCharges" class="form-control form-control-sm" value="0" readonly="readonly">
		                                    <label for="" class="lbl-rm-all">Less: Weighing Charges </label> 
		                                    <input type="text" id="weighingCharges" name="weighingCharges" class="form-control form-control-sm" value="0" readonly="readonly">
											<label for="" class="lbl-rm-all" >Advance </label> 
		                                    <input type="text" id="advance" name="advance" class="form-control form-control-sm" value="0">
		                                    <label for="" class="lbl-rm-all">Net Payable </label> 
		                                    <input type="text" id="net" name="net" class="form-control form-control-sm" value="0" readonly>
	                                   	</div>
                                   </div>
                                   
                                   <div class="row row-background">
                                   		<div class="col-md-6" style="margin-top:-300px;">
	                               			<div class="heading">
	                               				<h5>Grade Information</h5>
	                               			</div>
	                            			<div class="border grade-box" id="gradeInfo">
	                            			</div>
                                   		</div>
                                   </div>
                                   
                                   
                                   
                                       <div class="row row-background">
                                   	<div class="col-md-6"  style="margin-top:-100px;">
											<table class="table table-bordered">
												<thead>
													<tr class="table-back heading">
														<th width="5%" >Sr No</th>
														<th width="20%">Mode Of Payment</th>
														<th width="20%">Amount</th>
														<th width="20%">Date</th>
														<th width="5%"></th>
														<th width="5%"></th>
													</tr>
												</thead>
												<tbody id="paymentTableBody">
													<tr>
														<td align="center">1</td>
														<td>
															<select class="form-control form-control-sm" id="paymentMode1" name="paymentMode">
						                               			<option value="Cash" selected>Cash</option>
						                               			<option value="Cheque">Cheque</option>
						                               			<option value="RTGS/NEFT">RTGS/NEFT</option>
					                               			</select>
					                               		</td>
														<td><input type="text" class="form-control form-control-sm" id="payAmount1" name="payAmount"></td>
														<td><input type="date" class="form-control form-control-sm" id="payDate1" name="payDate" value=""></td>
														<td class="text-center"><img src="../property/img/add.png" alt="add" class="ctm-hover" ></td>
														<td class="text-center"><img src="../property/img/delete.png" alt="delete" class="ctm-hover" id="deleteRow1" ></td>
													</tr>
												</tbody>
											</table>
										</div>
                                   </div>
                                   
								
                                <div class="row row-background border-top">
                                <div class="col-md-12 mt-3 mb-5"  >
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-success btn_width" id='submitButton'>Approve</button>
                                        <!--  <button type="button" class="btn btn-success btn_width ml-1" id='updateButton' disabled>Update</button>-->
                                        <button type="button" class="btn btn-success btn_width ml-1" id='reset' >Reset</button>
                                        <button type="button" class="btn btn-success btn_width ml-1" disabled>Delete</button>
                                    </div>
                                </div>
                                </div>
                         <div class="row row-background border-top">
							<div class="col-md-12 mt-2 ">
								<h4>Pending RST's for Amanat Invoicing</h4>
							</div>
							<div class="col-md-12 mt-2">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>RST</th>
											<th>Customer Name</th>
											<th>Net Qty</th>
										</tr>
									</thead>
									<tbody id='pendingInvoicingTable'>
									</tbody>
								</table>
							</div>
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

<!-- <script src="../js/jquery-3.3.1.slim.min.js" ></script> -->
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/Validation.js"></script>
<script>
var totalQty = 0;
//***********************VALIDATIONS**********************************
var appController = (function(){
	var namesAndIds = {
		rstId : "rst",
		rstName : "rst",
		cashAmountId : "cashAmount",
		cashAmountName : "cashAmount",
		chequeAmountId : "chequeAmount",
		chequeAmountName : "chequeAmount",
		rtgsAmountId : "rtgsAmount",
		rtgsAmountName : "rtgsAmount"
}

})();

//***********************VALIDATIONS ENDED****************************



function getTodaysDate(){
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
	return todayDate;
	
}


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
	
	document.getElementById("invoiceDate").value = todayDate;
	document.getElementById('payDate1').value = todayDate;
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
		
		var companySelect = document.getElementById('companyId');
		console.log(data);
		document.getElementById("bankId").value = data.bankId;
		for(i=0;i<companySelect.options.length;i++){
			if(data.companyId != Number(companySelect.options[i].value)){
				companySelect.options[i].disabled = true;
			}
			else if(data.companyId === Number(companySelect.options[i].value)){
				companySelect.options[i].selected = true;
			}
		}
		
		var purchaseAccounts = document.getElementById('accountId');
		for(i=0;i<purchaseAccounts.options.length;i++){
			if(data.companyId != Number(purchaseAccounts.options[i].getAttribute("data-company-id"))){
				purchaseAccounts.options[i].disabled = true;
			}
			else if(data.companyId === Number(purchaseAccounts.options[i].getAttribute("data-company-id"))){
				purchaseAccounts.options[i].selected = true;
			}
		}
		
		document.getElementById('bonusPerQtl').value = data.bonusAmount;
		document.getElementById('invoiceNo').value = data.invoiceSeries;
		document.getElementById('accPayableId').value = data.accPayableId;
		
	}
	
	function checkRstInTable(rst){
		var rstArray = $('#tableBody td:nth-child(1)>input').map(function(){
		       return $(this).val();
		   }).get();
		var flag;
		var n = rstArray.includes(rst);
		return n;
	}
	
	//Send the AJAX Request to fetch data
	function fetchData(rst){
		if(!checkRstInTable(rst)){
			url = "../processing/adminApproval.jsp?rst="+rst;
			if(window.XMLHttpRequest){  
				fetchRequest=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchRequest=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				fetchRequest.onreadystatechange=getData;  
				console.log("AJAX Req sent");
				fetchRequest.open("GET",url,true);  
				fetchRequest.send();  
			}catch(e){alert("Unable to connect to server");}
		}
	}
	
	
	//Get data from AJAX request
	function getData(){
		
		if(fetchRequest.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			if(Number(response) === 0 ){
				window.alert("RST entered is either blank or 0.")
			}
			else if(Number(response) === 1){
				window.alert("Invalid RST.")
			}else if(Number(response) === 2){
				window.alert("Grading fo this RST is not yet done.")
			}else if(Number(response) === 3){
				window.alert("Invoice is already created for this RST.")
			}else{
				var data = JSON.parse(response);
				setData(data);
			}
		}
	}
	
	
	//Send the AJAX Request to fetch data
	function fetchAmanatData(rst){
		if(!checkRstInTable(rst)){
			url = "../processing/amanatInvoice.jsp?rst="+rst;
			if(window.XMLHttpRequest){  
				fetchAmanatRequest=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchAmanatRequest=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				fetchAmanatRequest.onreadystatechange=getAmanatData;  
				console.log("AJAX Req sent");
				fetchAmanatRequest.open("GET",url,true);  
				fetchAmanatRequest.send();  
			}catch(e){alert("Unable to connect to server");}
		}
	}
	
	
	//Get data from AJAX request
	function getAmanatData(){
		
		if(fetchAmanatRequest.readyState == 4){
			var response = this.response.trim();
		
			if(Number(response) === 0 ){
				window.alert("RST entered is either blank or 0.")
			}
			else if(Number(response) === 1){
				window.alert("Invalid RST.")
			}else if(Number(response) === 2){
				window.alert("Grading fo this RST is not yet done.")
			}else if(Number(response) === 3){
				window.alert("RST does not exist in Amanat list.")
			}else{
				var data = JSON.parse(response);
				setAmanatData(data);
			}
			
		}
	}
	
	
	function setAmanatData(data){
		console.log(data);
		document.getElementById('rst').disabled = true;
		//document.getElementById('amanatRst').disabled = true;
		//document.getElementById('UpdateInvoiceNo').disabled = true;
		
		var noOfRows = data.length;
		var superRate = data[noOfRows-1].superRate;
		var table = document.getElementById("tableBody");
		
		table.innerHTML = '';
		
		document.getElementById('gradeInfo').innerHTML = '';
		
		document.getElementById("rst").value = data[0].rst;
		document.getElementById("lastAuthorizer").value = data[0].authorizer;
		document.getElementById("customerData").value = data[0].customerName + "\n" + data[0].customerAddress + "\n" + data[0].customerMobile;
		document.getElementById("customerId").value = data[0].customerId;
		
		//document.getElementById('unloadingCharges').value = ((Number(document.getElementById("totalQty").value)/100) * 20).toFixed(2);
		
		//document.getElementById('weighingCharges').value = Number(document.getElementById('weighingCharges').value) + Number(data[0].weighRate);
	
		document.getElementById('unloadingCharges').value = 0;
		
		document.getElementById('weighingCharges').value = 0;
		
		var blacklisted;
		var membership;
		
		if(Number(data[0].customerBlacklisted) === 1){
			blacklisted = 'YES';
		}else if(Number(data[0].customerBlacklisted) === 0){
			blacklisted = 'NO'
		}
		if(Number(data[0].customerMembership) === 1){
			membership = 'YES';
		}else if(Number(data[0].customerMembership) === 0){
			membership = 'NO';
		}
		
		document.getElementById("customerBlacklisted").value = blacklisted;
		document.getElementById("customerMembership").value = membership;
		document.getElementById("bonusPerQtl").value = data[0].bonusPerQtl;

		
		for(i=0; i<noOfRows-1; i++ ){
			
			if(Number(data[i].quantity) - Number(data[i].invoicedQty) > 0){	
				document.getElementById("totalQty").value = Number(document.getElementById("totalQty").value) + Number(Number(data[i].quantity) - Number(data[i].invoicedQty));
				var rowNo = tableBody.children.length;
				
				var row = table.insertRow(rowNo);
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
				cell8.className ="text-center";
				cell9.className = "text-center";
				cell10.setAttribute('hidden','hidden');
				cell11.setAttribute('hidden','hidden');
				cell12.setAttribute('hidden','hidden');
				
				cell1.innerHTML = '<input type="text" id="tableRst'+(rowNo+1)+'" class="form-control form-control-sm" name="tableRst" value="'+data[i].rst+'" readonly>';
				cell2.innerHTML = '<input type="text" id="material'+(rowNo+1)+'" class="form-control form-control-sm" name="material" value="'+data[i].material+'" readonly>';
				cell3.innerHTML = '<input type="text" id="quantity'+(rowNo+1)+'" class="form-control form-control-sm" name="quantity" value="'+(Number(data[i].quantity) - Number(data[i].invoicedQty))+'">';
				cell4.innerHTML = '<input type="text" id="grade'+(rowNo+1)+'" class="form-control form-control-sm" name="grade" value="'+data[i].grade+'" readonly>';
				cell5.innerHTML = '<input type="text" id="moisture'+(rowNo+1)+'" class="form-control form-control-sm" name="moisture" value="'+data[i].moisture+'" readonly>';
				cell6.innerHTML = '<input type="text" id="rate'+(rowNo+1)+'" class="form-control form-control-sm"  name="rate" value="'+ (Number(superRate)-Number(data[i].differenceFromSuper))+'"  readonly>';
				var amount = (data[i].rate * (Number(Number(data[i].quantity) - Number(data[i].invoicedQty))/100));
				cell7.innerHTML = '<input type="text" id="amount'+(rowNo+1)+'" class="form-control form-control-sm " name="amount" value="'+amount+'" readonly>';
				cell8.innerHTML = '<input type="checkbox" id="amanatCheck'+(rowNo+1)+'" class="lbl-rm-all" name="amanatCheck" value="false" disabled>';
				if(data[i].pdcAmount>0){
					var pdcBonusAmount = Number(data[i].pdcAmount) * (Number(data[i].quantity)/100);
					cell9.innerHTML = '<input type="text" id="pdcAmount'+(rowNo+1)+'" class="form-control form-control-sm" name="pdcAmount" value="'+pdcBonusAmount+'" readonly>';
					document.getElementById('pdcBonusAmount').value = Number(document.getElementById('pdcBonusAmount').value) + Number(pdcBonusAmount);
					document.getElementById('totalPdcAmount').value = Number(document.getElementById('totalPdcAmount').value) + Number(pdcBonusAmount) + Number(amount);
					document.getElementById('pdcDate').value = data[i].pdcDate;
				}else{
					cell9.innerHTML = '<input type="text" id="pdcAmount'+(rowNo+1)+'" class="form-control form-control-sm" name="pdcAmount" value="0" readonly>';
				}
				cell10.innerHTML = '<input type="hidden" id="gradeId'+(rowNo+1)+'" class="lbl-rm-all" name="gradeId" value="'+data[i].gradeId+'" >';
				cell11.innerHTML = '<input type="hidden" id="weighmentId'+(rowNo+1)+'" class="lbl-rm-all" name="weighmentId" value="'+data[i].weighmentId+'" >';
				cell12.innerHTML = '<input type="hidden" id="gradeDesc'+(rowNo+1)+'" class="lbl-rm-all" name="gradeDesc" value="'+data[i].gradeDesc+'" >';
				//document.getElementById('updateButton').disabled = true;
				setGradeNote();
				totalQty = document.getElementById('totalQty').value;
			}else{
				continue;
			}
		}
		calculateTotal();
		document.getElementById('submitButton').disabled = false;
		
		if(document.getElementById('tableBody').rows.length === 0){
			alert('Invoice is already created for thie RST.')
			location.reload();
		}
	}
	
	document.addEventListener('change',function(e){
		if(e.srcElement.name === "rate"){
			var table = document.getElementById("tableBody");
			var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-1;
			
			var quantity = (table.rows[rowIndex].cells[2].children[0].value/100).toFixed(2);
			table.rows[rowIndex].cells[6].children[0].value = (quantity * e.srcElement.value).toFixed(2);
			calculateTotal();
		}
	});
	
	
	//Set Grade Description in Grading Note
	function setGradeNote(){
		var noOfGrades = document.getElementsByName('grade').length;
		for(k=0;k<noOfGrades; k++){
			var grade = document.getElementsByName('grade')[k].value;
			var gradeDesc = document.getElementsByName('gradeDesc')[k].value;
			var gradeData = grade + " : " + gradeDesc;
			
			if(! document.getElementById('gradeInfo').innerHTML.includes(gradeData)){
				document.getElementById('gradeInfo').innerHTML = document.getElementById('gradeInfo').innerHTML + '<br>' + gradeData;
			}
		}
	}	
	
	//Calculate total amount to be paid
	function calculateTotal(){
		var rates = document.getElementsByName('amount');
		var amanatCheck = document.getElementsByName('amanatCheck');
		var quantities = document.getElementsByName('quantity');
		var total = 0;
		var quantity = 0;
		for(z=0; z<rates.length; z++){
			//if(amanatCheck[i].value === "false"){
				total = total + Number(rates[z].value);
				quantity = quantity + Number(quantities[z].value)
			//}
		}
		document.getElementById("totalAmount").value = total.toFixed(2);
		document.getElementById('totalQty').value = quantity;
		var advance  = document.getElementById("advance").value;
		var grossInvoiceAmount = total + Number(document.getElementById('pdcBonusAmount').value) + Number(document.getElementById('totalBonus').value); 
		var netPayable = Number(grossInvoiceAmount) - (Number(document.getElementById('weighingCharges').value) + Number(document.getElementById('unloadingCharges').value) + Number(document.getElementById('totalPdcAmount').value)) - Number(advance);
		document.getElementById('grossInvoiceTotal').value = grossInvoiceAmount.toFixed(2);
		document.getElementById("net").value = netPayable.toFixed(2);
		//document.getElementById("cashAmount").value = netPayable.toFixed(2);
		document.getElementById('payAmount1').value = 0;
		var payAmounts = document.getElementsByName('payAmount');
		var totalpayment = 0;
		for(j=0;j<payAmounts.length;j++){
			totalpayment = Number(totalpayment) + Number(payAmounts[j].value);
		}
		document.getElementById('payAmount1').value =  (Number(netPayable) - Number(totalpayment)).toFixed(2);
	}
	
	
	//Submit invoice form
	function submitForm(){
		
		var netAmount = document.getElementById('net').value;
		var payAmount = document.getElementById('payAmount1').value;
		
		if(netAmount < 0 || payAmount < 0){
			alert("Please check the invoice data as net payable is less than zero.")
		}
		else{
			var netAmountPayable = document.getElementById('net').value;
			var paymentAmounts = document.getElementsByName('payAmount');
			var totalAmountPaymentMode = 0;
			for(k=0; k<paymentAmounts.length; k++){
				totalAmountPaymentMode = Number(totalAmountPaymentMode) + Number(paymentAmounts[k].value);
			}
			if(Number(totalAmountPaymentMode) < Number(netAmountPayable)){
				alert('Total amount in payment mode table is less than net payable.');
			}else if(Number(totalAmountPaymentMode) > Number(netAmountPayable)){
				alert('Total amount in payment mode table is greater than net payable.');
			}else if(Number(totalAmountPaymentMode) === Number(netAmountPayable)){
			
				var jsonObj = {};
				
				jsonObj['invoiceId'] = document.getElementById('invoiceId').value
				jsonObj['accountPurchaseId'] = document.getElementById('accountId').value;
				jsonObj['accountPayableId'] = document.getElementById('accPayableId').value;
				jsonObj['voucherNo'] = document.getElementById('voucherNo').value;
				jsonObj['authorizer'] = document.getElementById('authorizer').value;
				jsonObj['invoiceNo'] = document.getElementById('invoiceNo').value;
				jsonObj['customerId'] = document.getElementById('customerId').value;
				var total = Number(document.getElementById('totalAmount').value);
				jsonObj['total'] = (Math.round(total.toString())).toString();
				jsonObj['amountPaid'] = (Math.round(document.getElementById('advance').value)).toString();
				jsonObj['pending'] = (Math.round((Number(document.getElementById('net').value)+ Number(document.getElementById('totalPdcAmount').value)).toString())).toString();
				jsonObj['invoiceDate'] = document.getElementById('invoiceDate').value;
				jsonObj['companyId'] = document.getElementById('companyId').value;
				jsonObj['note'] = document.getElementById('note').value;
				jsonObj['bankId'] = document.getElementById('bankId').value;
				
				var noOfRows = document.getElementById('tableBody').childElementCount;
				
				var itemList = [];
				var totalQuantity=0;
				for(i=0; i<noOfRows; i++){
					item = {};
					 
						item['weighmentId'] = document.getElementById('weighmentId'+(i+1)).value;
						item['gradeId'] = document.getElementById('gradeId'+(i+1)).value;
						item['rst'] = document.getElementById('tableRst'+(i+1)).value;
						item['amanat'] = document.getElementById('amanatCheck'+(i+1)).value;
						item['rate'] = document.getElementById('rate'+(i+1)).value;
						item['quantity'] = document.getElementById('quantity'+(i+1)).value;
						itemList.push(item);
						totalQuantity = totalQuantity+ Number(document.getElementById('quantity'+(i+1)).value);
				}
				
				jsonObj['items'] = itemList;
				jsonObj['totalQuantity'] = (Math.round(totalQuantity.toString())).toString();
				jsonObj['unloadingCharges'] = (Math.round(document.getElementById('unloadingCharges').value)).toString();
				jsonObj['totalBonus'] = (Math.round(document.getElementById('totalBonus').value)).toString();
				jsonObj['advance'] = (Math.round(document.getElementById('advance').value)).toString();
				jsonObj['netPayable'] = (Math.round((Number(document.getElementById('net').value)+ Number(document.getElementById('totalPdcAmount').value)).toString())).toString();
				jsonObj['pdcAmount'] = (Math.round(document.getElementById('totalPdcAmount').value)).toString();
				jsonObj['pdcDate'] = document.getElementById('pdcDate').value;
				jsonObj['pdcPaymentMode'] = document.getElementById('pdcPaymentMode').value;
				/* 
				if(document.getElementById('cashAmount').value === ""){
					jsonObj['cashAmount'] = 0;
				}else{
					jsonObj['cashAmount'] = document.getElementById('cashAmount').value;
				}
				if(document.getElementById('chequeAmount').value === ""){
					jsonObj['chequeAmount'] = 0;
				}else{
					jsonObj['chequeAmount'] = document.getElementById('chequeAmount').value;
				}
				if(document.getElementById('rtgsAmount').value === ""){
					jsonObj['rtgsAmount'] = 0;
				}else{
					jsonObj['rtgsAmount'] = document.getElementById('rtgsAmount').value;
				} */
				payment = {};
				var paymentModes = document.getElementsByName('paymentMode');
				var paymentAmounts = document.getElementsByName('payAmount');	
				var paymentDates = document.getElementsByName('payDate');
				for(j=0;j<paymentModes.length;j++){
					
					payment[paymentModes[j].value.trim()] = (Math.round(paymentAmounts[j].value)).toString();
					payment[paymentModes[j].value.trim() + '-date'] = paymentDates[j].value;
				}
				
				
				jsonObj['paymentModes'] = payment;
				
				var jsonStr = JSON.stringify(jsonObj);
				console.log(jsonStr);
				
				document.getElementById('output').value=jsonStr;
				
				document.getElementById('adminApprovalForm').submit();
			}
		}
	}
	
	
	document.addEventListener('click',function(e){
		if(e.srcElement.id === 'submitButton'){
			document.getElementById('adminApprovalForm').action = "../processing/amanatInvoiceEntry.jsp";
			submitForm();
		}
		/*else if(e.srcElement.id === 'updateButton'){
			document.getElementById('adminApprovalForm').action = "../processing/updateInvoice.jsp";
			submitForm();
		}*/
	})
	
	//Change Total Amount in Payment Mode amount Table
	document.getElementById('net').addEventListener('change', function(e){
		document.getElementById('payAmount1').value = e.srcElement.value; 
	});
	
	
	//Add new rows to Payment Mode table
	document.addEventListener('click',function(e){
		if(e.srcElement.alt === 'add'){
			var netAmount = document.getElementById('net').value;
			
			var table = document.getElementById('paymentTableBody');
			noOfRows = table.rows.length;
			
			if(noOfRows<3){
				
				var amount = 0;
				for(k=0;k<paymentTableBody.rows.length;k++){
					amount = Number(amount) + Number(paymentTableBody.rows[k].cells[2].children[0].value);			
				}
				var pendingAmount = Number(netAmount) - amount;
					
				if(Number(pendingAmount) == 0){
					alert("Pending amount is 0.");
				}else if(pendingAmount > netAmount ){
					alert("Pending amount is greater than net payable.");
				}else if(Number(pendingAmount) < 0 ){
					alert("Amount entered is greater than net payable.");
				}
				else if(pendingAmount < netAmount ){
					
					var rowCount = table.rows.length;
					var row = table.insertRow(rowCount);
					var colCount = table.rows[0].cells.length;

					for(var i=0; i<colCount; i++) {
						
						var newcell	= row.insertCell(i);
					
						newcell.innerHTML = table.rows[0].cells[i].innerHTML;
						if(i === 0){
							newcell.innerHTML = rowCount+1	
							newcell.align = "center";
						}
						else if(i === 1 || i === 2 || i === 3){
							switch(newcell.childNodes[0].type) {
								case "text":
										newcell.childNodes[0].value = pendingAmount;
										newcell.childNodes[0].name = "payAmount";
										newcell.childNodes[0].id = "payAmount"+(rowCount+1);
										break;
								case "select-one":
										newcell.childNodes[0].selectedIndex = row+1;
										newcell.childNodes[0].name = "paymentMode";
										newcell.childNodes[0].id = "paymentMode"+(rowCount+1);
										break;
								case "date":
									var date = getTodaysDate();
									newcell.childNodes[0].value = date;
									newcell.childNodes[0].name = "payDate";
									newcell.childNodes[0].id = "payDate"+(rowCount+1);
									break;
							}
						}else if(i === 4){
							newcell.align = "center";
						}else if(i === 5){
							newcell.childNodes[0].id = "deleteRow"+(rowCount+1);
							newcell.align = "center";
						}
					}
				
				
					var paymentModes =  document.getElementsByName("paymentMode");
					var modesSelected = [];
					for(k=0; k < paymentModes.length; k++){
						if(k < paymentModes.length - 1){
							modesSelected.push(paymentModes[k].options[paymentModes[k].selectedIndex].value);
							paymentModes[k].disabled = true;
						}else if(k === paymentModes.length - 1){
							paymentModes[k].disabled = false;
							for(r=0; r < paymentModes[k].options.length; r++){
								if(modesSelected.includes(paymentModes[k].options[r].value)){
									paymentModes[k].options[r].disabled = true;
								}else{
									paymentModes[k].options[r].selected = true;
								}
							}
						}
					}
				}
			}
		}
	});
	
	document.addEventListener("keyup",function(e){
		if(e.srcElement.name === "payAmount"){
			var amounts = document.getElementsByName("payAmount");
			var totalAmount = 0;
			var netPayable = document.getElementById('net').value;
			for(i=0;i<amounts.length;i++){
				totalAmount =  Number(totalAmount) + Number(amounts[i].value);
			}
			if(netPayable<totalAmount){
				alert("Amount entered is greater than Net Payable.")
				var pending = 0
				for(k=0;k<amounts.length;k++){
					if(amounts[k].id === e.srcElement.id){
						continue;
					}else{
						pending =  Number(pending) + Number(amounts[k].value);
					}
				}
				e.srcElement.value = netPayable - pending;
			}
		}
	});
	
	//Delete row in Payment Mode table
	function deletePaymentMode(index){
		if((index-1) != 0){
			var element = document.getElementById('paymentTableBody');
			
			var qty1 = Number(element.rows[(index-2)].cells[2].children[0].value);
		
			var qty2 = Number(element.rows[index-1].cells[2].children[0].value);
			
			element.rows[(index-2)].cells[2].children[0].value = (qty1+qty2);
			element.rows[(index-2)].cells[1].children[0].disabled = false;
			
			document.getElementById('paymentTableBody').deleteRow(index-1);
		}else{
			alert("Cannot delete first row.");
		}
	}
	
	//Call delete row from payment mode function
	document.addEventListener('click',function(e){
		if(e.srcElement.tagName.toString().includes("img") || e.srcElement.id.toString().includes("deleteRow")){
			deletePaymentMode(e.srcElement.parentNode.parentNode.rowIndex);
		}
	});
	
	
	//Add Bonus Amount
	document.getElementById('bonusCheck').addEventListener('change',function(e){
		if(e.srcElement.checked===true){
			document.getElementById('totalBonus').value = (Number(document.getElementById('bonusPerQtl').value) * (Number(document.getElementById('totalQty').value)/100)).toFixed(2);
			calculateTotal();
		}else if(e.srcElement.checked != true){
			document.getElementById('totalBonus').value=0;
			calculateTotal();
		}
	});
	
	/* //Adding PDC check details
	document.addEventListener("change",function(e){
		if(e.srcElement.name === "pdcCheck" ){
			if(e.srcElement.checked){
				var table = document.getElementById("tableBody");
				var rowIndex = e.srcElement.parentNode.parentNode.rowIndex;
				var pdcAmount = table.rows[rowIndex-1].cells[6].children[0].value;
				var amount = document.getElementById("pdcAmount").value;
				document.getElementById("pdcAmount").value = Number(amount) + Number(pdcAmount);
				var payAmountValue = document.getElementById("payAmount1").value;
				document.getElementById("payAmount1").value = Number(payAmountValue) - Number(pdcAmount);
				
			}
			if(!e.srcElement.checked){
				var table = document.getElementById("tableBody");
				var rowIndex = e.srcElement.parentNode.parentNode.rowIndex;
				var pdcAmount = table.rows[rowIndex-1].cells[6].children[0].value;
				var amount = document.getElementById("pdcAmount").value;
				document.getElementById("pdcAmount").value = Number(amount) - Number(pdcAmount);
				var cashAmount = Number(document.getElementById("payAmount1").value) + Number(pdcAmount);
				document.getElementById("payAmount1").value = cashAmount;
			}
		}
	}) */
	
	document.getElementById('reset').addEventListener('click', function(e){
		location.reload();
	});
	
	function pendingInvoicingReports(){
		var url="${pageContext.request.contextPath}/processing/pendingAmanatForInvoicing.jsp";
		if(window.XMLHttpRequest){  
			fetchPendingInvoicing=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchPendingInvoicing=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			fetchPendingInvoicing.onreadystatechange=getPendingInvoicingData;  
			console.log("AJAX Req sent");
			fetchPendingInvoicing.open("GET",url,true);  
			fetchPendingInvoicing.send();  
		}catch(e){alert("Unable to connect to server");}
	}

	function getPendingInvoicingData(){
		if(fetchPendingInvoicing.readyState == 4){
			var response = this.response.trim();
			var data = JSON.parse(response);
			setPendingInvoicingData(data);
		}
	}

function setPendingInvoicingData(data){
	var table = document.getElementById('pendingInvoicingTable');
	
	for(i=0; i<data.length; i++){
		
		var noOfRows = table.rows.length;
		
		var row = table.insertRow(noOfRows);
		
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		
		cell1.innerHTML = data[i].rst;
		cell2.innerHTML = data[i].name;
		cell3.innerHTML = data[i].quantity;
	}
}

document.addEventListener('change',function(e){
	if(e.srcElement.name === 'quantity'){
		
		
		var quantities = document.getElementsByName('quantity');
		var actQty = 0;
		for(i=0; i<quantities.length; i++){
			actQty = actQty + Number(quantities[i].value);
		}
		var rowIndex = e.srcElement.parentNode.parentNode.rowIndex - 1; 
		var table = document.getElementById('tableBody');
		var rate = table.rows[rowIndex].cells[5].children[0].value;
		if(Number(totalQty) >= actQty){
			table.rows[rowIndex].cells[6].children[0].value = (e.srcElement.value/100) * rate ;
			calculateTotal();
		}else if(Number(totalQty) < actQty){
			e.srcElement.value =  e.srcElement.value - (actQty - totalQty);
			table.rows[rowIndex].cells[6].children[0].value = (e.srcElement.value/100) * rate ;
			calculateTotal();
			alert('Value entered makes the Total quantity greater than expected.');
		}
	}
});

function getVocuherNo(){
		var url="${pageContext.request.contextPath}/processing/getVoucherNoSeries.jsp";
		if(window.XMLHttpRequest){  
			fetchVouch=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchVouch=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			fetchVouch.onreadystatechange=getVoucher;  
			console.log("AJAX Req sent");
			fetchVouch.open("GET",url,true);  
			fetchVouch.send();  
		}catch(e){alert("Unable to connect to server");}
	}

	function getVoucher(){
		if(fetchVouch.readyState == 4){
			var response = this.response.trim();
			document.getElementById('voucherNo').value = response;
		}
	}
	
	/**************************************
	Response window code
	**************************************/
	var sessionId = {
			"getSessionId":<%=session.getAttribute("invoiceId") %>,
	}
	console.log("objet session id"+sessionId.getSessionId);
	$(document).ready(function(){
	$.fn.checkStatus(sessionId.getSessionId,"Invoice has been successfully saved!")
	})
	

	$(document).ready(function(){
		$(".c-nav-collapse").click(function(){
				$(".sidebar").toggle(); 
				if($(".sidebar").css("display")==="none"){
					$(".row").css("margin-left","10px"); 
				}else{
					$(".row").css("margin-left","225px"); 
				}
		})
	});
/***********************
Side bar 
************************/
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});

	pendingInvoicingReports();
	checkDailySetup();
	getVocuherNo();
	setCurrentDate();
	<% session.removeAttribute("invoiceId"); %>
	
	
//Change fiels if advance payment is done
document.getElementById('advance').addEventListener('keyup', function(e){
	calculateTotal();
	if(document.getElementById("net").value < 0 ){
		alert('Net payable cannot be less than zero.');
		document.getElementById("advance").value = 0;
		calculateTotal();
	}
});

	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Dashboard</title>
</head>

<body>

<%@include file="../admin/Top_Nav.html" %>
<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	 <div class="row row-background border-bottom">
                	<div class="col-md-auto">
               			<div class="d-flex justify-content-start align-items-center">
                			<img src="../property/img/invoicing.png" alt="Invoicing">
                			<h4 class="lbl-rm-all ">Invoicing</h4>
               			</div>
               		</div>
                </div>
                <div hidden>
            	  <%
				    out.print(session.getAttribute("InvoiceNo"));
				    session.removeAttribute("InvoiceNo");
				%>
            	</div>
                        <form action="../processing/approvedInvoiceEntry.jsp" id="adminApprovalForm" target="_blank">
                        	<input type="hidden" name="output" id="output" value="" />
                        </form>
                        	<input type="hidden" name="customerId" value="" id="customerId" />
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
                                    <input id="authorizer" name="authorizer"  type="text" class="form-control form-control-sm" placeholder="" value="Authorizer" readonly>
                        		</div>
                        	</div>
                            <div class="row row-background">
                                <div class="col-md-3">
                                	<label for="" class="lbl-rm-all">RST No </label>
                                	<div class="d-flex justify-content-start align-items-center">
	                                    <input id="rst" name="rst" type="text" class="form-control form-control-sm" placeholder="Search RST">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchData(document.getElementById('rst').value)">Fetch</button>
                                	</div>
                                </div>
                                <div class="col-md-3">
                                	<label for="" class="lbl-rm-all">Amanat RST No </label>
                                	<div class="d-flex justify-content-start align-items-center">
	                                    <input id="amanatRst" name="amanatRst" type="text" class="form-control form-control-sm" placeholder="Search RST">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchAmanatData(document.getElementById('amanatRst').value)">Fetch</button>
                                	</div>
                                </div>
                                <div class="col-md-4 offset-md-2">
                                   <label class="lbl-rm-all">Customer Name & Address</label>
                                   <textarea id="customerData" name="customerData" class="form-control form-control-sm" rows="3" readonly></textarea>
                                </div>
                               </div>
                            <div class="row row-background">
                                <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Invoice No </label>
                                    <input id="invoiceNo" name="invoiceNo" type="text" class="form-control form-control-sm" placeholder="Invoice No" >
                                </div>
                                 <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Date </label>
                                    <input type="date" id="invoiceDate" name="invoiceDate" class="form-control form-control-sm" >
                                </div>
                                <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Total Quantity </label>
                                    <input type="text" id="totalQty" name="totalQty" class="form-control form-control-sm" >
                                </div>
                                <div class="col-md-2 offset-md-2">
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
                                            <th width="7%">RST No</th>
                                            <th width="10%">Material</th>
                                            <th width="10%">Quantity</th>
                                            <th width="10%">Grade</th>
                                            <th width="7%">Moisture</th>
                                            <th width="7%">Rate / Qntl</th>
                                            <th width="7%">Amount</th>
                                            <th width="3%" class="text-center">Amanat</th>  
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
                                <div class="row row-background border-top">
                                	<div class="col-md-4">
                                	<label class="lbl-rm-all">Grade Information</label>
                                		<div class="border mt-2" id="gradeInfo">
                                			
                                		</div>
                                	</div>
	                               	 <div class="col-md-4 ">
	                                     <label class="lbl-rm-all">Note :</label>
	                                     <textarea id="note" name="note" class="form-control form-control-lg">Note</textarea>
									</div>
									<div class="col-md-2 offset-md-2">
										<label for="" class="lbl-rm-all">Unloading Charges</label> 
	                                    <input type="text" id="unloadingCharges" name="unloadingCharges" class="form-control form-control-sm" value="0" readonly="readonly">
	                                    <label for="" class="lbl-rm-all">Weighing Charges </label> 
	                                    <input type="text" id="weighingCharges" name="weighingCharges" class="form-control form-control-sm" value="0" readonly="readonly">
										<label for="" class="lbl-rm-all" hidden>Advance </label> 
	                                    <input type="hidden" id="advance" name="advance" class="form-control form-control-sm" value="0">
	                                    <label for="" class="lbl-rm-all">Net Payable </label> 
	                                    <input type="text" id="net" name="net" class="form-control form-control-sm" value="0">
 									</div>
								</div>
								<div id="paymentSection">
								</div>
								<div class="row row-background border-top">
										<div class="col-md-6 offset-md-3" >
											<table class="table table-bordered">
												<thead>
													<tr class="table-back">
														<th width="5%" >Sr No</th>
														<th width="20%">Mode Of Payment</th>
														<th width="20%">Amount</th>
														<th width="5%"></th>
														<th width="5%"></th>
													</tr>
												</thead>
												<tbody id="paymentTableBody">
													<tr>
														<td align="center">1</td>
														<td>
															<select class="form-control form-control-sm" id="paymentMode1" name="paymentMode1">
						                               			<option value="Cash">Cash</option>
						                               			<option value="Cheque">Cheque</option>
						                               			<option value="RTGS/NEFT">RTGS/NEFT</option>
					                               			</select>
					                               		</td>
														<td><input type="text" class="form-control form-control-sm" id="payAmount1" name="payAmount1"></td>
														<td class="text-center"><img src="../property/img/add.png" alt="add" class="ctm-hover" ></td>
														<td class="text-center"></td>
													</tr>
												</tbody>
											</table>
										</div>
								</div>	
                                <div class="row row-background border-top">
                                <div class="col-md-12">
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-success btn-sm" onclick="submitForm()">Approve</button>
                                    </div>
                                </div>
                                </div>
</div>


<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
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
		
		var companySelect = document.getElementById('companyId');
		
		for(i=0;i<companySelect.options.length;i++){
			if(data.companyId != Number(companySelect.options[i].value)){
				companySelect.options[i].disabled = true;
			}
			else if(data.companyId === Number(companySelect.options[i].value)){
				companySelect.options[i].selected = true;
			}
		}
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
			}else{
				var data = JSON.parse(response);
				setData(data);
			}
		}
	}
	
	
	//Send the AJAX Request to fetch data
	function fetchAmanatData(rst){
		console.log(rst);
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
	
	
	//Get data from AJAX request
	function getAmanatData(){
		
		if(fetchAmanatRequest.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			var data = JSON.parse(response);
			setData(data);
		}
	}
	
	
	//Set data in the table
	function setData(data)
	{
		
		var noOfRows = data.length;
		
		var table = document.getElementById("tableBody");
		document.getElementById("rst").value = data[0].rst;
		document.getElementById("customerData").value = data[0].customerName + "\n" + data[0].customerAddress + "\n" + data[0].customerMobile;
		document.getElementById("customerId").value = data[0].customerId;
		document.getElementById("totalQty").value = Number(document.getElementById("totalQty").value) + Number(data[0].netQuantity);
		
		document.getElementById('unloadingCharges').value = Number(document.getElementById('unloadingCharges').value) + ((Number(document.getElementById("totalQty").value)/100) * 20);
		
			document.getElementById('weighingCharges').value = Number(document.getElementById('weighingCharges').value) + Number(data[0].weighRate);
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
		
		for(i=0; i<noOfRows; i++ ){
		
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
			cell9.setAttribute('hidden','hidden');
			cell10.setAttribute('hidden','hidden');
			cell11.setAttribute('hidden','hidden');
			
			cell1.innerHTML = '<input type="text" id="tableRst'+(rowNo+1)+'" class="form-control form-control-sm" name="tableRst" value="'+data[i].rst+'" readonly>';
			cell2.innerHTML = '<input type="text" id="material'+(rowNo+1)+'" class="form-control form-control-sm" name="material" value="'+data[i].material+'" readonly>';
			cell3.innerHTML = '<input type="text" id="quantity'+(rowNo+1)+'" class="form-control form-control-sm" name="quantity" value="'+data[i].quantity+'" readonly>';
			cell4.innerHTML = '<input type="text" id="grade'+(rowNo+1)+'" class="form-control form-control-sm" name="grade" value="'+data[i].grade+'" readonly>';
			cell5.innerHTML = '<input type="text" id="moisture'+(rowNo+1)+'" class="form-control form-control-sm" name="moisture" value="'+data[i].moisture+'" readonly>';
			cell6.innerHTML = '<input type="text" id="rate'+(rowNo+1)+'" class="form-control form-control-sm"  name="rate" value="'+data[i].rate+'" >';
			cell7.innerHTML = '<input type="text" id="amount'+(rowNo+1)+'" class="form-control form-control-sm " name="amount" value="'+(data[i].rate * (data[i].quantity/100))+'" readonly>';
			cell8.innerHTML = '<input type="checkbox" id="amanatCheck'+(rowNo+1)+'" class="lbl-rm-all" name="amanatCheck" value="false" >';
			cell9.innerHTML = '<input type="hidden" id="gradeId'+(rowNo+1)+'" class="lbl-rm-all" name="gradeId" value="'+data[i].gradeId+'" >';
			cell10.innerHTML = '<input type="hidden" id="weighmentId'+(rowNo+1)+'" class="lbl-rm-all" name="weighmentId" value="'+data[i].weighmentId+'" >';
			cell11.innerHTML = '<input type="hidden" id="gradeDesc'+(rowNo+1)+'" class="lbl-rm-all" name="gradeDesc" value="'+data[i].gradeDesc+'" >';

		}
		calculateTotal();
		setGradeNote();
	}
	
	//Set Grade Description in Grading Note
	function setGradeNote(){
		var noOfGrades = document.getElementsByName('grade').length;
		for(i=0;i<noOfGrades; i++){
			var grade = document.getElementsByName('grade')[i].value;
			var gradeDesc = document.getElementsByName('gradeDesc')[i].value;
			var gradeData = grade + " : " + gradeDesc;
			
			if(! document.getElementById('gradeInfo').innerHTML.includes(gradeData)){
				document.getElementById('gradeInfo').innerHTML = document.getElementById('gradeInfo').innerHTML + '<br>' + gradeData;
			}
		}
	}
	
	//Set Amanat checkbox value
	document.addEventListener('change', function(e){
		if(e.srcElement.id.includes('amanatCheck')){
			if(e.srcElement.value === 'false'){
				e.srcElement.value = 'true'
				console.log('Amanat check --- '+e.srcElement.value);
			}
			else if(e.srcElement.value === 'true'){
				e.srcElement.value = 'false'
				console.log('Amanat check --- '+e.srcElement.value);
			}
		}
	})
		
	
	//Calculate total amount to be paid
	function calculateTotal(){
		var rates = document.getElementsByName("amount");
		var total = 0;
		for(i=0; i<rates.length; i++){
			total = total + Number(rates[i].value);
		}
		total = total - (Number(document.getElementById('weighingCharges').value) + Number(document.getElementById('unloadingCharges').value));
		document.getElementById("net").value = total;
		document.getElementById("payAmount1").value = total;
	}
	
	
	//Submit invoice form
	function submitForm(){
		
		var jsonObj = {};
		
		jsonObj['authorizer'] = document.getElementById('authorizer').value;
		jsonObj['invoiceNo'] = document.getElementById('invoiceNo').value;
		jsonObj['customerId'] = document.getElementById('customerId').value;
		var total = (Number(document.getElementById('advance').value) + Number(document.getElementById('net').value));
		jsonObj['total'] = total.toString();
		jsonObj['amountPaid'] = document.getElementById('advance').value;
		jsonObj['pending'] = document.getElementById('net').value;
		jsonObj['invoiceDate'] = document.getElementById('invoiceDate').value;
		jsonObj['companyId'] = document.getElementById('companyId').value;
		jsonObj['note'] = document.getElementById('note').value;
		
		var noOfRows = document.getElementById('tableBody').childElementCount;
		console.log('no of Rows --- '+noOfRows);
		
		var itemList = [];
		var totalQuantity=0;
		for(i=0; i<noOfRows; i++){
			item = {};
			 
				item['weighmentId'] = document.getElementById('weighmentId'+(i+1)).value;
				item['gradeId'] = document.getElementById('gradeId'+(i+1)).value;
				item['rst'] = document.getElementById('tableRst'+(i+1)).value;
				item['amanat'] = document.getElementById('amanatCheck'+(i+1)).value;
				itemList.push(item);
				totalQuantity = totalQuantity+ Number(document.getElementById('quantity'+(i+1)).value);
		}
		
		jsonObj['items'] = itemList;
		jsonObj['totalQuantity'] = totalQuantity.toString();
		jsonObj['unloadingCharges'] = document.getElementById('unloadingCharges').value;
		
		var paymentModesTable = document.getElementById('paymentTableBody');
		console.log(paymentModesTable.rows.length);
		
		for(j=0;j<paymentModesTable.rows.length; j++){
				jsonObj[document.getElementById('paymentMode'+(j+1)).value] = document.getElementById('payAmount'+(j+1)).value;
			}
		var jsonStr = JSON.stringify(jsonObj);
		console.log(jsonStr);
		
		document.getElementById('output').value=jsonStr;
		
		document.getElementsByTagName('form')[0].submit();
	}
	
	//Change Total Amount in Payment Mode amount Table
	document.getElementById('net').addEventListener('change', function(e){
		document.getElementById('payAmount1').value = e.srcElement.value; 
	})
	
	
	//Add new rows to Payment Mode table
	document.addEventListener('click',function(e){
		if(e.srcElement.alt === 'add'){
			
			var table = document.getElementById('paymentTableBody');
			noOfRows = table.rows.length;
			
			if(noOfRows<3){
				var amount = 0;
				for(k=0;k<paymentTableBody.rows.length;k++){
					amount = Number(amount) + Number(paymentTableBody.rows[k].cells[2].children[0].value);			
					console.log(Number(paymentTableBody.rows[k].cells[2].children[0].value));
				}
				var pendingAmount = Number(document.getElementById('net').value) - amount;
			
				var row = table.insertRow(noOfRows);
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				
				cell4.className ="text-center";
				cell5.className ="text-center";
							
				cell1.setAttribute("align","center");
				cell1.innerHTML = (noOfRows+1);
				cell2.innerHTML = '<select class="form-control form-control-sm" id="paymentMode'+(noOfRows+1)+'" name="paymentMode'+(noOfRows+1)+'">'+
						   			'<option>Cash</option>'+
						   			'<option>Cheque</option>'+
						   			'<option>RTGS/NEFT</option>'+
								'</select>';
				cell3.innerHTML = '<input type="text" class="form-control form-control-sm" id="payAmount'+(noOfRows+1)+'" name="payAmount'+(noOfRows+1)+'" value='+pendingAmount+'>';
				cell4.innerHTML = '<img src="../property/img/add.png" alt="add" class="ctm-hover" >'
				cell5.innerHTML = '<img src="../property/img/delete.png" alt="delete" class="ctm-hover" id="deleteRow'+(noOfRows+1)+'" >'
				
				var optionsAlreadySelected = [];
				for(i=0;i<noOfRows;i++){
					optionsAlreadySelected.push(table.rows[i].cells[1].children[0].value);
				}
				console.log(optionsAlreadySelected);
	
				var selectElement = document.getElementById('paymentMode'+(noOfRows+1));
				for(j=0;j<selectElement.options.length;j++){
					if(optionsAlreadySelected.includes(selectElement.options[j].text)){
						selectElement.options[j].hidden = true;
					}else{
						selectElement.options[j].selected = true;
					}
				}
			}
		}
	})
	
	//Delete row in Payment Mode table
	function deletePaymentMode(index){
		var element = document.getElementById('paymentTableBody');
		
		var qty1 = Number(element.rows[(index-2)].cells[2].children[0].value);
	
		var qty2 = Number(element.rows[index-1].cells[2].children[0].value);
		
		element.rows[(index-2)].cells[2].children[0].value = (qty1+qty2);
		
		document.getElementById('paymentTableBody').deleteRow(index-1);
	}
	
	//Call delete row from payment mode function
	document.addEventListener('click',function(e){
		if(e.srcElement.tagName.toString().includes("img") || e.srcElement.id.toString().includes("deleteRow")){
			deletePaymentMode(e.srcElement.parentNode.parentNode.rowIndex);
		}
	});
	
	checkDailySetup();
	</script>
</body>
</html>

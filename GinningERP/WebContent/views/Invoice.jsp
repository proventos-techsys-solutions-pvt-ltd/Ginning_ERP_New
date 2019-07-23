<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
        <title>Purchase Invoicing</title>
    </head>
<body>
      <%@include file="../views/NavBar.html" %>
            <div class="container-fluid">
                
                <div class="row mt-2 tile-background-row">
                	<div class="col-md-auto">
               			<div class="d-flex justify-content-start align-items-center">
                			<img src="../property/img/invoicing.png" alt="Invoicing">
                			<h4 class="lbl-rm-all ">Invoicing</h4>
               			</div>
               		</div>
                </div>
            
                        <form action="../processing/approvedInvoiceEntry.jsp" id="adminApprovalForm">
                        	<input type="hidden" name="output" id="output" value="" />
                        </form>
                        	<input type="hidden" name="customerId" value="" id="customerId" />
                        	<div class="row tile-background-row mt-2">
                        		<div class="col-md-3">
                       			  <label for="" class="lbl-rm-all">Company Name </label>
                                  <select name="companyId" id="companyId" class="form-control form-control-sm" >
                                      <option selected="selected" disabled="disabled">Select</option>
                                      <c:Company/>
                                  </select>
                        		</div>
                        		<div class="col-md-3 offset-md-6">
                        			<label class="lbl-rm-all">Authorized By</label>
                                    <input id="authorizer" name="authorizer"  type="text" class="form-control form-control-sm" placeholder="" readonly>
                        		</div>
                        	</div>
                            <div class="row tile-background-row">
                                <div class="col-md-2">
                                	<label for="" class="lbl-rm-all">RST No </label>
                                	<div class="d-flex justify-content-start align-items-center">
	                                    <input id="rst" name="rst" type="text" class="form-control form-control-sm" placeholder="Search RST">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchData(document.getElementById('rst').value)">Fetch</button>
                                	</div>
                                </div>
                                <div class="col-md-2">
                                	<label for="" class="lbl-rm-all">Amanat RST No </label>
                                	<div class="d-flex justify-content-start align-items-center">
	                                    <input id="amanatRst" name="amanatRst" type="text" class="form-control form-control-sm" placeholder="Search RST">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchAmanatData(document.getElementById('amanatRst').value)">Fetch</button>
                                	</div>
                                </div>
                                <div class="col-md-3 offset-md-5">
                                   <label class="lbl-rm-all">Customer Name & Address</label>
                                   <textarea id="customerData" name="customerData" class="form-control form-control-sm" rows="3" readonly></textarea>
                                </div>
                               </div>
                            <div class="row tile-background-row">
                                <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Invoice No </label>
                                    <input id="invoiceNo" name="invoiceNo" type="text" class="form-control form-control-sm" placeholder="Invoice No" >
                                </div>
                                 <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Date </label>
                                    <input type="date" id="invoiceDate" name="invoiceDate" class="form-control form-control-sm" >
                                </div>
                                <div class="col-md-auto offset-md-5">
                        			<label for="" class="lbl-rm-all">Membership</label>
                                    <input id="customerBlacklisted" name="customerBlacklisted"  type="text" class="form-control form-control-sm" placeholder="" readonly>
                        		</div>	
                        		<div class="col-md-auto">
                        			<label for="" class="lbl-rm-all">Blacklisted</label>
                                    <input id="customerMembership" name="customerMembership"  type="text" class="form-control form-control-sm" placeholder="" readonly>
                        		</div>
                                
                             </div>
                              
                              <div class="row tile-background-row">
                                <div class="col-md-12 col-md-margintop">
                                    <table class="table table-bordered custom-table">
                                        <thead>
                                        <tr class="table-back">
                                            <th width="7%">RST No</th>
                                            <th width="20%">Material</th>
                                            <th width="10%">Quantity</th>
                                            <th width="20%">Grade</th>
                                            <th width="7%">Moisture</th>
                                            <th width="7%">Rate</th>
                                            <th width="10%">Amount</th>
                                            <th width="5%" class="text-center">Amanat</th>  
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
                                <div class="row tile-background-row border-top">
	                               	 <div class="col-md-4 ">
	                                     <label class="lbl-rm-all">Note :</label>
	                                     <textarea id="note" name="note" class="form-control form-control-lg"></textarea>
									</div>
									<div class="col-md-2 offset-md-6">
										<label for="" class="lbl-rm-all">Unloading Charges</label> 
	                                    <input type="text" id="unloadingCharges" name="unloadingCharges" class="form-control form-control-sm" value="20" readonly="readonly">
	                                    <label for="" class="lbl-rm-all">Weighing Charges </label> 
	                                    <input type="text" id="weighingCharges" name="weighingCharges" class="form-control form-control-sm" value="0" readonly="readonly">
										<label for="" class="lbl-rm-all">Advance </label> 
	                                    <input type="text" id="advance" name="advance" class="form-control form-control-sm" value="0">
	                                    <label for="" class="lbl-rm-all">Net Payable </label> 
	                                    <input type="text" id="net" name="net" class="form-control form-control-sm" value="0">
 									</div>
								</div>
								<div id="paymentSection">
								</div>
								<div class="row tile-background-row">
										<div class="col-md-4">
											<table class="table table-bordered">
												<thead>
													<tr class="table-back">
														<th width="5%" >Sr No</th>
														<th width="20%">Mode Of Payment</th>
														<th width="20%">Amount</th>
														<th width="5%" >Add</th>
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
													<td><img src="../property/img/add.png" alt="add" class="ctm-hover" ></td>
													</tr>
												</tbody>
											</table>
										</div>
								</div>	
                                <div class="row tile-background-row border-top">
                                <div class="col-md-12">
                                    <div class="d-flex justify-content-end">
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-success btn-sm btn-mr-rt btn-mr-tp" >Save</button>
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-success btn-sm btn-mr-rt btn-mr-tp" onclick="submitForm()">Save & Print</button>
                                    </div>
                                </div>
                                </div>
             				  </div>
			<nav class="navbar navbar-default navbar-static-bottom footer border-top">
    
    		</nav>
    		
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	
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
			var data = JSON.parse(response);
			setData(data);
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
		
		for(i=0; i<noOfRows; i++ ){
		
			document.getElementById("rst").value = data[i].rst;
			document.getElementById("customerData").value = data[i].customerName + "\n" + data[i].customerAddress + "\n" + data[i].customerMobile;
			document.getElementById("customerId").value = data[i].customerId;
			
			if(i===0){
				document.getElementById('weighingCharges').value = Number(document.getElementById('weighingCharges').value) + Number(data[0].weighRate);
			}
			var blacklisted;
			var membership;
			
			if(data[i].customerBlacklisted === '1'){
				blacklisted = 'YES';
			}else{
				blacklisted = 'NO'
			}
			if(data[i].customerMembership === '1'){
				membership = 'YES';
			}else{
				membership = 'NO';
			}
			
			document.getElementById("customerBlacklisted").value = blacklisted;
			document.getElementById("customerMembership").value = membership;
			
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
			cell9.setAttribute('hidden','hidden');
			cell10.setAttribute('hidden','hidden');
			
			cell1.innerHTML = '<input type="text" id="tableRst'+(rowNo+1)+'" class="form-control form-control-sm" name="tableRst" value="'+data[i].rst+'" readonly>';
			cell2.innerHTML = '<input type="text" id="material'+(rowNo+1)+'" class="form-control form-control-sm" name="material" value="'+data[i].material+'" readonly>';
			cell3.innerHTML = '<input type="text" id="quantity'+(rowNo+1)+'" class="form-control form-control-sm" name="quantity" value="'+data[i].quantity+'" readonly>';
			cell4.innerHTML = '<input type="text" id="grade'+(rowNo+1)+'" class="form-control form-control-sm" name="grade" value="'+data[i].grade+'" readonly>';
			cell5.innerHTML = '<input type="text" id="moisture'+(rowNo+1)+'" class="form-control form-control-sm" name="moisture" value="'+data[i].moisture+'" readonly>';
			cell6.innerHTML = '<input type="text" id="rate'+(rowNo+1)+'" class="form-control form-control-sm"  name="rate" value="'+data[i].rate+'" >';
			cell7.innerHTML = '<input type="text" id="amount'+(rowNo+1)+'" class="form-control form-control-sm " name="amount" value="'+(data[i].rate * data[i].quantity)+'" readonly>';
			cell8.innerHTML = '<input type="checkbox" id="amanatCheck'+(rowNo+1)+'" class="lbl-rm-all" name="amanatCheck" value="false" >';
			cell9.innerHTML = '<input type="hidden" id="gradeId'+(rowNo+1)+'" class="lbl-rm-all" name="gradeId" value="'+data[i].gradeId+'" >';
			cell10.innerHTML = '<input type="hidden" id="weighmentId'+(rowNo+1)+'" class="lbl-rm-all" name="weighmentId" value="'+data[i].weighmentId+'" >';
 		}
		calculateTotal();
		
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
		
	
	
	//calculate total amount to be paid
	function calculateTotal(){
		var rates = document.getElementsByName("amount");
		var total = 0;
		for(i=0; i<rates.length; i++){
			total = total + Number(rates[i].value);
			total = total - (Number(document.getElementById('weighingCharges').value) + Number(document.getElementById('unloadingCharges').value));
		}
		
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
		jsonObj['note'] = document.getElementById('note').value
		
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
	
	document.getElementById('net').addEventListener('change', function(e){
		
		document.getElementById('payAmount1').value = e.srcElement.value; 
		
	})
	
	document.addEventListener('click',function(e){
		if(e.srcElement.alt === 'add'){
			
			var table = document.getElementById('paymentTableBody');
			noOfRows = table.rows.length;
			
			var row = table.insertRow(noOfRows);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			
			cell1.setAttribute("align","center");
			cell1.innerHTML = (noOfRows+1);
			cell2.innerHTML = '<select class="form-control form-control-sm" id="paymentMode'+(noOfRows+1)+'" name="paymentMode'+(noOfRows+1)+'">'+
					   			'<option>Cash</option>'+
					   			'<option>Cheque</option>'+
					   			'<option>RTGS/NEFT</option>'+
							'</select>';
			cell3.innerHTML = '<input type="text" class="form-control form-control-sm" id="payAmount'+(noOfRows+1)+'" name="payAmount'+(noOfRows+1)+'">';
			cell4.innerHTML = '<img src="../property/img/add.png" alt="add" class="ctm-hover" >'
			
			var optionsAlreadySelected = [];
			for(i=1;i<noOfRows+1;i++){
				optionsAlreadySelected.push(document.getElementById('paymentMode'+(i)).value);
			}

			var selectElement = document.getElementById('paymentMode'+(noOfRows+1));
			for(j=0;j<selectElement.options.length;j++){
				if(optionsAlreadySelected.includes(selectElement.options[j].text)){
					selectElement.options[j].hidden = true;
				}else{
					selectElement.options[j].selected = true;
				}
			}
			
		}
	})
	
	</script>
</body>
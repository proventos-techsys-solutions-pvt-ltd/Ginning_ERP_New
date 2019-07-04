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
            
                <div class="row mt-2 tile-background-row">
                        <form action="../processing/approvedInvoiceEntry.jsp" id="adminApprovalForm">
                        	<input type="hidden" name="id" value="" id="id" />
                        	<div class="form-row">
                        		<div class="col-md-3">
                       			  <label for="" class="lbl-rm-all">Company Name </label>
                                  <select name="companyName" id="companyName" class="form-control form-control-sm">
                                      <option selected="selected" disabled="disabled">Select</option>
                                      <c:Company/>
                                  </select>
                        		</div>
                        		<div class="col-md-3 offset-md-6">
                        			<label class="lbl-rm-all">Authorized By</label>
                                    <input id="grader" name="grader"  type="text" class="form-control form-control-sm" placeholder="">
                        		</div>
                        	</div>
                            <div class="form-row">
                                <div class="col-md-auto">
                                	<label for="" class="lbl-rm-all">RST No </label>
                                	<div class="d-flex justify-content-start align-items-center">
	                                    <input id="rst" type="text" class="form-control form-control-sm" placeholder="Search RST">
					    				<button class="btn btn-success btn-sm btn-no-radius" type="button" onclick="fetchData(document.getElementById('rst').value)">Fetch</button>
                                	</div>
                                </div>
                               </div>
                            <div class="form-row">
                                <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Invoice No </label>
                                    <input id="invoiceNo" name="invoiceNo" type="text" class="form-control form-control-sm" placeholder="Invoice No" >
                                </div>
                                
                                 <div class="col-md-2">
                                    <label for="" class="lbl-rm-all">Date </label>
                                    <input type="date" id="invoiceDate" name="invoiceDate" class="form-control form-control-sm" placeholder="Record No">
                                </div>
                                
                                <div class="col-md-3 offset-md-5">
                                   <label class="lbl-rm-all">Customer Name & Address</label>
                                   <textarea id="customerData" name="customerData" class="form-control form-control-sm"></textarea>
                                </div>
                             </div>
                              
                              <div class="form-row">
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
                                        <tbody>
                                        <tr>
                                            <td><input type="text" id="tableRst" class="form-control form-control-sm" name="" value="" ></td>
                                            <td><input type="text" id="material" class="form-control form-control-sm" name="" value="" ></td>
                                            <td><input type="text" id="quantity" class="form-control form-control-sm" name="quantity" value="" ></td>
                                            <td><input type="text" id="grade" class="form-control form-control-sm" name="" value="" ></td>
                                            <td><input type="text" id="moisture" name="moisture" class="form-control form-control-sm" /></td>
                                            <td><input type="text" id="rate" name="rate" class="form-control form-control-sm" value="0"></td>
                                            <td><input type="text" id="amount" class="form-control form-control-sm" name="" value="" ></td>
                                            <td class="text-center"><input type="checkbox" id="" class="lbl-rm-all" value="" ></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                </div>
                                <div class="form-row">
	                               	 <div class="col-md-4 ">
	                                     <label class="lbl-rm-all">Note :</label>
	                                     <textarea id="note" name="note" class="form-control form-control-sm"></textarea>
									</div>
									<div class="col-md-2 offset-md-6">
										<label for="" class="lbl-rm-all">Advance </label> 
	                                    <input type="text" id="advance" name="advance" class="form-control form-control-sm" value="0">
	                                    <label for="" class="lbl-rm-all">Net Payable </label> 
	                                    <input type="text" id="net" name="net" class="form-control form-control-sm" value="0">
									</div>
								</div>
									
                               
                                                
                                <div class="col-md-12 border-top">
                                    <div class="d-flex justify-content-around custom-checkbox">
                                        <div class="custom-control">
                                            <input type="checkbox" class="custom-control-input" id="cashCheckbox">
                                            <label class="custom-control-label" for="cashCheckbox">Cash</label>
                                        </div>
                                        <div class="custom-control">
                                            <input type="checkbox" class="custom-control-input" id="chequeCheckbox">
                                            <label class="custom-control-label" for="chequeCheckbox">Cheque</label>
                                        </div>
                                        <div class="custom-control">
                                            <input type="checkbox" class="custom-control-input" id="rtgsCheckbox">
                                            <label class="custom-control-label" for="rtgsCheckbox">RTGS/NEFT</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- ********************HIDDEN TABLE FOR COLLECTING PAYMENT INFORMATION**************************** -->
                                	<div class="col-md-12 mt-2 border-top">
                                		<table class="table table-bordered mt-2 ">
                                			<thead id="paymentDetailsTableHead"></thead>
                                			<tbody id="paymentDetailsTableBody"></tbody>                     			
                                		</table>
                                	</div>
                                <div class="col-md-12 ">
                                    <div class="d-flex justify-content-end">
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-success btn-sm btn-mr-rt btn-mr-tp" >Amanat</button>
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-success btn-sm btn-mr-rt btn-mr-tp" onclick="submitForm()">Approve</button>
                                    </div>
                                </div>
                                 </form>
                </div>
             	
             	<!-- *********************************CASH PAYMENT MODAL******************************************** -->
             	<div class="modal fade" id="cashPaymentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				      	<h4 class="modal-title" id="myModalLabel">Cash Payment Details</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				      </div>
				      <div class="modal-body">
				       	<form>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Cash Receipt No</label>
				       			<input type="text" class="form-control form-control-sm" name="cashReceiptNo" id="cashReceiptNo" placeholder="Auto" readonly>
				       			</div>
				       			<div class="col-md-6">
				       			<label>Cash Balance</label>
				       			<input type="text" class="form-control form-control-sm" name="cashBalance" id="cashBalance" readonly>
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Vendor Name</label>
				       			<input type="text" class="form-control form-control-sm" name="vendorNameCash" id="vendorNameCash" placeholder="Auto" value="Vendor 1" readonly>
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Amount to Pay</label>
				       			<input type="text" class="form-control form-control-sm" name="amountToPayCash" id="amountToPayCash">
				       			</div>
				       		</div>
				       	</form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default btn-sm" name="" id="cashPaymentClaseBtn" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary btn-sm" name="" id="cashPaymentSaveBtn" data-dismiss="modal">Save</button>
				      </div>
				    </div>
				  </div>
				</div>
             	</div>
             	
             	<!-- *********************************CHEQUE PAYMENT MODAL******************************************** -->
             	<div class="modal fade" id="chequePaymentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				      	<h4 class="modal-title" id="myModalLabel">Cheque Payment Details</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				      </div>
				      <div class="modal-body">
				       	<form>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Select Bank</label>
				       			<select name="bank" id="bank" class="form-control form-control-sm">
				       				<option value="">Bank 1</option>
				       				<option value="">Bank 2</option>
				       				<option value="">Bank 3</option>
				       			</select>
				       			</div>
				       			<div class="col-md-6">
				       			<label>Balance</label>
				       			<input name="balanceCheque" id="balanceCheque" type="text" class="form-control form-control-sm" readonly>
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Vendor Name</label>
				       			<input type="text" class="form-control form-control-sm" name="vendorNameCheque" id="vendorNameCheque" placeholder="Auto">
				       			</div>
				       			<div class="col-md-6">
				       			<label>Amount to Pay</label>
				       			<input type="text" class="form-control form-control-sm" name="chequeAmount" id="chequeAmount">
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Date</label>
				       			<input type="date" class="form-control form-control-sm" name="chequeDate" id="chequeDate" placeholder="Auto">
				       			</div>
				       			<div class="col-md-6">
				       			<label>Cheque No</label>
				       			<input type="text" class="form-control form-control-sm" name="chequeNo" id="chequeNo">
				       			</div>
				       		</div>
				       	</form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default btn-sm" id="chequePaymentCloseBtn" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary btn-sm" id="chequePaymentSaveBtn" data-dismiss="modal">Save</button>
				      </div>
				    </div>
				  </div>
				</div>
             	
             	<!-- *********************************RTSG/NEFT PAYMENT MODAL******************************************** -->
             	<div class="modal fade" id="transferPaymentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				      	<h4 class="modal-title" id="myModalLabel">RTGS/NEFT Payment Details</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				      </div>
				      <div class="modal-body">
				       	<form>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Select Bank</label>
				       			<select name="bank" id="bank" class="form-control form-control-sm">
				       				<option value="">Bank 1</option>
				       				<option value="">Bank 2</option>
				       				<option value="">Bank 3</option>
				       			</select>
				       			</div>
				       			<div class="col-md-6">
				       			<label>Balance</label>
				       			<input name="balanceCheque" id="balanceCheque" type="text" class="form-control form-control-sm" readonly>
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Vendor Name</label>
				       			<input type="text" class="form-control form-control-sm" name="vendorNameCheque" id="vendorNameCheque" placeholder="Auto">
				       			</div>
				       			<div class="col-md-6">
				       			<label>Amount to Pay</label>
				       			<input type="text" class="form-control form-control-sm" name="chequeAmount" id="chequeAmount">
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Date</label>
				       			<input type="date" class="form-control form-control-sm" name="chequeDate" id="chequeDate" placeholder="Auto">
				       			</div>
				       			<div class="col-md-6">
				       			<label>RTGS/NEFT No</label>
				       			<input type="text" class="form-control form-control-sm" name="chequeNo" id="chequeNo">
				       			</div>
				       		</div>
				       	</form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default btn-sm" id="transferPaymentCloseBtn" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary btn-sm" id="transferPaymentSaveBtn" data-dismiss="modal">Save</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				
			<nav class="navbar navbar-default navbar-static-bottom footer border-top">
    
    		</nav>
    		
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/modal.js"></script>
	<script>
	
	function fetchData(rst){
		console.log(rst);
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
	
	
	function getData(){
		
		if(fetchRequest.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			var data = JSON.parse(response);
			setData(data);
		}
	}
	
	
	function setData(data)
	{
		
		document.getElementById("rst").value = data.invoice.rst;
		document.getElementById("id").value = data.invoice.id;
		document.getElementById("invoiceNo").value = data.invoice.id;
		//document.getElementById("date").value = data.
		document.getElementById("customerData").value = data.customer.name + "\n" + data.customer.address + "\n" + data.customer.mobile;
		//document.getElementById("grader").value = data.
		//document.getElementById("operatorName").value = data.
		document.getElementById("tableRst").innerHTML = data.invoice.rst;
		document.getElementById("material").innerHTML = data.weight.material;
		document.getElementById("quantity").value = data.weight.net;
		document.getElementById("grade").innerHTML = data.weight.grade;
		document.getElementById("moisture").innerHTML = data.weight.moisture;
		document.getElementById("rate").value = data.weight.graderRate;
		document.getElementById("amount").innerHTML = data.weight.graderRate * data.weight.net;
		//document.getElementById("cashReceiptNo").value = data.
		//document.getElementById("cashBalance").value = data.company.balance;
		document.getElementById("vendorNameCash").value = data.customer.name;
		document.getElementById("vendorNameCheque").value = data.customer.name;
		document.getElementById("net").value = data.weight.graderRate * data.weight.net;
		
		
	}
	
	function submitForm(){
		document.getElementById("adminApprovalForm").submit();
	}
	
	</script>
</body>
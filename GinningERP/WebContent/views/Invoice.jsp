<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
        <title>Final Purchase</title>
    </head>
<body>
      <%@include file="../views/NavBar.html" %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 col-md-margintop border">
                        <form action="" id="adminApprovalForm">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="">RST No :</label>
                                    <div class="input-group">
                                    <input id="rst" type="text" class="form-control form-control-sm" placeholder="Search RST">
                                	<div class="input-group-append">
				    				<button class="btn btn-outline-secondary btn-sm" type="button" onclick="fetchData(document.getElementById('rst').value)">Get RST</button>
				    				</div>
                                </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Invoice No :</label>
                                    <input id="invoiceNo" name="invoiceNo" type="text" class="form-control form-control-sm" placeholder="Invoice No" >
                                </div>
                                <div class="col-md-6">
                                    <label for="">Company Name :</label>
                                    <select name="companyName" id="companyName" class="form-control form-control-sm">
                                        <option value="">Company 1</option>
                                        <option value="">Company 2</option>
                                        <option value="">Company 3</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Date :</label>
                                    <input type="date" id="invoiceDate" name="invoiceDate" class="form-control form-control-sm" placeholder="Record No">
                                </div>
                                <div class="col-md-6">
                                    <label>Customer Name & Address</label>
                                    <textarea id="customerData" name="customerData" class="form-control form-control-lg"></textarea>
                                    </div>
                                <div class="col-md-6">
                                    <label>Authorized Grader</label>
                                    <input id="grader" name="grader"  type="text" class="form-control form-control-sm" placeholder="">
                                    <label>Operator Name</label>
                                    <input type="text" id="operatorName" name="operatorName" class="form-control form-control-sm" placeholder="">
                                </div>
                                <div class="col-md-12 col-md-margintop">
                                    <table class="table table-bordered custom-table">
                                        <thead>
                                        <tr>
                                            <th>RST No</th>
                                            <th>Material</th>
                                            <th>Quantity</th>
                                            <th>Grade</th>
                                            <th>Moisture Content</th>
                                            <th>Rate</th>
                                            <th align="right">Amount</th> 
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td id="tableRst">01</td>
                                            <td id="material">Product Name</td>
                                            <td id="quantity">0 Qtl</td>
                                            <td id="grade">A</td>
                                            <td id="moisture"><input type="text" id="moisture" name="moisture" /></td>
                                            <td id="rate"><input type="text" id="rate" name="rate" class="form-control form-control-sm"></td>
                                            <td id="amount" align="right">0.0</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-12 ">
                                   <table class="table">
                                    <tbody>
                                        <tr>
                                            <td rowspan="2">
                                                <label>Note :</label>
                                                <textarea id="note" name="note" class="form-control form-control-sm"></textarea>
                                            </td>
                                            <td align="right">
                                                <label for="">Advance :</label> 
                                                <input type="text" id="advance" name="advance" class="custom-noborder-input" value="10000">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <label for="">Net Payable :</label> 
                                                <input type="text" id="net" name="net" class="custom-noborder-input" value="35000">
                                            </td>
                                        </tr>
                                    </tbody>
                                   </table>
                                </div>
                                <div class="col-md-12">
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
                                        <div class="custom-control">
                                            <input type="checkbox" class="custom-control-input" id="otherCheckbox">
                                            <label class="custom-control-label" for="otherCheckbox">Other</label>
                                        </div>
                                    </div>
                                </div>
                                	<div class="col-md-12">
                                		<table class="table table-bordered table-mr-top">
                                			<tbody id="paymentDetailsTable">
                                			
                                			</tbody>
                                		</table>
                                	</div>
                                <div class="col-md-12 border-top">
                                    <div class="d-flex justify-content-end">
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp">Amanat</button>
                                        <button style="margin-bottom:8px;" type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp">Approve</button>
                                    </div>
                                </div>
                            </div> 
                        </form>
                    </div>
                    <div class="col-md-4 col-md-margintop border">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Token No</th>
                                    <th>RST No</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>01</td>
                                    <td>2541</td>
                                    <td>0451</td>
                                    <td>10000</td>
                                </tr>
                                <tr>
                                    <td>02</td>
                                    <td>2542</td>
                                    <td>0452</td>
                                    <td>10500</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
				        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary btn-sm">Save</button>
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
		document.getElementById("invoiceNo").value = data.invoice.id;
		//document.getElementById("companyName").value = data.company.name;
		//document.getElementById("date").value = data.
		document.getElementById("customerData").value = data.customer.name + "\n" + data.customer.address + "\n" + data.customer.mobile;
		//document.getElementById("grader").value = data.
		//document.getElementById("operatorName").value = data.
		document.getElementById("tableRst").innerHTML = data.invoice.rst;
		document.getElementById("material").innerHTML = data.weight.material;
		document.getElementById("quantity").innerHTML = data.weight.net;
		document.getElementById("grade").innerHTML = data.weight.grade;
		document.getElementById("moisture").innerHTML = data.weight.moisture;
		document.getElementById("rate").value = data.weight.graderRate;
		document.getElementById("amount").value = data.weight.graderRate * data.weight.net;
		//document.getElementById("cashReceiptNo").value = data.
		//document.getElementById("cashBalance").value = data.company.balance;
		document.getElementById("vendorNameCash").value = data.customer.name;
		document.getElementById("vendorNameCheque").value = data.customer.name;
		
		
	}
	
	</script>
</body>
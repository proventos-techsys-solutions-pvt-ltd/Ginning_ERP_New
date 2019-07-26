<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
   <head>
     	<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bootstrap CSS -->
	  	<link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  	<link rel="stylesheet" href="../styles/WBStyle.css">
     <title>Vendor Payment</title>
   </head>
<body>
	<%@include file="../accounts_operation_view/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2 tile-background-row">
				<div class="col-md-3">
					<label class="lbl-rm-all">Search</label>
					<div class="d-flex justify-content-start align-items-center">
						<input type="text" class="form-control form-control-sm" id="searchInvoiceNo" name="searchInvoiceNo" placeholder="Invoice No">
						<button type="button" class="btn btn-success btn-sm btn-no-radius" onclick="fetchInvoiceData(document.getElementById('searchInvoiceNo').value)">Fetch</button>
					</div>
				</div>
				<div class="col-md-4 offset-md-5">
					<div class="d-flex justify-content-end align-items-center">
						<div class="log">
							<div class="heading">Balance Cash</div>
							<div class="amt">100000</div>
						</div>
						<div class="log">
							<div class="heading">Cheque Leaf</div>
							<div class="amt">12</div>
						</div>
						<div class="log">
							<div class="heading">Total RTGS/NEFT</div>
							<div class="amt">12</div>
						</div>
					</div>
				</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-8">
				<div class="tile-background-row">
				<form>
					<input type="hidden" id="invoiceId" name="invoiceId">
					<div class="form-row">
						<div class="col-md-3">
							<label class="lbl-rm-all">Customer Information</label>
							<textarea id="customerInfo" name="customerInfo" class="form-control form-control-lg" rows="3" readonly></textarea>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Invoice No</label>
							<input type="text" class="form-control form-control-sm" id="invoiceNo" name="invoiceNo" readonly>
							<label class="lbl-rm-all">Date</label>
							<input type="text" class="form-control form-control-sm" id="invoiceDate" name="invoiceDate" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Total Amount to Pay</label>
							<input type="text" class="form-control form-control-sm" id="totalAmount" name="totalAmount" readonly>
							<label class="lbl-rm-all">Status</label>
							<input type="text" class="form-control form-control-sm" id="invoiceStatus" name="invoiceStatus" value="Paid" readonly>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cash</label>
							<div class="d-flex justify-content-start align-items-center">
								<input type="text" class="form-control form-control-sm" id="cashAmount" name="cashAmount" readonly>
								<button type="button" class="btn btn-success btn-sm btn-no-radius">Print</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque</label>
							<input type="text" class="form-control form-control-sm" id="chequeAmount" name="" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank</label>
							<input type="text" class="form-control form-control-sm" id="chequeBank" name="chequeBank" placeholder="auto">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque No</label>
							<input type="text" class="form-control form-control-sm" id="chequeNo" name="chequeNo" placeholder="Mannual">
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">Name</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control form-control-sm" id="nameOnCheque" name="nameOnCheque" placeholder="Mannual">
							<button type="button" class="btn btn-success btn-sm btn-no-radius">Pay</button>&nbsp;
							<button type="button" class="btn btn-success btn-sm btn-no-radius">Void</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">RTGS/NEFT</label>
							<input type="text" class="form-control form-control-sm" id="rtgsAmount" name="rtgsAmount" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank Name</label>
							<input type="text" class="form-control form-control-sm" id="rtgsBank" name="rtgsBank" placeholder="Mannual">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Account No</label>
							<input type="text" class="form-control form-control-sm" id="rtgsAccountNo" name="rtgsAccountNo" placeholder="Mannual">
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">IFSC Code</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control form-control-sm" id="rtgsIfsc" name="rtgsIfsc" placeholder="Mannual">
							<button type="button" class="btn btn-success btn-sm btn-no-radius">Pay</button>
							</div>
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="col-md-4">
				<div class="tile-background-row">
				<table class="table table-bordered">
					<thead class="table-back">
						<tr>
							<th>RST</th>
							<th>Invoice No</th>
							<th>Customer Name</th>
							<th>Amount to Pay</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	
	function fetchInvoiceData(invoiceNo){
			url = "../processing/getDataForOperator.jsp?invoiceNo="+invoiceNo;
			if(window.XMLHttpRequest){  
				fetchInvoiceReq=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchInvoiceReq=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				fetchInvoiceReq.onreadystatechange=getInvoiceData;  
				console.log("AJAX Req sent");
				fetchInvoiceReq.open("GET",url,true);  
				fetchInvoiceReq.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		
		//Get data from AJAX request
		function getInvoiceData(){
			
			if(fetchInvoiceReq.readyState == 4){
				var response = this.response.trim();
				console.log(response);
				if(Number(response) === 0){
					window.alert('Invalid Invoice Number entered. Please check the Invoice No. and search again.')
				}else{
					var data = JSON.parse(response);
					setData(data);
				}
			}
		}
		
		function setData(data){
			
			document.getElementById('invoiceNo').value = data.invoiceNo ;
			document.getElementById('invoiceId').value = data.invoiceId
			document.getElementById('customerInfo').value = data.customerName +'\n' + data.customerAddress + '\n' + data.customerMobile  ;
			document.getElementById('invoiceDate').value = data.invoiceDate ;
			document.getElementById('totalAmount').value = data.totalAmount ;
			document.getElementById('invoiceStatus').value = data.paidByOperator ;
			document.getElementById('cashAmount').value = data.cashAmount ;
			document.getElementById('chequeAmount').value = data.chequeAmount ;
			document.getElementById('chequeBank').value = "" ;
			document.getElementById('chequeNo').value = "" ;
			document.getElementById('nameOnCheque').value = "" ;
			document.getElementById('rtgsAmount').value = data.rtgsAmount ;
			document.getElementById('rtgsBank').value = "" ;
			document.getElementById('rtgsAccountNo').value = "" ;
			document.getElementById('rtgsIfsc').value = "" ;
			
		}
		
		
	</script>
	
</body>
</html>	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Pay Pending Invoices</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
  <link rel="stylesheet" href="../styles/WBStyle.css">
</head>
<body>
  <%@include file="../views/NavBar.html" %>
  <div class="container-fluid">
  	<div class="row mt-2 tile-background-row">
  		<div class="col-md-auto">
  			<h4 class="lbl-rm-b">Pay Pending Invoices</h4>
  		</div>
  	</div>
  
  	<div class="row tile-background-row">
  		<div class="col-md-2">
  			<label class="lbl-rm-l lbl-rm-t">Company</label>
  			<select class="form-control form-control-sm" id="companyId" name="companyId">
  				<option selected disabled>Select</option>
  				<c:Company/>
  			</select>
  		</div>
  	</div>
  	
  	<div class="row mt-2 tile-background-row">
  		<div class="col-md-2">
  			<label class="lbl-rm-l lbl-rm-t">Vendor</label>
  			<select class="form-control form-control-sm" id="customerId" name="customerId">
  				<option selected disabled>Select</option>
  				<c:Customer/>
  			</select>
  		</div>
  		<div class="col-md-2">
  			<label class="lbl-rm-l lbl-rm-t">Mobile No</label>
  			<input type="text" class="form-control form-control-sm" id="mobile" name="mobile">
  		</div>
  		<div class="col-md-2 offset-md-4">
  			<div class="pending-invoices">
  				<h6>Rs.10,000/-</h6>
  				<p class="lbl-rm-b">0 Days Overdue</p>
  			</div>
  		</div>
  		<div class="col-md-2">
  			<div class="paid-invoices">
  				<h6>Rs.100,000/-</h6>
  				<p class="lbl-rm-b">Paid until today</p>
  			</div>
  		</div>
  	</div>
  	
  	<div class="row mt-1 tile-background-row">
  		<div class="col-md-2">
  			<label class="lbl-rm-l lbl-rm-t">Mode of Payment</label>
  			<select class="form-control form-control-sm lbl-rm-t" id="" class="">
  			
  			</select>
  		</div>
  		<div class="col-md-2 offset-md-8 text-right">
  			<button type="button" class="btn btn-success btn-sm change-button">Export</button>
  			<button type="button" class="btn btn-success btn-sm change-button">Save & Pay</button>
  		</div>
  	</div>
  	
  	<div class="row mt-2 tile-background-row">
  		<div class="col-md-12">
  			<table class="table table-bordered">
	  			<thead>
	  				<tr>
	  					<th width="10%">Date</th>
	  					<th width="15%">Invoice No</th>
	  					<th>Vendor Name</th>
	  					<th width="15%">Total Amount</th>
	  					<th width="15%">Amount Paid</th>
	  					<th width="15%">Amount To Pay</th>
	  				</tr>
	  			</thead>
	  			<tbody id=tableBody>
	  			</tbody>
  			</table>
  		</div>
  	</div>
  </div>




<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commonjs.js"></script>
<script>
document.getElementById("companyId").addEventListener("change",function(){
	companyFilter(this.value);
})


window.onload = function() {
	getInvoiceReport();
	};

function getInvoiceReport(){
	
	url = "../processing/purchaseInvoiceReport.jsp";
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
		
		
		var element = document.getElementById('tableBody');
		
		var jsonResponse = JSON.parse(response);
		console.log(jsonResponse);
		var status;
		
		
		for(i=0;i<jsonResponse.length;i++){
			
			element.insertAdjacentHTML('beforeend','<tr>'+
					'<td hidden>'+jsonResponse[i].companyId+'</td>'+
					'<td hidden>'+jsonResponse[i].invoiceId+'</td>'+
					'<td>'+jsonResponse[i].invoiceDate+'</td>'+
					'<td>'+jsonResponse[i].invoiceNo+'</td>'+
					'<td>'+jsonResponse[i].customerName+'</td>'+
					'<td>'+jsonResponse[i].totalAmount+'</td>'+
					'<td>'+jsonResponse[i].amountPaid+'</td>'+
					'<td>'+jsonResponse[i].pendingAmount+'</td>'+
				'</tr>');
		}
		console.log(element.rows.length);
	}
}

function companyFilter(companyId)
{
	var tableBody = document.getElementById("tableBody");
	for(i=0;i<tableBody.rows.length;i++){
			tableBody.rows.item(i).removeAttribute('hidden');
		}
	
	for(i=0;i<tableBody.rows.length;i++){
		var id = tableBody.rows.item(i).cells[0].innerHTML;
		if(companyId != id){
			tableBody.rows.item(i).setAttribute('hidden','hidden');
		}
	}
	
} 
</script>

</body>
</html>
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
  			<select class="form-control form-control-sm" id="" name="">
  				<c:Company/>
  			</select>
  		</div>
  	</div>
  	
  	<div class="row mt-2 tile-background-row">
  		<div class="col-md-2">
  			<label class="lbl-rm-l lbl-rm-t">Vendor</label>
  			<select class="form-control form-control-sm" id="" class="">
  			
  			</select>
  		</div>
  		<div class="col-md-2">
  			<label class="lbl-rm-l lbl-rm-t">Mobile No</label>
  			<input type="text" class="form-control form-control-sm" id="" name="">
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
	  					<th>Description</th>
	  					<th width="15%">Total Amount</th>
	  					<th width="15%">Balance Payable</th>
	  					<th width="15%">Amount To Pay</th>
	  				</tr>
	  			</thead>
	  			<tbody>
	  			</tbody>
  			</table>
  		</div>
  	</div>
  </div>




<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commonjs.js"></script>
</body>
</html>
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
      <title>Daily Transactions Setup</title>
   
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	 
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-12">
			<div class="tile-background">
				<label>Company</label>
				<div class="col-md-6">
				<select class="form-control form-control-sm" name="" id="">
					<option value="">Company 1</option>
					<option value="">Company 2</option>
					<option value="">Company 3</option>
				</select>
				</div>
				</div>
			</div>
		</div>
		<div class="row mt-1">
			<div class="col-md-6">
			<div class="tile-background">
				<h3 class="text-center">Cash</h3>
				<div class="border">
					<div class="form-row ">
						<div class="col-md-4">
							<label>Opening Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-4">
							<label>Addition</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="addCash">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-4">
							<label>Payments Made</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-4">
							<label>Closing Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
				</div>
				</div>
			</div>
			<% for(int i = 0; i<=2 ; i++) {%>
			<div class="col-md-6">
			<div class="tile-background">
				<h3 class="text-center">Bank</h3>
				<div class="border">
					<div class="form-row">
						<div class="col-md-4">
							<label>Opening Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-4">
							<label>Addition</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-4">
							<label>Payments Made</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-4">
							<label>Closing Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
				</div>
				</div>
			</div>
			<%} %>
		</div>
		
		<!-- *********************************CASH PAYMENT MODAL******************************************** -->
             	<div class="modal fade" id="cashPaymentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				      	<h4 class="modal-title" id="myModalLabel">Add Daily Cash</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				      </div>
				      <div class="modal-body">
				       	<form>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Cash Voucher No</label>
				       			<input type="text" class="form-control form-control-sm" name="cashReceiptNo" id="cashReceiptNo" placeholder="Auto" readonly>
				       			</div>
				       			<div class="col-md-6">
				       			<label>Date</label>
				       			<input type="date" class="form-control form-control-sm" name="cashBalance" id="cashBalance" >
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Amount to add</label>
				       			<input type="text" class="form-control form-control-sm" name="amountToPayCash" id="amountToPayCash">
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-12">
				       			<label>Description</label>
				       			<input type="text" class="form-control form-control-sm" name="vendorNameCash" id="vendorNameCash" placeholder="Auto" value="" >
				       			</div>
				       		</div>
				       		<div class="form-row">
				       			<div class="col-md-6">
				       			<label>Amount Limit for vendor</label>
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
	
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/dailysetup.js"></script>
</body>
</html>
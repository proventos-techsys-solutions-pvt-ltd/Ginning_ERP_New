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
      <title>Expenses</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
		<div class="container-fluid">
			<div class="row mt-2 tile-background-row">
				<div class="col-md-12">
						<h4>Expenses</h4>
				</div>
			</div>
			<div class="row tile-background-row">
				<div class="col-md-3">
						<label class="lbl-rm-l ">Select Company</label>
						<select class="form-control form-control-sm" name="" id="">
							<option value="">Company 1</option>
							<option value="">Company 2</option>
							<option value="">Company 3</option>
						</select>
				</div>
			</div>
			
			<div class="row tile-background-row">
				<div class="col-md-2">
						<label class="lbl-rm-l">Date</label>
						<input type="date" class="form-control form-control-sm" name="" id="">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-it">Voucher No</label>
						<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
			</div>
			
			<div class="row mt-2 tile-background-row">
				<div class="col-md-2">
						<label class="lbl-rm-l">Expense Account</label>
						<select class="form-control form-control-sm" name="" id="">
							<option value="">Expenses 1</option>
							<option value="">Expenses 2</option>
							<option value="">Expenses 3</option>
						</select>
				</div>
				<div class="col-md-5">
						<label class="lbl-rm-l">Description</label>
						<input type="text" class="form-control form-control-sm" name="" id="">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-l">Amount</label>
						<input type="text" class="form-control form-control-sm" name="" id="">
				</div>
				<div class="col-md-3">
						<label class="lbl-rm-l">Payment Mode</label>
						<select class="form-control form-control-sm" name="" id="">
							<option value="">Bank Name 1</option>
							<option value="">Bank Name 2</option>
							<option value="">Cash</option>
						</select>
				</div>
			</div>
			
			<div class="row tile-background-row">
				<div class="col-md-2 offset-md-10 text-right">
					<button type="button" class="btn btn-success">Save</button>
					<button type="button" class="btn btn-success">Save & Print</button>
				</div>
			</div>
		</div>
		
	
 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>

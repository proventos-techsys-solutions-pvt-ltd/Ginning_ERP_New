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
						<input type="text" class="form-control form-control-sm" id="" name="" placeholder="Invoice No">
						<button type="button" class="btn btn-success btn-sm btn-no-radius">Fetch</button>
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
					<div class="form-row">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Customer Information</label>
							<textarea id="" name="" class="form-control form-control-lg" readonly></textarea>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Invoice No</label>
							<input type="text" class="form-control form-control-sm" id="" class="" readonly>
							<label class="lbl-rm-all">Date</label>
							<input type="text" class="form-control form-control-sm" id="" class="" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Total Amount to Pay</label>
							<input type="text" class="form-control form-control-sm" id="" class="" readonly>
							<label class="lbl-rm-all">Status</label>
							<input type="text" class="form-control form-control-sm" id="" class="" value="Paid" readonly>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cash</label>
							<div class="d-flex justify-content-start align-items-center">
								<input type="text" class="form-control form-control-sm" id="" class="" readonly>
								<button type="button" class="btn btn-success btn-sm btn-no-radius">Print</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque</label>
							<input type="text" class="form-control form-control-sm" id="" class="" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank</label>
							<input type="text" class="form-control form-control-sm" id="" class="" placeholder="auto">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Cheque No</label>
							<input type="text" class="form-control form-control-sm" id="" class="" placeholder="Mannual">
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">Name</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control form-control-sm" id="" class="" placeholder="Mannual">
							<button type="button" class="btn btn-success btn-sm btn-no-radius">Pay</button>&nbsp;
							<button type="button" class="btn btn-success btn-sm btn-no-radius">Void</button>
							</div>
						</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-auto">
							<label class="lbl-rm-all">RTGS/NEFT</label>
							<input type="text" class="form-control form-control-sm" id="" class="" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Bank Name</label>
							<input type="text" class="form-control form-control-sm" id="" class="" placeholder="Mannual">
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Account No</label>
							<input type="text" class="form-control form-control-sm" id="" class="" placeholder="Mannual">
						</div>
						<div class="col-md-3">
							<label class="lbl-rm-all">IFSC Code</label>
							<div class="d-flex justify-content-start align-items-center">
							<input type="text" class="form-control form-control-sm" id="" class="" placeholder="Mannual">
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
</body>
</html>	
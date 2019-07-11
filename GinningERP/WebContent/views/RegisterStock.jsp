<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
      <title>Stock Register</title>
    </head>
<body>
   <%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-12">
			<div class="d-flex justify-content-between align-content-center tile-background-row">
				<div class="d-flex justify-content-start align-content-center tile-background-row">
					<img src="../property/img/stock.png" alt="Stock">&nbsp; &nbsp;
					<h4 class="lbl-rm-all">Stock Register</h4>
				</div>
				<div class="d-flex justify-content-start align-content-center tile-background-row">
					<button type="button" class="btn btn-success btn-sm">Print Report</button>
				</div>
			</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Lint
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="" name="">
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Seed
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="" name="">
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Oil
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="" name="">
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Cake
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="" name="">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-12">
				<table class="table table-bordered tile-background-row">
					<thead>
						<tr>
							<th>Date</th>
							<th>Particulars</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>05/01/2019</td>
							<td>Cotton</td>
							<td>1000 kg</td>
						</tr>
						<tr>
							<td>05/01/2019</td>
							<td>Cotton</td>
							<td>1000 kg</td>
						</tr>
						<tr>
							<td>05/01/2019</td>
							<td>Cotton</td>
							<td>1000 kg</td>
						</tr>
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
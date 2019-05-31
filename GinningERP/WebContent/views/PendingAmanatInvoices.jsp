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
      <title>Amanat Invoices</title>
    </head>
<body>

	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<div class="row col-md-margintop">
			<div class="col-md-auto">
			<label>Search : </label>
			</div>
			<div class="col-md-auto">
			<input type="text" class="form-control form-control-sm form-control-radius" name="" id="" placeholder="Search">
			</div>
		</div>
		<div class="row col-md-margintop">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>RST No</th>
						<th>Date</th>
						<th>Record No</th>
						<th>Customer Name & Address</th>
						<th>Material</th>
						<th>Quantity</th>
						<th>Contract Rate</th>
						<th>Amount Due</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2451</td>
						<td>30-05-2019</td>
						<td>01</td>
						<td>Gurukrupa Cotton</td>
						<td>Cotton</td>
						<td>100qtl</td>
						<td>5510</td>
						<td>551000</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
        <script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
</body>
</html>
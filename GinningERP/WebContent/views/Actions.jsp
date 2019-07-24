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
      <title>Vendor Master</title>
    </head>
<body>
<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Date</th>
							<th>Cheque No</th>
							<th>RST</th>
							<th>Vendor Name</th>
							<th>Amount</th>
							<th>Prepared By</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>07/24/2019</td>
							<td>005452</td>
							<td>2323</td>
							<td>Babulal Mehta</td>
							<td>15420</td>
							<td>Shyam</td>
							<td><button type="button" class="btn btn-success btn-sm">Authorize</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>




		<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
</body>
</html>
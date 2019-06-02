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
      <title>Check Register</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container">
		<div class="row col-md-margintop">
		<div class="col-md-12">
			<table class="table table-bordered table-mr-top">
				<thead>
					<tr>
						<th>Cheque No</th>
						<th>Date</th>
						<th>Vendor Name</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1403</td>
						<td>21/05/2019</td>
						<td>XYZ</td>
						<td>10000</td>
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
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
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
			<div class="col-md-12">
				<div class="d-flex justify-content-between align-items-center">
					<h4>RTSG/NEFT Report</h4>
					<div>
						<% String pattern = "dd-MM-yyyy";
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
						String date = simpleDateFormat.format(new Date()); %>
					<h4 id="todaysDate">Today's Date : <%= date %></h4>
					</div>
					<button type="button" class="btn btn-success btn-sm">Print Report</button>
				</div>
			</div>
		</div>
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Vendor Name</th>
							<th>Amount</th>
							<th>Bank Name</th>
							<th>Acount No</th>
							<th>IFSC Code</th>
						<tr>
					</thead>
					<tbody>
						<tr>
							<td>
							</td>
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
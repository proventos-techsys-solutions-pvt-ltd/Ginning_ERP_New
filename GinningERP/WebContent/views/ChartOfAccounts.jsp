<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
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
	<div class="container-fluid">
	<div class="row mt-2 tile-background-row">
		<div class="col-md-12">
			<h4>Chart of Accounts</h4>
		</div>
		<div class="d-flex justify-content-md-center">
			<div class="p-2 flex-md-grow-1">
				<input type="text" class="form-control form-control-sm" name="" id="" placeholder="Filter">
			</div>
			<div class="p-2 flex-md-grow-1">
				<img src="../property/img/add.png" alt="add">
			</div>
			<div class="p-2 flex-md-grow-1">
				<input type="text" class="form-control form-control-sm" name="" id="" placeholder="Filter">
			</div>
			<div class="p-2 flex-md-grow-1">
				<input type="text" class="form-control form-control-sm" name="" id="" placeholder="Filter">
			</div>
			<div class="p-2 flex-md-grow-1">
				<input type="text" class="form-control form-control-sm" name="" id="" placeholder="Filter">
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
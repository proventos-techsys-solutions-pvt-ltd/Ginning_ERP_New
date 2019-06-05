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
      <style>
      	
     		 .cat {
			 height: 100px;
			}
			
			.cat-inner {
			  height: auto;
			  padding: 10px;
			  background-color: #fff;
			}
			h3{
				background:#393a3d;
				color:#fff;
			}
      </style>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	 
	<div class="container">
		<div class="row mt-1">
			<div class="col-md-12 cat">
			<div class="cat-inner">
				<label>Company</label>
				<select class="form-control form-control-sm" name="" id="">
					<option value="">Company 1</option>
					<option value="">Company 2</option>
					<option value="">Company 3</option>
				</select>
			</div>
			</div>
		</div>
		<div class="row mt-1">
			<div class="col-md-5 cat">
			<div class="cat-inner">
				<h3>Cash</h3>
				<div class="border">
					<div class="row">
						<div class="col-md-4">
							<label>Opening Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Addition</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Payments Made</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="row">
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
			<div class="col-md-5 cat">
			<div class="cat-inner">
				<h3>Bank</h3>
				<div class="border">
					<div class="row">
						<div class="col-md-4">
							<label>Opening Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Addition</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Payments Made</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id="">
						</div>
					</div>
					<div class="row">
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
		</div>
	</div>
	
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
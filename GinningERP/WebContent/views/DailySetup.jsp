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
		<div class="row">
			<div class="col-md-auto">
				<label>Company</label>
				<select class="form-control form-control-sm" name="" id="">
					<option value="">Company 1</option>
					<option value="">Company 2</option>
					<option value="">Company 3</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="custom-control">
				<input type="checkbox" class="custom-control-input" id="cashSetup">
                <label class="custom-control-label" for="cashSetup">Setup-Cash</label>
                </div>
			</div>
			<div class="col-md-4">
				<div class="custom-control">
				<input type="checkbox" class="custom-control-input" id="bankSetup">
                <label class="custom-control-label" for="bankSetup">Setup-Bank</label>
                </div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5">
				<h3>Cash</h3>
				<div class="border">
					<div class="row">
						<div class="col-md-4">
							<label>Opening Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Addition</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Payments Made</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Closing Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-5 offset-md-2">
				<h3>Bank</h3>
				<div class="border">
					<div class="row">
						<div class="col-md-4">
							<label>Opening Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Addition</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Payments Made</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label>Closing Balance</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control form-control-sm" name="" id"">
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
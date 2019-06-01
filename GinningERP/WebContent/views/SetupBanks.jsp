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
        <title>Final Purchase</title>
    </head>
<body>
   <%@include file="../views/NavBar.html" %>
       	<div class="container">
       		<div class="row border col-md-margintop">
       		<div class="col-md-8 border">
       		<div class="row">
       					<div class="col-md-12">
       						<h3>Setup Bank Accounts</h3>
       					</div>
       				</div>
				<form>
					<div class="border">
					<div class="form-row">
						<div class="form-group col-md-4">
						<label>Company Name</label>
						<select class="form-control form-control-sm form-control-radius">
							<option>Company 1</option>
							<option>Company 2</option>
							<option>Company 3</option>
						</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Bank Name</label>
						<input type="text" class="form-control form-control-sm form-control-radius" name="" id="">
						</div>
						<div class="col-md-6">
						<label>Account No</label>
						<input type="text" class="form-control form-control-sm form-control-radius" name="" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>IFSC Code</label>
						<input type="text" class="form-control form-control-sm form-control-radius" name="" id="">
						</div>
						<div class="form-group col-md-6">
						<label>MICR Code</label>
						<input type="text" class="form-control form-control-sm form-control-radius" name="" id="">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Date</label>
						<input type="date" class="form-control form-control-sm form-control-radius" name="" id="">
						</div>
						<div class="form-group col-md-6">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm form-control-radius" name="" id="">
						</div>
					</div>
					</div>
				</form>
				<button type="button" class="btn btn-primary btn-sm btn-mr-tp">Save</button>
       			</div>
       			<div class="col-md-4 border">
       				<div class="row">
       					<div class="col-md-12">
       						<h3>Bank Accounts</h3>
       					</div>
       				</div>
       				<div class="border">
       				<div class="row">
       					<div class="col-md-12">
       						<table class="table">
       							<thead>
       								<tr>
       									<th>Company</th>
       									<th>Bank</th>
       									<th>Balance</th>
       								</tr>
       							</thead>
       							<tbody>
       								<tr>
       									<td>Company 1</td>
       									<td>Bank 1</td>
       									<td>10000</td>
       								</tr>
       							</tbody>
       						</table>
       					</div>
       				</div>
       				</div>
       			</div>
       		</div>
       	</div>
       	<nav class="navbar navbar-default navbar-static-bottom footer border-top">
    
    	</nav>
       	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
</body>
</html>
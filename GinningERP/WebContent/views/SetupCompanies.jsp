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
      <title>Setting Up Companies Invoices</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container">
		<div class="row border col-md-margintop">
		<div class="col-md-6 border">
			<div class="col-md-auto">
				<h3>Setup Companies</h3>
			</div>
		<form class="border" name="companyForm" enctype="multipart/form-data" action="../processing/addCompany.jsp" method="post">
			<div class="form-row">
				<div class="col-md-8">
					<label>Company Name</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="name" id="name">
					<label>Company Address</label>
					<textarea class="form-control form-control-lg form-control-radius" name="address" id="address">
					</textarea>
				</div>
				<div class="col-md-4">
					<img src="../property/img/logo.jpg" alt="Logo" class="img-thumbnail">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<label>City</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="city" id="city">
				</div>
				<div class="col-md-6">
					<label>State</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="state" id="state">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<label>PAN</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="pan" id="pan">
				</div>
				<div class="col-md-6">
					<label>TAN</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="tan" id="tan">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<label>CIN</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="cin" id="cin">
				</div>
				<div class="col-md-6">
					<label>GST No</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="gst" id="gst">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<label>Telephone</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="telephone" id="telephone">
				</div>
				<div class="col-md-6">
					<label>Mobile</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="mobile" id="mobile">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<label>Email</label>
					<input type="text" class="form-control form-control-sm form-control-radius" name="email" id="email">
				</div>
				<div class="col-md-6">
					<label>Logo</label>
					<input type="file" class="form-control form-control-sm form-control-radius" name="file" id="logo">
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-auto">
				<button type="button" class="btn btn-primary btn-sm btn-mr-tp" onclick="submitForm()">Add</button>
				<button type="button" class="btn btn-primary btn-sm btn-mr-tp">Reset</button>
			</div>
		</div>
		</div>
		<div class="col-md-6">
			<ul class="list-unstyled">
			  <li class="media">
			    <img class="mr-3" src="../property/img/logo.jpg" alt="Company 1 Logo" width="100px" height="100px">
			    <div class="media-body">
			      <h5 class="mt-0 mb-1">Company 1</h5>
			      		<p>Address :</p>
			      		<p>Telephone :</p>
			      		<p>Mobile</p>
			    </div>
			  </li>
  			</ul>
  			<div class="border-top border-mr-btm"></div>
  				<ul class="list-unstyled">
			  <li class="media">
			    <img class="mr-3" src="../property/img/logo.jpg" alt="Company 1 Logo" width="100px" height="100px">
			    <div class="media-body">
			      <h5 class="mt-0 mb-1">Company 2</h5>
			      		<p>Address :</p>
			      		<p>Telephone :</p>
			      		<p>Mobile</p>
			    </div>
			  </li>
  			</ul>
		</div>
		</div>
		</div>
	

   		<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script>
			function submitForm(){
				document.getElementsByName("companyForm")[0].submit();
			}
		</script>
</body>
</html>
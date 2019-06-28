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
	<div class="container">
		<div class="row tile-background-row mt-2">
			<div class="col-md-6">
				<h4>
					Raw Material to Finished Goods Ratios
				</h4>
			</div>
			<div class="col-md-3 offset-md-3 text-right"> 
				<button type="button" class="btn btn-success btn-sm">Save</button>
			</div>
		</div>
		
		<div class="row justify-content-md-center tile-background-row mt-2">
			<div class="col-md-auto">
				<label class="lbl-rm-l">Date</label>
				<input type="date" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Raw Material</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Percentage</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
		</div>
		
		<div class="row justify-content-md-center tile-background-row mt-2">
			<div class="col-md-auto">
				<h4>Cotton To Lint & Seeds Ratio</h4>
			</div>
		</div>
		
		<div class="row justify-content-md-center tile-background-row">
			<div class="col-md-auto">
				<label class="lbl-rm-l">Material</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Percentage</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Normal Loss</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
		</div>
		<div class="row justify-content-md-center tile-background-row">
			<div class="col-md-auto">
				<label class="lbl-rm-l">Material</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Percentage</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Normal Loss</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
		</div>
		
		<div class="row justify-content-md-center tile-background-row mt-2">
			<div class="col-md-auto">
				<h4>Cotton Seeds To Oil & Cake Ratio</h4>
			</div>
		</div>
		
		<div class="row justify-content-md-center tile-background-row">
			<div class="col-md-auto">
				<label class="lbl-rm-l">Material</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Percentage</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Normal Loss</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
		</div>
		
		<div class="row justify-content-md-center tile-background-row">
			<div class="col-md-auto">
				<label class="lbl-rm-l">Material</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Percentage</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
			<div class="col-md-auto">
				<label class="lbl-rm-l">Normal Loss</label>
				<input type="text" class="form-control form-control-sm" name="" id="">
			</div>
		</div>
		
	</div>
	
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
</body>
</html>
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
      <title>Expenses Register</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<%@include file="../views/CommonSearchHeaderForReports.html" %>
		<div class="row mt-2 tile-background-row">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Date</th>
						<th>Expense Category</th>
						<th>Description</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>21/05/2019</td>
						<td>Salary</td>
						<td>Salary Paid To Emloyee</td>
						<td>10000</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- OPTIONS MODAL POP-UP STARTS HERE -->
		<div class="modal fade" id="optionsModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Options</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      		<form>
		      			<div class="form-row">
		      				<div class="col-md-auto">
		      					<label>Period</label>
		      				</div>
		      				<div class="col-md-auto">
		        				<input type="date" class="form-control form-control-sm " name="" id="">
		        			</div>
			        		<div class="col-md-auto">
			        			<label>To</label>
			        		</div>	
			        		<div class="col-md-auto">
			        			<input type="date" class="form-control form-control-sm " name="" id="">
			        		</div>
		      			</div>
		      			<div class="form-row">
		      				<div class="col-md-auto">
		      					<label>Category</label>
		      				</div>
		      				<div class="col-md-6">
		      					<select class="form-control form-control-sm name="" id="">
		      						<option value="">Wages</option>
		      						<option value="">Salary</option>
		      					</select>
		      				</div>
		      			</div>
		      			<div class="form-row">
		      				<div class="col-md-auto">
		      					<label>Amount</label>
		      				</div>
		      				<div class="col-md-5">
		      					<select class="form-control form-control-sm name="" id="">
		      						<option value="">Equal To</option>
		      						<option value="">Greater Than</option>
		      						<option value="">Samller Than</option>
		      					</select>
		      				</div>
		      				<div class="col-md-auto">
			        			<input type="text" class="form-control form-control-sm " name="" id="">
			        		</div>
		      			</div>
		      		</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" id="filterBtn">OK</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- OPTIONS MODAL POP-UP ENDS HERE  -->
		
		
	</div>
	

	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
		setTitle("Expense Register");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		callModalPopup("options","optionsModal");//calling option pop-up
	</script>
</body>
</html>
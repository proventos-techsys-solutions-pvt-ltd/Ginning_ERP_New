<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="../styles/css/all.css">
<title>Bank Reconciliation</title>
</head>
<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	<div class="row row-background">
		<div class="col-md-2">
			<h4>Bank Reconciliation</h4>
		</div>
	</div>
	<div class="row row-background">
		<div class="col-md-3">
				<label>Company: </label>&nbsp;
				<select class="form-control form-control-sm">
					<option>Company Name</option>
				</select>
		</div>
			<div class="col-md-3">
				<label>Bank: </label>&nbsp;
				<select class="form-control form-control-sm">
					<option>Bank Name</option>
				</select>
		</div>
		<div class="col-md-2">
				<label>Date: </label>&nbsp;
				<input type="date" class="form-control form-control-sm" id="" name=""> 
		</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-sm btn-success" style="margin-top:32px;">Save</button>
		</div>
	</div>
	
	<div class="row row-background">
		<div class="col-md-12">
			<table class="table table-sm table-bordered">
					<thead>
						<tr>
							<th width="5%">Select</th>
							<th width="10%">Date</th>
							<th>Description</th>
							<th>Amount</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center"><input type="checkbox" id="" name=""></td>
							<td>21/01/2019</td>
							<td>Salary Expenses</td>
							<td>10000</td>
						</tr>
					</tbody>
					<tfoot></tfoot>
			</table>
		</div>
	</div>
	
	<div class="row row-background">
		<div class="col-md-2">
			<label>Statement Ending Balance</label>
			<input type="text" class="form-control form-control-sm" id="" name="">
		</div>
			<div class="col-md-2">
			<label> - Outstanding Cheques</label>
			<input type="text" class="form-control form-control-sm" id="" name="" readonly>
		</div>
		<div class="col-md-2">
			<label> + Deposit In Transit</label>
			<input type="text" class="form-control form-control-sm" id="" name="" readonly>
		</div>
			<div class="col-md-2">
			<label> - GL Balance</label>
			<input type="text" class="form-control form-control-sm" id="" name="" readonly>
		</div>
		<div class="col-md-2">
			<label> = Unreconciled Difference</label>
			<input type="text" class="form-control form-control-sm" id="" name="" readonly>
		</div>
	</div>
	</div>
	</div>
	</div>
	 <script src="../js/3.4.1-jq.js"></script>
	 <script src="../js/Validation.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	/***********************
	Side bar 
************************/
   $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });

	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Dashboard</title>
</head>

<body>

<%@include file="../admin/Top_Nav.html" %>
	<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	 <div class="row mt-2 row-background border-bottom">
			<div class="col-md-12 ">
					<h4 id="report-title" class="lbl-rm-l"></h4>
			</div>
			</div>
			<div class="row row-background">
			<div class="col-md-3">
					<label class="lbl-rm-l">Company</label>
					<select class="form-control form-control-sm" name="" id="companyId">
						<option selected>Select</option>
						<c:Company />
					</select>
			</div>
			<div class="col-md-3">
					<label class="lbl-rm-l">Bank</label>
					<select class="form-control form-control-sm" name="" id="">
						<option selected>Select</option>
					</select>
			</div>
		</div>
		<div class="row row-background ">
			
			<div class="col-md-auto">
				<div class="d-flex justify-content-start align-items-center">
				<input type="text" class="form-control form-control-sm inpt-rm-t" name="" id="searchInput" placeholder="">
				<button type="button" class="btn btn-success btn-sm lbl-rm-l">Search</button>
				</div>
			</div>
			<div class="col-md-auto text-left">
				<button type="button" class="btn btn-danger btn-sm" id="clearFilterBtn">Clear Filter</button>
			</div>
			<div class="col-md-auto">
				<img src="../property/img/setting.png" alt="option" class="img-set" id="options">
				<img src="../property/img/exportpdf.png" alt="option" class="img-set" id="exportToPdf">
				<img src="../property/img/exportexcel.png" alt="option" class="img-set" id="exportToExcel">
			</div>
			</div>
	 	<div class="row row-background">
	 		<div class="col-md-12">
	 			<table class="table table-bordered">
	 				<thead>
	 					<tr>
	 					<th>Date</th>
	 					<th>Voucher No</th>
	 					<th>Description</th>
	 					<th>Debit</th>
	 					<th>Credit</th>
	 					<th>Balance</th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 				</tbody>
	 			</table>
	 		</div>
	 	</div>
	 
	 </div>
	 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script>
		setTitle("Bank Register");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		</script>
</body>
</html>
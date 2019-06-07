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
      <title>Amanat Invoices</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
	<div class="row mt-2">
		<div class="col-md-12">
			<div class="tile-background">
				<h3>Amanat Invoices </h3>
			</div>
		</div>
	</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile-background tile-background-ht">
					<div class="d-flex flex-row align-items-center">
					<label>Search</label>
					<input type="text" class="form-control-ctm" name="" id="" placeholder="Cheque No">
					<button type="button" class="btn btn-success">Search</button>
					<button type="button" class="btn btn-danger" id="clearFilterBtn">Clear Filter</button>
					<img src="../property/img/setting.png" alt="option" class="img-set" id="options">
					<img src="../property/img/exportpdf.png" alt="option" class="img-set" id="exportToPdf">
					<img src="../property/img/exportexcel.png" alt="option" class="img-set" id="exportToExcel">
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2 ">
			<div class="col-md-12">
			<div class="tile-background setHeight">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>RST No</th>
						<th>Date</th>
						<th>Record No</th>
						<th>Vendor Name & Address</th>
						<th>Material</th>
						<th>Quantity</th>
						<th>Contract Rate</th>
						<th>Amount Due</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i = 0; i < 100; i++){ %>
					<tr>
						<td>2451</td>
						<td>30-05-2019</td>
						<td>01</td>
						<td>Gurukrupa Cotton</td>
						<td>Cotton</td>
						<td>100qtl</td>
						<td>5510</td>
						<td>551000</td>
					</tr>
					<% } %>
				</tbody>
			</table>
			</div>
			</div>
		</div>
	</div>
        <script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script>
			var documentHeight = (function(){
				var height = document.getElementsByTagName("html")[0].offsetHeight;
				document.getElementsByClassName("setHeight")[0].style.height = ((height*2)/3) + "px";
				document.getElementsByClassName("setHeight")[0].style.overflow = "auto";
			})();
		</script>
</body>
</html>
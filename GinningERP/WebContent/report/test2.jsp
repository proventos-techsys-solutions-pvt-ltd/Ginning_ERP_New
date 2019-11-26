<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Vendor Master</title>
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<style>
	.box-border-invoice{
		height:100px;
		border:1px solid #dee2e6;
	}
	
	h6{
		line-height:25px;
	}
	.container{
		border-radius:10px;
	}
</style>


</head>
<body>
<div class="container">
<div class="row row-background">
	<div class="col-md-12 d-flex justify-content-center align-items-center">
		<h4>Invoice Preview</h4>
	</div>
</div>
<div class="row row-background">
	<div class="col-md-12">
			<h5>Famer Name</h5>
		<h6>Famer address - city - pin - mobile no</h6>
	</div>
</div>


<div class="row row-background border-bottom">
			<div class="col-md-6 box-border-invoice">
				<h6><b>Customer Name</b></h6>
				<h6>Samir Cotton Industries</h6>
				<h6>Katol</h6>
				<h6>Nagpur Maharashtra</h6>
			</div>
			<div class="col-md-6 box-border-invoice">
				<h6>Invoice No : SE/19-20/0006</h6>
				<h6>Invoice Date : 14/04/2019</h6>
			</div>
		</div>
		
		<div class="row row-background">
			<table class="table table-sm">
				<thead>
					<tr>
						<th>Sr No</th>
						<th>Material</th>
						<th>Grade</th>
						<th>Grade Description</th>
						<th>Weight(KG)</th>
						<th>Rate(Qntl)</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>COTTON</td>
						<td>GRADE A</td>
						<td>SUPER QUALITY</td>
						<td>1000</td>
						<td>500</td>
						<td>500000</td>
					</tr>
						<tr>
						<td>1</td>
						<td>COTTON</td>
						<td>GRADE A</td>
						<td>SUPER QUALITY</td>
						<td>1000</td>
						<td>500</td>
						<td>500000</td>
					</tr>
						<tr>
						<td>1</td>
						<td>COTTON</td>
						<td>GRADE A</td>
						<td>SUPER QUALITY</td>
						<td>1000</td>
						<td>500</td>
						<td>500000</td>
					</tr>
				</tbody>
				<tfoot>
						<tr>
							<td colspan="4">Total</td>
							<td>3000</td>
							<td></td>
							<td>150000</td>
						</tr>
					</tfoot>
			</table>
		</div>
		
		<div class="row row-background ">
			<div class="col-md-12 ">
				<h6>Amout in words : Fifteen Lakh Only</h6>
			</div>
		</div>
		
		<div class="row row-background border">
			<div class="col-md-12 ">
				<h6><b>Payment Details</b></h6>
				<h6>Cash</h6>
				<h6>Cheque</h6>
				<h6>RTGS/NEFT</h6>
				<h6>PDP Cash</h6>
				<h6>PDP Cheque</h6>
				<h6>PDP RTGS/NEFT</h6>
			</div>
		</div>
		
		
		
		</div>
	<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commonjs.js"></script>
<script src="../js/export/export2excel.js"></script>
</body>
</html>
	
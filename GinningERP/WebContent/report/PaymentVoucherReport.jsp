<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
 <link rel="stylesheet" href="../styles/WBStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Payment Voucher</title>
<style>
	.row{
		margin-right:0px;
		margin-left:0px;
	}
</style>
</head>
<body>
<div class="container row-background">
<div style="padding:5px;" class="border">
	<div class="row ">
		<div class="col-md-12 text-center">
			<h4>Payment Voucher</h4>
		</div>
	</div>
	<div class="row ">
		<div class="col-md-12 text-center">
			<h4>Company Name</h4>
		</div>
	</div>
	<div class="row border-bottom">
		<div class="col-md-6 text-left">
			<label>Date: <span id="date"></span></label>
		</div>
		<div class="col-md-6 text-right">
			<label>Voucher No: <span id="vchno"></span></label>
		</div>
	</div>
	<div class="row border-bottom">
		<div class="col-md-12">
			<label>Payee: <span id="payee"></span></label>
		</div>
		<div class="col-md-12">
			<label>Description: <span id="description"></span></label>
		</div>
		<div class="col-md-4">
			<label>Cheque No:  <span id="chequeNo"></span></label>
		</div>
		<div class="col-md-4">
			<label>Amount(In Words): <span id="amtinwords"></span></label>
		</div>
		<div class="col-md-4">
			<label>Amount(In figures): <span id="amtinfgrs"></span></label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 border" style="height:150px;">
			<label>Approved By:</label>
		</div>
		<div class="col-md-4 border" style="height:150px;">
			<label>Paid By:</label>
		</div>
		<div class="col-md-4 border" style="height:150px;">
			<label>Payee:</label>
		</div>
		</div>
	</div>
</div>


 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
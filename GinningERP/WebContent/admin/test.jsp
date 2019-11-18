<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<title>Test page</title>
<style>
.chart-container-purchase{
	display:flex;
	justify-content:center;
	align-items:center;
	border:2px solid green; 
}
ul{
	list-style:none;
	line-height: 8;
}
	.parent-li{
		position:relative;
		left:50%;
		display:inline;
		border:2px solid red;
		padding:20px;
		width:auto;
 		margin-left:-393.10px;
		
	}
	.child-li{
		border:2px solid green;
		display:inline;
		margin:5px;
		padding:20px;
	}
	.parent-child{
		margin-left:250px;
	}
	.child-child-li{
		position:relative;
		display:inline;
		margin:5px;
		padding:20px;
		border:2px solid green;
	}
	
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="chart-container-purchase">
		<ul>
			<li ><span class="parent-li">Total purchases payment summary during day</span>
			<div>
				<div class="child-li">Cash payment</div>
				<div class="child-li">Cheque payment</div>
				<div class="child-li">RTGS/NEFT payment</div>
				<div class="child-li">Post dated payments</div>
						<div class="parent-child">
							<div class="child-child-li">Cash payment</div>
							<div class="child-child-li">Cheque payment</div>
							<div class="child-child-li">RTGS/NEFT  payment</div>
						</div>
			</div>
			</li>
		</ul>
		</div>
		</div>
</body>
</html>
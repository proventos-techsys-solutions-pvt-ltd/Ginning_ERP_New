<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	<div class="row row-background border-bottom">
		<div class="col-md-12">
			<div class="d-flex justify-content-start align-items-center">
				<img src="../property/img/user.png" alt="user">
				&nbsp;
				<h5>User Logged-In as WB-Operator</h5>
			</div>
		</div>
	</div>
	<div class="row row-background">
				<div class="col-md-6">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="3" class="text-center">Pending for Tare Weight</th>
								</tr>
								<tr>
									<th>Rst No</th>
									<th>Vendor</th>
									<th>Gross Weight</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
				</div>
				<div class="col-md-6">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="3" class="text-center">RST's Done</th>
								</tr>
								<tr>
									<th>Rst No</th>
									<th>Vendor</th>
									<th>Gross Weight</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
				</div>
	</div>
</div>

<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script>

</script>
</body>
</html>

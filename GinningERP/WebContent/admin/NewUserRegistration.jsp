<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>New User Registration</title>
</head>

<body>

<%@include file="../admin/Top_Nav.html" %>
<div class="container-fluid container-mr-t ">
	 <%@include file="../admin/Side_bar.html" %>
	 <div hidden>
		   <%
		    out.print(session.getAttribute("companyId"));
		    session.removeAttribute("companyId");
			%>
		</div> 
		<div class="row row-background border-bottom">
			<div class="col-md-12">
					<h4>New User Registration</h4>
			</div>
		</div>
		<div class=" row row-background">
			<div class="col-md-12">
				<div class="tile-background-row">
					<form name="companyForm" enctype="multipart/form-data" action="../processing/addUser.jsp" method="post">
						<div class="form-row">
							<div class="col-md-10">
								<label class="lbl-rm-all">Name</label>
								<input type="text" class="form-control  " name="name" id="name">
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4">
								<label class="lbl-rm-all">Username</label>
								<input type="text" class="form-control  " name="username" id="username">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">Password</label>
								<input type="text" class="form-control  " name="passsword" id="passsword">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">Role</label>
								<select class="form-control " name="role" id="role">
									<option value="1">Admin</option>
									<option value="2">Weigh Bridge Operator</option>
									<option value="3">Cashier</option>
								</select>
							</div>
						</div>
						<div class="form-row border-top">
							<div class="col-md-12">
								<div class="d-flex justify-content-end align-items-center">
									<button type="button" class="btn btn-success btn-sm" onclick="submitForm()">Add</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-success btn-sm">Reset</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-12">
				<div id="companyDataDisplay">
				</div>
			</div>
		</div>
</div>
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>

function submitForm(){
	
	document.getElementsByTagName('form')[0].submit;
	
}

</script>
</body>
</html>
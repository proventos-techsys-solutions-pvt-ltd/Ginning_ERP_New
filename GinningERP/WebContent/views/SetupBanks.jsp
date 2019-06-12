<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
        <title>Final Purchase</title>
    </head>
<body>
   <%@include file="../views/NavBar.html" %>
       	<div class="container">
       		<div class="row col-md-margintop">
       		<div class="col-md-8">
       		<div class="tile-background" id="getHeight">
       		<div class="form-row">
       					<div class="col-md-12">
       						<h3>Setup Bank Accounts</h3>
       					</div>
       				</div>
				<form action="../processing/addBank.jsp" name="">
					<div class="form-row">
						<div class="form-group col-md-4">
						<label>Company Name</label>
						<select class="form-control form-control form-control-radius" name="companyId" id="companyId">
							<c:Company/>
						</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Bank Name</label>
						<input type="text" class="form-control form-control form-control-radius" name="bankName" id="bankName">
						</div>
						<div class="col-md-6">
						<label>Account No</label>
						<input type="text" class="form-control form-control form-control-radius" name="accountNo" id="accountNo">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>IFSC Code</label>
						<input type="text" class="form-control form-control form-control-radius" name="ifsc" id="ifsc">
						</div>
						<div class="form-group col-md-6">
						<label>MICR Code</label>
						<input type="text" class="form-control form-control form-control-radius" name="micr" id="micr">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Date</label>
						<input type="date" class="form-control form-control form-control-radius" name="date" id="date">
						</div>
					</div>
				</form>
				</div>
				<button type="button" class="btn btn-primary btn btn-mr-tp" onclick="submitForm()">Save</button>
       			</div>
       			<div class="col-md-4">
       			<div class="tile-background" id="setHeight">
       				<div class="form-row">
       					<div class="col-md-12">
       						<h3>Bank Accounts</h3>
       					</div>
       				</div>
       				<div class="form-row">
       					<div class="col-md-12 scroll">
       						<table class="table">
       							<thead>
       								<tr>
       									<th>Company</th>
       									<th>Bank</th>
       									<th>Balance</th>
       								</tr>
       							</thead>
       							<tbody>
       							<% for(int i = 0; i<5 ; i++){ %>
       								<tr>
       									<td>Company 1</td>
       									<td>Bank 1</td>
       									<td>10000</td>
       								</tr>
       								<%} %>
       							</tbody>
       						</table>
       					</div>
       				</div>
       				</div>
       			</div>
       		</div>
       	</div>
       	
       	<nav class="navbar navbar-default navbar-static-bottom footer border-top">
    
    	</nav>
       	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script>
	
			function submitForm(){
				document.getElementsByName("bankForm")[0].submit();
			}
			
			
		</script>
</body>
</html>
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
       	<div class="col-md-6">
    		<div class="d-flex justify-content-center ">
            	<h4 class="lbl-rm-all">Today's Purchase Rate</h4>&nbsp;
            	<h4 id="tRate"></h4>
            </div>
        </div>
         	<div class="col-md-6">
         		<div class="d-flex justify-content-center ">
					<h4 class="lbl-rm-all">Average Purchase Rate</h4>&nbsp;
					<h4 id="aRate"></h4>
             	</div>
             </div>   
         </div>
           <div class="row row-background">
             	<div class="col-md-2">
             		<label class="lbl-rm-l">Company</label>
             		<select class="form-control form-control-sm" id="companyId">
             			<option disabled selected>Selected</option>
             			<option value="0">All</option>
             			<c:Company />
             		</select>
             	</div>
             		<div class="col-md-2">
             		<label class="lbl-rm-l">Range</label>
             		<select class="form-control form-control-sm">
             			<option value="">Today's </option>
             			<option value="">Month</option>
             			<option value="">Year</option>
             		</select>
             	</div>
             </div>
             <div class="row row-background">
             	<div class="col-md-6">
             		<canvas id="myChart"></canvas>
             	</div>
             </div>
                
         
</div>

<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/dashboard.js"></script>
<script src="../chart/package/dist/Chart.js" ></script>
<script src="../chart/package/dist/Chart.bundle.js" ></script>
</body>
</html>

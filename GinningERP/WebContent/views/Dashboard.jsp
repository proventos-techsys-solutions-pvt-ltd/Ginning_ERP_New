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
        <title>Final Purchase</title>
    </head>
<body>
   <%@include file="../views/NavBar.html" %>
        <div class="container-fluid">
            <div class="row col-md-margintop">
                <div class="col-md-6">
                    <div class="d-flex justify-content-center">
                        <h4>Today's Purchase Rate</h4>&nbsp;&nbsp;
                        <input type="text" class="form-control form-control-sm" value="Today's Purchase Rate" style="width:30%;">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="d-flex justify-content-center">
                        <h4>Average Purchase Price</h4>&nbsp;&nbsp;
                        <input type="text" class="form-control form-control-sm" value="Average Purchase Price" style="width:30%;">
                    </div>   
                </div>
                
            </div>
        </div>
        <script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
      </body>
</html>
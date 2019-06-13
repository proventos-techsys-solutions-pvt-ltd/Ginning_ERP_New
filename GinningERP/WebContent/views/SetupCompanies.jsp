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
      <title>Setting Up Companies Invoices</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2">
		<div class="col-md-7">
		<div class="tile-background-g">
				<h3>Setup Companies</h3>
			</div>
		<div class="tile-background border mt-2">
		<form name="companyForm" enctype="multipart/form-data" action="../processing/addCompany.jsp" method="post">
			<div class="form-row">
				<div class="col-md-10">
					<label>Company Name</label>
					<input type="text" class="form-control  " name="name" id="name">
					<label>Company Address</label>
					<textarea class="form-control form-control-lg " name="address" id="address">
					</textarea>
				</div>
				<div class="col-md-2">
					<img src="../property/img/logo.jpg" alt="Logo" class="img-thumbnail">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4">
					<label>City</label>
					<input type="text" class="form-control  " name="city" id="city">
				</div>
				<div class="col-md-4">
					<label>State</label>
					<input type="text" class="form-control  " name="state" id="state">
				</div>
				<div class="col-md-4">
					<label>PAN</label>
					<input type="text" class="form-control  " name="pan" id="pan">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4">
					<label>TAN</label>
					<input type="text" class="form-control  " name="tan" id="tan">
				</div>
				<div class="col-md-4">
					<label>CIN</label>
					<input type="text" class="form-control  " name="cin" id="cin">
				</div>
				<div class="col-md-4">
					<label>GST No</label>
					<input type="text" class="form-control  " name="gst" id="gst">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-3">
					<label>Telephone</label>
					<input type="text" class="form-control  " name="telephone" id="telephone">
				</div>
				<div class="col-md-3">
					<label>Mobile</label>
					<input type="text" class="form-control  " name="mobile" id="mobile">
				</div>
				<div class="col-md-3">
					<label>Email</label>
					<input type="text" class="form-control  " name="email" id="email">
				</div>
				<div class="col-md-3">
					<label>Logo</label>
					<input type="file" class="form-control  " name="file" id="logo">
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-auto">
				<button type="button" class="btn btn-primary btn-sm btn-mr-tp" onclick="submitForm()">Add</button>
				<button type="button" class="btn btn-primary btn-sm btn-mr-tp">Reset</button>
			</div>
		</div>
		</div>
		</div>
		<div class="col-md-5" id="companyDataDisplay">
			<div class="tile-background-g">
				<h3>Company Details</h3>
			</div>
			<div class="tile-background border mt-2">
			</div>
		</div>
		</div>
		</div>
   		<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script>
		window.onload = function() {
			  getCompanyData();
			};
			
			function submitForm(){
				document.getElementsByName("companyForm")[0].submit();
			}
			
			function getCompanyData(){

				url = "../processing/companyReport.jsp";
				
				if(window.XMLHttpRequest){  
					fetchRequest=new XMLHttpRequest();  
				}  
				else if(window.ActiveXObject){  
					fetchRequest=new ActiveXObject("Microsoft.XMLHTTP");  
				}  
			  
				try{  
					fetchRequest.onreadystatechange=getData;  
					console.log("AJAX Req sent");
					fetchRequest.open("GET",url,true);  
					fetchRequest.send();  
				}catch(e){alert("Unable to connect to server");}
			}
			
			function getData(){
				
				if(fetchRequest.readyState == 4){
					var response = this.response.trim();
					console.log(response)
					
					var element = document.getElementById("companyDataDisplay");
					
					var dataList = JSON.parse(response);
					
					
					
					var size = dataList.length;
					console.log(size);
					
					for (i = 0; i < size; i++) {
					
						element.insertAdjacentHTML('beforeend','<ul class="list-unstyled companyList">'+
						  '<li class="media">'+
						  '<img class="mr-3" src="'+dataList[i].logoPath+'" alt="Company 1 Logo" width="100px" height="100px">'+
						  '<div class="media-body">'+
						  '  <h5 class="mt-0 mb-1 displayCompanyName">'+dataList[i].name+'</h5>'+
						  '  		<p>Address : '+dataList[i].address+'</p>'+
						  '  		<p>Telephone : '+dataList[i].telephone+'</p>'+
						  '  		<p>Mobile : '+dataList[i].mobile+'</p>'+
						  '</div>'+
						  '</li>'+
						  '</ul>'+
						  '<div class="border-top border-mr-btm"></div>');
					}
					 
					
				}
				
			}
		</script>
</body>
</html>
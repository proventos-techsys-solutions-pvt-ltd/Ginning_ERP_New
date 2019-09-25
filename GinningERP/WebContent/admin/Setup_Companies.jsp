<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Setup Companies</title>
</head>

<body>

<%@include file="../admin/Top_Nav.jsp" %>
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
					<h4>Setup Companies</h4>
			</div>
		</div>
		<div class=" row row-background">
			<div class="col-md-12">
				<div class="tile-background-row">
					<form name="companyForm" enctype="multipart/form-data" action="../processing/addCompany.jsp" method="post">
						<div class="form-row">
							<div class="col-md-10">
								<label class="lbl-rm-all">Company Name</label>
								<input type="text" class="form-control  " name="name" id="name">
								<label class="lbl-rm-all">Company Address</label>
								<textarea class="form-control form-control-lg " name="address" id="address">
								</textarea>
							</div>
							<div class="col-md-2">
								<img src="../property/img/logo.jpg" alt="Logo" class="img-thumbnail">
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4">
								<label class="lbl-rm-all">City</label>
								<input type="text" class="form-control  " name="city" id="city">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">State</label>
								<input type="text" class="form-control  " name="state" id="state">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">PAN</label>
								<input type="text" class="form-control  " name="pan" id="pan">
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4">
								<label class="lbl-rm-all">TAN</label>
								<input type="text" class="form-control  " name="tan" id="tan">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">CIN</label>
								<input type="text" class="form-control  " name="cin" id="cin">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">GST No</label>
								<input type="text" class="form-control  " name="gst" id="gst">
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-3">
								<label class="lbl-rm-all">Telephone</label>
								<input type="text" class="form-control  " name="telephone" id="telephone">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Mobile</label>
								<input type="text" class="form-control  " name="mobile" id="mobile">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Email</label>
								<input type="email" class="form-control  " name="email" id="email">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Invoice Series</label>
								<input type="text" class="form-control  " name="invoiceSeries" id="invoiceSeries">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Logo</label>
								<input type="file" class="form-control  " name="file" id="logo">
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
						  '<img class="mr-3" src="../images/'+dataList[i].logoPath+'" alt="Company 1 Logo" width="100px" height="100px">'+
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
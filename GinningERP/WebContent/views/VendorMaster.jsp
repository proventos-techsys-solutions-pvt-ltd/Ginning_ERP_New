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
      <title>Vendor Master</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
		<div class="container-fluid">
		<%@include file="../views/CommonSearchHeaderForReports.jsp" %>
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Name</th>
							<th>Address</th>
							<th width="15%">Mobile No</th>
							<th width="5%" class="text-center">Edit</th>
							<th width="5%" class="text-center">Delete</th>
						</tr>
					</thead>
					<tbody id="tableBody">
					</tbody>
				</table>
			</div>
		</div>
		
		</div>
		<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script>
			setTitle("Vendor Master");//Setting Title of Page
			setSearchPlaceholder("Search");//Setting Placeholder of Search Input
			
			window.onload = function() {
				getCustomerData();
				};
			
			function getCustomerData(){
				
				url = "../processing/customerReport.jsp";
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
					
					
					var element = document.getElementById('tableBody');
					var tr = element.children;
					console.log(element);
					
					var jsonResponse = JSON.parse(response);
					console.log(jsonResponse);
					
					for(i=0;i<jsonResponse.length;i++){
						
						element.insertAdjacentHTML('beforeend','<tr>'+
								'<td hidden>'+jsonResponse[i].id+'</td>'+
								'<td>'+jsonResponse[i].name+'</td>'+
								'<td>'+jsonResponse[i].address+'</td>'+
								'<td>'+jsonResponse[i].mobile+'</td>'+
							'</tr>')
					}
				}
			}
			
		</script>
</body>
</html>
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
      <title>Amanat Invoices</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
	<%@include file="../views/CommonSearchHeaderForReports.jsp" %>
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
			<div class="setHeight">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>RST No</th>
						<th>Date</th>
						<th>Record No</th>
						<th>Vendor Name & Address</th>
						<th>Material</th>
						<th>Quantity</th>
						<th>Contract Rate</th>
						<th>Amount Due</th>
					</tr>
				</thead>
				<tbody id="tableBody">
				
				</tbody>
			</table>
			</div>
			</div>
		</div>
	</div>
        <script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script>
		setTitle("Pending Amanat");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		
		
		window.onload = function() {
			amanatRequest();
			};
			
		
			var documentHeight = (function(){
				var height = document.getElementsByTagName("html")[0].offsetHeight;
				document.getElementsByClassName("setHeight")[0].style.height = ((height*2)/3) + "px";
				document.getElementsByClassName("setHeight")[0].style.overflow = "auto";
			})();
			
			
			function amanatRequest(){
				url = "../processing/pendingAmanatReport.jsp";
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
				if(fetchRequest.readyState == 4)
					{
						var response = this.response.trim();
						var data = JSON.parse(response);
						setData(data);
					}
			}
			
			function setData(data){
				
				console.log(data);
				console.log(data.length);
				
				var element = document.getElementById("tableBody");
				
				for(i=0;i<data.length;i++){
				
				
					
					 element.insertAdjacentHTML('beforeend','<tr>'+
							'<td>'+data[i].rst+'</td>'+
							'<td>'+data[i].amanatDate+'</td>'+
							'<td>'+data[i].id+'</td>'+
							'<td>'+data[i].customerName+', '+data[i].address+'</td>'+
							'<td>'+data[i].material+'</td>'+
							'<td>'+data[i].quantity+'</td>'+
							'<td>'+data[i].contractRate+'</td>'+
							'<td>'+data[i].total+'</td>'+
						'</tr>');
				 
				}
			}
		</script>
</body>
</html>
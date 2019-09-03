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
	 <%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
		<div class="row row-background">
			<div class="col-md-12">
			<div class="setHeight">
			<table id="tblPendingAmanat" class="table table-bordered">
				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>RST</th>
						<th>Date</th>
						<th>Vendor Name & Address</th>
						<th>Grade</th>
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
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="../js/export/export2excel.js"></script>
    	<script type="text/javascript">
        function Export() {
            $("#tblPendingAmanat").export2excel({
            	filename: "Pending_Amanat.xls"
            });
        }
		</script>
		<script>
		setTitle("Pending Amanat");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		
		
		window.onload = function() {
			amanatRequest();
			};
			
		
		/*	var documentHeight = (function(){
				var height = document.getElementsByTagName("html")[0].offsetHeight;
				document.getElementsByClassName("setHeight")[0].style.height = ((height*2)/3) + "px";
				document.getElementsByClassName("setHeight")[0].style.overflow = "auto";
			})();*/
			
			
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
							'<td>'+(i+1)+'</td>'+
							'<td>'+data[i].rst+'</td>'+
							'<td>'+data[i].amanatDate+'</td>'+
							'<td hidden>'+data[i].amanatId+'</td>'+
							'<td>'+data[i].customerName+', '+data[i].customerAddress+'</td>'+
							'<td>'+data[i].grade+'</td>'+
							'<td>'+data[i].quantity+'</td>'+
							'<td>'+data[i].contractRate+'</td>'+
							'<td>'+((data[i].quantity/100) * data[i].contractRate)+'</td>'+
						'</tr>');
				 
				}
			}
			
			document.getElementById("exportToExcel").addEventListener("click",function(){
				Export();
				})
			
		</script>
</body>
</html>
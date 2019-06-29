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
      <title>Purchase Invoices</title>
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
							<th>Date</th>
							<th>Invoice No</th>
							<th>Vendor Name</th>
							<th>Address</th>
							<th>Mobile No</th>
							<th>Status</th>
							<th>Print</th>
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
			setTitle("Purchase Invoices");//Setting Title of Page
			setSearchPlaceholder("Invoice No");//Setting Placeholder of Search Input
			
			document.getElementById("companyId").addEventListener("change",function(){
				companyFilter(this.value);
			})
			
			
			window.onload = function() {
				getInvoiceReport();
				};
			
			function getInvoiceReport(){
				
				url = "../processing/purchaseInvoiceReport.jsp";
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
					
					var jsonResponse = JSON.parse(response);
					console.log(jsonResponse);
					var status;
					
					
					for(i=0;i<jsonResponse.length;i++){
						if(jsonResponse[i].pending <= 0){
							status = "Paid"; 
						}
						else if(jsonResponse[i].pending > 0){
							status = "Pending";
						}
						
						element.insertAdjacentHTML('beforeend','<tr>'+
								'<td hidden>'+jsonResponse[i].companyId+'</td>'+
								'<td>'+jsonResponse[i].invDate+'</td>'+
								'<td>'+jsonResponse[i].invoiceNo+'</td>'+
								'<td>'+jsonResponse[i].customerName+'</td>'+
								'<td>'+jsonResponse[i].customerAddress+'</td>'+
								'<td>'+jsonResponse[i].customerMobile+'</td>'+
								'<td>'+status+'</td>'+
							'</tr>');
					}
					console.log(element.rows.length);
				}
			}
			
			function companyFilter(companyId)
			{
				var tableBody = document.getElementById("tableBody");
				for(i=0;i<tableBody.rows.length;i++){
						tableBody.rows.item(i).removeAttribute('hidden');
					}
				
				for(i=0;i<tableBody.rows.length;i++){
					var id = tableBody.rows.item(i).cells[0].innerHTML;
					if(companyId != id){
						tableBody.rows.item(i).setAttribute('hidden','hidden');
					}
				}
				
			} 
		</script>

</body>
</html>
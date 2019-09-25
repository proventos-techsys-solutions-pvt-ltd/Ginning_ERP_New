<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/admin/sidenav.css">
	  <link rel="stylesheet" href="../styles/WBStyle.css">
      <title>Purchase Invoices</title>
    </head>
<body>
<%@include file="../admin/Top_Nav.jsp" %>
		<div class="container-fluid container-mr-t">
		 <%@include file="../admin/Side_bar.html" %>
		<%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th hidden>Company Id</th>
							<th hidden>Invoice Id</th>
							<th>Date</th>
							<th>Invoice No</th>
							<th>Vendor Name</th>
							<th>Address</th>
							<th>Mobile No</th>
							<th>Status</th>
							<th class="text-center">Print</th>
							<th class="text-center">Delete</th>
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
						if(jsonResponse[i].pendingAmount <= 0){
							status = "Paid"; 
						}
						else if(jsonResponse[i].pendingAmount > 0){
							status = "Pending";
						}
						
						element.insertAdjacentHTML('beforeend','<tr>'+
								'<td hidden>'+jsonResponse[i].companyId+'</td>'+
								'<td hidden>'+jsonResponse[i].invoiceId+'</td>'+
								'<td>'+jsonResponse[i].invoiceDate+'</td>'+
								'<td>'+jsonResponse[i].invoiceNo+'</td>'+
								'<td>'+jsonResponse[i].customerName+'</td>'+
								'<td>'+jsonResponse[i].customerAddress+'</td>'+
								'<td>'+jsonResponse[i].customerMobile+'</td>'+
								'<td>'+status+'</td>'+
								'<td id="print" class="text-center"><img src="../property/img/printer.png" alt="print" ></td>'+
								'<td class="text-center"><img src="../property/img/delete.png" alt="deleteRow" ></td>'+
							'</tr>');
					}
				}
			}
			
			function companyFilter(companyId)
			{
				var tableBody = document.getElementById("tableBody");
				for(i=0;i<tableBody.rows.length;i++){
						tableBody.rows.item(i).removeAttribute('hidden');
					}
				if(companyId != 0){
					for(i=0;i<tableBody.rows.length;i++){
						var id = tableBody.rows.item(i).cells[0].innerHTML;
						if(companyId != id){
							tableBody.rows.item(i).setAttribute('hidden','hidden');
						}
					}
				}
				
			} 
			
		document.addEventListener('click',function(e){
			if(e.srcElement.alt==='print'){
				var rowNo = e.srcElement.parentElement.parentElement.rowIndex;
				var invoiceId = document.getElementById('tableBody').rows[rowNo].cells[1].innerHTML;
				
				window.open('../report/InvoicePDFPrintOnly.jsp?invoiceId='+invoiceId);
			}
		})
		
		document.addEventListener('click',function(e){
			if(e.srcElement.alt === 'deleteRow'){
				var table = document.getElementById('tableBody');
				var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-1;
				var invoiceId = table.rows[rowIndex].cells[1].innerHTML;
				deleteInvoiceEntry(invoiceId);
			}
		})
		
		
		function deleteInvoiceEntry(invoiceId){
			url = "../processing/deleteInvoiceEntry.jsp?invoiceId="+invoiceId;
			if(window.XMLHttpRequest){  
				deleteRequest=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				deleteRequest=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				deleteRequest.onreadystatechange=deleteResponse;  
				console.log("AJAX Req sent");
				deleteRequest.open("GET",url,true);  
				deleteRequest.send();  
			}catch(e){alert("Unable to connect to server");}	
		}
		
		function deleteResponse(){
			if(deleteRequest.readyState == 4){
				var response = this.response.trim();
				console.log(response);
				if(response.includes('CASH')){
					window.alert("Cash payment has been done for this invoice by the cashier.");
				}else if(response.includes('CHEQUE')){
					window.alert("Cheque has been issued against this invoice by cashier.");
				}else if(response.includes('RTGS')){
					window.alert("RTGS entry has been made against this invoice by cashier.");
				}else{
					window.alert('Invoice No. '+response+' is deleted successesfully.');
					location.reload();
				}
			} 
		}
			
		</script>

</body>
</html>
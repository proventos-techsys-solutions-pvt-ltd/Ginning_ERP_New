<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
    <head>
	    <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../styles/bootstrap.min.css">
		<link rel="stylesheet" href="../styles/admin/sidenav.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="../js/3.2.1-jq.js"></script>
	    <title>Purchase Invoices</title>
    </head>
<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
		<div class="container-fluid ">
		<%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
		<div class="row row-background">
			<div class="col-md-12">
				<table id="tblInvoiceReport" class="table table-bordered">
					<thead>
						<tr>
							<th hidden>Company Id</th>
							<th hidden>Invoice Id</th>
							<th>Date</th>
							<th>Invoice No</th>
							<th>RSTs</th>
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
		</div>
		</div>
		
		<!-- Delete confirmation  modal pop up -->
			<div class="response-back-display1"></div>
			<div class="response-body1">
				<div class="response-header1">
					<h5>Information</h5>
				</div>
				<div class="response-content1">
					<div class="d-flex justify-content-center align-items-center">
					<h5 id="response-text1" class="ml-4"></h5>
					</div>
				</div>
				<div class="response-footer1">
					<button type="button" class="btn btn-success btn-response" id="response-button1">Ok</button>
					<button type="button" class="btn btn-success btn-response ml-2" id="cancel-button1">Cancel</button>
				</div>
	</div>
		
		<!-- Response modal pop up -->
<div class="response-back-display"></div>
<div class="response-body">
	<div class="response-header">
		<h5>Information</h5>
	</div>
	<div class="response-content">
		<div class="d-flex justify-content-center align-items-center">
		<h5 id="response-text" class="ml-4"></h5>
		</div>
	</div>
	<div class="response-footer">
		<button type="button" class="btn btn-success btn-response" id="response-button">Ok</button>
	</div>
</div>
		
		<script src="../js/3.4.1-jq.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script src="../js/Validation.js"></script>
			<script src="../js/export/export2excel.js"></script>
		<script>
		
		 //*********************Search 
        $(document).ready(function(){
          $("#searchInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#tableBody tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
    	
			setTitle("Purchase Invoices");//Setting Title of Page
			setSearchPlaceholder("Invoice No");//Setting Placeholder of Search Input
			
			function getCurrentDate(){
				var today = new Date();
				var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
				var time = today.getHours()+ "_" + today.getMinutes()+ "_" + today.getSeconds();
				var dateTime = date+'_'+time;
				return dateTime;
			}
			
			function Export() {
	            $("#tblInvoiceReport").export2excel({
	            	filename: "Invoice_Report_"+getCurrentDate()+".xls"
	            });
	        }
		
		 document.getElementById("exportToExcel").addEventListener("click",function(){
				Export();
				})			
			
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
								'<td>'+jsonResponse[i].rst+'</td>'+
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
				var rowNo = e.srcElement.parentElement.parentElement.rowIndex-1;
				var invoiceId = document.getElementById('tableBody').rows[rowNo].cells[1].innerHTML;
				
				window.open('../report/InvoiceReport.jsp?invoiceId='+invoiceId);
			}
		})
		
		document.addEventListener('click',function(e){
			if(e.srcElement.alt === 'deleteRow'){
				var table = document.getElementById('tableBody');
				var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-1;
				var invoiceId = table.rows[rowIndex].cells[1].innerHTML;
				var invoiceNo =  table.rows[rowIndex].cells[3].innerHTML;
				$.fn.confirmDelete(1,"Do you want to delete "+invoiceNo+" ?");
				$("#response-button1").click(function(){
					deleteInvoiceEntry(invoiceId);
				})
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
					window.alert(response+" HAS BEEN ALREADY PAID. PLEASE DELETE THESE ENTRIES FIRST.");
				}else{
					$.fn.checkStatus(1,'Invoice No. '+response+' is deleted successesfully.');
					$("#response-button").click(function(){
						location.reload();
					})
				}
			} 
		}
		$("#cancel-button1").click(function(){
			location.reload();
		})
		/***********************
		Side bar 
		************************/
		$(document).ready(function () {
		    $('#sidebarCollapse').on('click', function () {
		        $('#sidebar').toggleClass('active');
		    });
		});
		</script>

</body>
</html>
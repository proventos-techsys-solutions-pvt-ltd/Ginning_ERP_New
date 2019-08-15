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
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
</head>

<body>

<%@include file="../admin/Top_Nav.html" %>
	<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	 <%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
		<div class="row mt-2 row-background">
			<div class="col-md-12">
				<table id="tblCustomer" class="table table-bordered">
					<thead>
						<tr>
							<th>Name</th>
							<th>Address</th>
							<th width="15%">Mobile No</th>
							<th width="10%">BlackListed</th>
							<th width="10%">Membership</th>
							<th width="5%" class="text-center">Edit</th>
							<th width="5%" class="text-center">Delete</th>
						</tr>
					</thead>
					<tbody id="tableBody">
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="newCustomerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-top" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Add New Customer</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <form id="updateCustomerForm" action="../processing/updateCustomer.jsp">
		       <input type="hidden" name="customerId" id="customerId" value="" />
		       	<div class="form-row">
			       	<div class="col-md-6">
			       		<label>Name</label>
			       		<input type="text" id="customerName" class="form-control" name="name">
			       	</div>	
			       	<div class="col-md-6">
			       		<label>Mobile</label>
			       		<input type="tel" class="form-control" name="mobile" id="customerMobile">
			       	</div>
			       	<div class="col-md-12">
			       		<label>Address</label>
		       			<textarea class="form-control" name="address" id="customerAddress"></textarea>
			       	</div>	
			       	<div class="col-md-6">
			       	<div class="custom-control custom-checkbox">
		       			 <input type="checkbox" class="custom-control-input" name="membership" id="membership" value="0">
                         <label class="custom-control-label lbl-rm-t" for="membership">Membership</label>
			       	</div>
			       	</div>	
			       	<div class="col-md-6">
			       		<div class="custom-control custom-checkbox">
			       			<input type="checkbox" class="custom-control-input" name="blacklist" id="blacklist" value="0">
                      	 	<label class="custom-control-label lbl-rm-t" for="blacklist">Blacklist</label>
			       		</div>
			       	</div>	
		       	</div>
		       </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" id='updateCustomerBtn'>Update Customer</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		</div>
		
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="../js/export/export2excel.js"></script>
    	<script type="text/javascript">
        function Export() {
            $("#tblCustomer").export2excel({
            	filename: "Customers.xls"
            });
        }
		</script>
		
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
					
					var membership;
					var blacklisted;
					
					for(i=0;i<jsonResponse.length;i++){
						
						if(jsonResponse[i].blacklist === 1){
							blacklisted = 'YES';
						}else{
							blacklisted = 'NO'
						}
						if(jsonResponse[i].membership === 1){
							membership = 'YES';
						}else{
							membership = 'NO';
						}
						
						element.insertAdjacentHTML('beforeend','<tr>'+
								'<td hidden>'+jsonResponse[i].id+'</td>'+
								'<td>'+jsonResponse[i].name+'</td>'+
								'<td>'+jsonResponse[i].address+'</td>'+
								'<td>'+jsonResponse[i].mobile+'</td>'+
								'<td>'+blacklisted+'</td>'+
								'<td>'+membership+'</td>'+
								'<td class="text-center" id="edit"><img src="../property/img/edit.png" alt="edit"></td>'+
								'<td class="text-center"><img src="../property/img/delete.png" alt="delete" id="deleteRow"></td>'+
							'</tr>')
					}
				}
			}

			
	document.addEventListener('click',function(e){
		if(e.srcElement.id === 'edit' || e.srcElement.alt==='edit'){
			var row;
			if(e.srcElement.id === 'edit' ){
				row = e.srcElement.parentNode;
				console.log(row);
			}else if(e.srcElement.alt==='edit'){
				row = e.srcElement.parentNode.parentNode;
				console.log(row);
			}
			
			document.getElementById('customerId').value = row.cells[0].innerHTML;
			document.getElementById('customerName').value = row.cells[1].innerHTML;
			document.getElementById('customerAddress').value = row.cells[2].innerHTML;
			document.getElementById('customerMobile').value = row.cells[3].innerHTML;
			
			if(row.cells[4].innerHTML === 'NO'){
				document.getElementById('blacklist').value = '0';
				document.getElementById('blacklist').checked = false;
			}
			else if(row.cells[4].innerHTML === 'YES')
			{
				document.getElementById('blacklist').value = '1';
				document.getElementById('blacklist').checked = true;
			}
			
			if(row.cells[5].innerHTML === 'NO'){
				document.getElementById('membership').value = '0';
				document.getElementById('membership').checked = false;
			}
			else if(row.cells[5].innerHTML === 'YES')
			{
				document.getElementById('membership').value = '1';
				document.getElementById('membership').checked = true;
			}
			
			$("#newCustomerModal").modal();
		}
	});
					
	document.addEventListener('change', function(e){
		if(e.srcElement.id === 'membership' || e.srcElement.id === 'blacklist' ){
			if(e.srcElement.value === '0'){
				e.srcElement.value = '1'	
			}
			else if(e.srcElement.value === '1'){
				e.srcElement.value = '0'
			}
		}
	});	
	
	document.getElementById('updateCustomerBtn').addEventListener('click',function(e){
		console.log(document.getElementById('blacklist').value);
		document.getElementById('updateCustomerForm').submit();
		
	});
	
	document.getElementById("exportToExcel").addEventListener("click",function(){
		Export();
		})
	
		</script>
</body>
</html>
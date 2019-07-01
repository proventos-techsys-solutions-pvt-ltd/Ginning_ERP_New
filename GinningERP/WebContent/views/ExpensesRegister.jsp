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
      <title>Expenses Register</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<%@include file="../views/CommonSearchHeaderForReports.jsp" %>
		<div class="row mt-2 tile-background-row">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Date</th>
						<th>Voucher No</th>
						<th>Expense Category</th>
						<th>Reference</th>
						<th>Description</th>
						<th>Amount</th>
						<th>Mode Of Payment</th>
					</tr>
				</thead>
				<tbody id="tableBody">
				<tr>   </tr>
				</tbody>
			</table>
		</div>
		
		<!-- OPTIONS MODAL POP-UP STARTS HERE -->
		<div class="modal fade" id="optionsModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Options</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      		<form>
		      			<div class="form-row">
		      				<div class="col-md-auto">
		      					<label>Period</label>
		      				</div>
		      				<div class="col-md-auto">
		        				<input type="date" class="form-control form-control-sm " name="" id="">
		        			</div>
			        		<div class="col-md-auto">
			        			<label>To</label>
			        		</div>	
			        		<div class="col-md-auto">
			        			<input type="date" class="form-control form-control-sm " name="" id="">
			        		</div>
		      			</div>
		      			<div class="form-row">
		      				<div class="col-md-auto">
		      					<label>Category</label>
		      				</div>
		      				<div class="col-md-6">
		      					<select class="form-control form-control-sm name="" id="">
		      						<option value="">Wages</option>
		      						<option value="">Salary</option>
		      					</select>
		      				</div>
		      			</div>
		      			<div class="form-row">
		      				<div class="col-md-auto">
		      					<label>Amount</label>
		      				</div>
		      				<div class="col-md-5">
		      					<select class="form-control form-control-sm name="" id="">
		      						<option value="">Equal To</option>
		      						<option value="">Greater Than</option>
		      						<option value="">Smaller Than</option>
		      					</select>
		      				</div>
		      				<div class="col-md-auto">
			        			<input type="text" class="form-control form-control-sm " name="" id="">
			        		</div>
		      			</div>
		      		</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" id="filterBtn">OK</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- OPTIONS MODAL POP-UP ENDS HERE  -->
		
		
	</div>
	

	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
		setTitle("Expense Register");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		callModalPopup("options","optionsModal");//calling option pop-up
		
		document.getElementById("companyId").addEventListener("change",function(){
			getExpenses(this.value);
		})
		
		function getExpenses(companyId){
			console.log(companyId);
			
			document.getElementById('tableBody');
			
			//url = "../processing/expenseReport.jsp?companyId="+companyId;
			var url = "../processing/expenseReport.jsp?companyId="+companyId;
			console.log(url);
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
			}catch(e){alert(e);}	
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
							'<td>'+jsonResponse[i].voucherDate+'</td>'+
							'<td>'+jsonResponse[i].voucherNo+'</td>'+
							'<td>'+jsonResponse[i].accountCategory+'</td>'+
							'<td>'+jsonResponse[i].expenseReference+'</td>'+
							'<td>'+jsonResponse[i].description+'</td>'+
							'<td>'+jsonResponse[i].amount+'</td>'+
							'<td>'+jsonResponse[i].modeOfPayment+'</td>'+
						'</tr>')
				}
			}
		}
		
	</script>
</body>
</html>
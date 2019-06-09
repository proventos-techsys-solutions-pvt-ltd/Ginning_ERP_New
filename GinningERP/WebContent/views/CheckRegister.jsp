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
      <title>Check Register</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<%@include file="../views/CommonSearchHeaderForReports.html" %>
		<div class="row mt-2 tile-background-row">
		<div class="col-md-12">
			<table class="table table-bordered mt-2">
				<thead>
					<tr>
						<th>Cheque No</th>
						<th>Date</th>
						<th>Vendor Name</th>
						<th>Amount</th>
					</tr>
				</thead>
				<tbody id="getChequeDetailsToPrint" data-toggle="modal" data-target="#chequePrintModal">
				<%for(int i = 0 ; i<10 ; i++){ %>
					<tr onclick="getTableDataOnRowClick('getChequeDetailsToPrint',this,'cheque')">
						<td>140<%= i %></td>
						<td>21/05/2019</td>
						<td>XYZ</td>
						<td>10000</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
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
		        				<label>Cheque Range</label>
		        			</div>
		        			<div class="col-md-auto">
		        				<select class="form-control form-control-sm">
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        			</select>
		        			</div>
		        			<div class="col-md-auto">
		        				<label>To</label>
		        			</div>
		        			<div class="col-md-auto">
		        				<select class="form-control form-control-sm">
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        			</select>
		        			</div>
		        		</div>
	        		<div class="form-row">
	        			<div class="col-md-auto">
	        				<label>Vendor</label>
	        			</div>
		        		<div class="col-md-auto">
		        			<select class="form-control form-control-sm">
		        				<option value=""> vendor name</option>
		        				<option value=""> vendor name</option>
		        				<option value=""> vendor name</option>
		        			</select>
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
		
		<!-- CHEQUE PRINT MODAL POP-UP STARTS HERE -->
		<div class="modal fade" id="chequePrintModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Print Cheque</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<form>
		      		<div class="cheque">
		      		<div class="accP">Acc Payee</div>
		      			<div class="form-row">
									      			
		      				<div class="col-md-1">
		      					<label>Bank</label>
		      				</div>
		      				<div class="col-md-3 ">
			      				<select class="form-control form-control-sm">
			      					<option>Bank of India</option>
			      					<option>HDFC Bank</option>
			      				</select>
			      			</div>
			      			<div class="col-md-2">
			      				<label>Cheque No</label>
			      			</div>
			      			<div class="col-md-3 ">
			      				<input type="text" class="form-control-chq" name="cheque" id="chequeNo" >
			      			</div>
			      			<div class="col-md-3">
			      				<input type="text" class="form-control-chq" name="cheque" id="chequeNo" >
			      			</div>
		      			</div>
		      			<div class="form-row">
			      			<div class="col-md-2">
			      				<label>Pay</label>
			      			</div>
			      			<div class="col-md-10">
		      					<input type="text" class="form-control-chq" name="cheque" id="chequeNo" >
		      				</div>
		      			</div>
		      			<div class="form-row">
			      			<div class="col-md-2">
			      				<label>Rupay</label>
			      			</div>
			      			<div class="col-md-8">
		      					<input type="text" class="form-control-chq" name="cheque" id="chequeNo" >
		      					<input type="text" class="form-control-chq" name="cheque" id="chequeNo" >
		      				</div>
		      				<div class="col-md-2">
		      					<input type="text" class="form-control" name="cheque" id="chequeNo" >
		      				</div>
		      			</div>
		      			</div>
		      		</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Void</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">Print</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- CHEQUE PRINT MODAL POP-UP ENDS HERE  -->
	</div>


	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	setTitle("Check Register");//Setting Title of Page
	setSearchPlaceholder("Cheque");//Setting Placeholder of Search Input
	callModalPopup("options","optionsModal");//calling option pop-up
	document.getElementById("clearFilterBtn").disabled = true;//disable clear filter button
	document.getElementById("filterBtn").addEventListener("click",function(){
		document.getElementById("clearFilterBtn").disabled = false;
	})
	</script>
</body>
</html>
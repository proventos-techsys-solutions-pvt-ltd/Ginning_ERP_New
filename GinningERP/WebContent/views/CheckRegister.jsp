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
		<%@include file="../views/CommonSearchHeaderForReports.jsp" %>
		<div class="row mt-2 tile-background-row">
		<div class="col-md-12">
			<table id="tblCheck" class="table table-bordered mt-2">
				<thead>
					<tr>
						<th width="10%">Cheque No</th>
						<th width="10%">Date</th>
						<th width="30%">Vendor Name</th>
						<th width="10%">Invoice No</th>
						<th width="10%">Invoice Date</th>
						<th width="10%">Amount</th>
						<th width="10%">Status</th>
					</tr>
				</thead>
				<tbody id="getChequeDetailsToPrint" data-toggle="modal" data-target="#chequePrintModal">
				<%for(int i = 0 ; i<10 ; i++){ %>
					<tr>
						<td>140<%= i %></td>
						<td>21/05/2019</td>
						<td>XYZ</td>
						<td>INV 001</td>
						<td>21/05/2019</td>
						<td>10000</td>
						<td>Printed/Void</td>
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
		        		<div class="col-md-12">
		        			<h4>Period</h4>
		        		</div>
		        	</div>
		        	
		        	<div class="form-row">
		        		<div class="col-md-6">
		        			<label class="lbl-rm-all">From</label>
		        			<input type="date" class="form-control form-control-sm " name="" id="">
		        		</div>
		        		<div class="col-md-6">
		        			<label class="lbl-rm-all">To</label>
		        			<input type="date" class="form-control form-control-sm " name="" id="">
		        		</div>
		        	</div>
		        	<div class="form-row">
		        		<div class="col-md-12">
		        			<h4>Cheque Range</h4>
		        		</div>
		        	</div>
		        	<div class="form-row">
		        			<div class="col-md-6">
		        				<select class="form-control form-control-sm">
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        			</select>
		        			</div>
		        			<div class="col-md-6">
		        				<select class="form-control form-control-sm">
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        				<option value=""> ChequeNo</option>
		        			</select>
		        			</div>
		        		</div>
	        		<div class="form-row">
	        			<div class="col-md-12">
	        				<h4>Vendor</h4>
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
	</div>

	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="../excelExport/table2excel.js"></script>
    <script type="text/javascript">
        function Export() {
            $("#tblCheck").table2excel({
            	filename: "CheckRegister.xls"
            });
        }
	</script>
	<script>
	setTitle("Check Register");//Setting Title of Page
	setSearchPlaceholder("Cheque");//Setting Placeholder of Search Input
	callModalPopup("options","optionsModal");//calling option pop-up
	document.getElementById("clearFilterBtn").disabled = true;//disable clear filter button
	document.getElementById("filterBtn").addEventListener("click",function(){
	document.getElementById("clearFilterBtn").disabled = false;	
	})
	document.getElementById("exportToExcel").addEventListener("click",function(){
	Export();
	})
	</script>
  
</body>
</html>
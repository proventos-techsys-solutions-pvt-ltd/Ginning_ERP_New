<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
      <title>Daily Transactions Setup</title>
   
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
		<div class="container-fluid">
			<div class="row mt-2 tile-background-row">
				<div class="col-md-3">
					<h4>Daily Transactions Setup </h4>
				</div>
				<div class="col-md-3">
					<h4><%= new Date() %></h4>
				</div>
				<div class="col-md-3 offset-md-3 text-right">
					<button type="button" class="btn btn-success">Set-up</button>
					<button type="button" class="btn btn-success">Print Report</button>
				</div>
			</div>
			
			<div class="row tile-background-row">
				<div class="col-md-3">
					<label class="lbl-rm-l">Setup Company</label>
					<select class="form-control form-control-sm">
						<option value="">Company 1</option>
						<option value="">Company 2</option>
						<option value="">Company 3</option>
					</select>
				</div>
				<div class="col-md-2">
					<label class="lbl-rm-l">Today's Cotton Rate</label>
					<input type="text" class="form-control form-control-sm" name="" id="">
				</div>
			</div>
			
			<div class="row mt-2 tile-background-row">
				<div class="col-md-auto">
					<h4>Stock Details</h4>
				</div>
			</div>
			
			<div class="row tile-background-row">
				<div class="col-md-3">
					<label class="lbl-rm-l">Cotton Bells</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Cotton Seeds</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Cotton Xyz</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Cotton Residue</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
			</div>
			
			<div class="row mt-2 tile-background-row">
				<div class="col-md-auto">
					<h4>Cash Details</h4>
				</div>
			</div>
			
			<div class="row tile-background-row">
				<div class="col-md-3">
					<label class="lbl-rm-l">Opening Balance</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Addition Today &nbsp;<img src="../property/img/add.png" alt="add" class="ctm-hover" id="callCashModal"></label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Utilized Today</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Closing Balance</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
			</div>
			
			<div class="row mt-2 tile-background-row">
				<div class="col-md-auto">
					<h4>Bank Details</h4>
				</div>
			</div>
			
			<div class="row tile-background-row">
			<% for(int i = 0; i<2 ; i++){ %>
				<div class="col-md-12"><label>Bank Name</label></div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Opening Balance</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Addition Today <img src="../property/img/add.png" alt="add" class="ctm-hover" name="callBankModal" id="callBankModal"> </label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Utilized Today</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<div class="col-md-3">
					<label class="lbl-rm-l">Closing Balance</label>
					<input type="text" class="form-control form-control-sm" name="" id="" readonly>
				</div>
				<% } %>
			</div>
			
			<!-- **********************CASH ADDITION POP-UP -->
			<div class="modal fade" id="cashAdditionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">Cash Addition Details</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item">
					    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Cash</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Bank</a>
					  </li>
					</ul>
					<div class="tab-content" id="myTabContent">
					<!-- ********************* CASH ADDITION************************ -->
					  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					  	 <form>
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Date</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Voucher No</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="Today's Date">
					      		</div>
					      	</div> 
				      		<div class="form-row">
					      		<div class="col-md-12">
						      		<label class="lbl-rm-l lbl-rm-t">Description</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="">
					      		</div>
					      	</div> 
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l lbl-rm-t">Amount</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="">
					      		</div>
					      		<div class="col-md-8">
					      			<label class="lbl-rm-l lbl-rm-t">Reference</label>
					      			<input type="text" class="form-control form-control-sm" name="" id="" value="">
				      			</div>
					      	</div> 
					      </form>
					  </div>
					  
					  
					  <!-- *********************BANK CASH CONTRA ADDITION************************ -->
					  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					  	 <form>
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Date</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Voucher No</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Bank</label>
						      		<select class="form-control form-control-sm">
						      			<option value="">Bank 1</option>
						      			<option value="">Bank 2</option>
						      			<option value="">Bank 3</option>
						      		</select>
					      		</div>
					      	</div> 
				      		<div class="form-row">
					      		<div class="col-md-12">
						      		<label class="lbl-rm-l lbl-rm-t">Description</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="">
					      		</div>
					      	</div> 
					      	<div class="form-row">
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l lbl-rm-t">Amount</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="">
					      		</div>
					      		<div class="col-md-8">
					      			<label class="lbl-rm-l lbl-rm-t">Reference</label>
					      			<input type="text" class="form-control form-control-sm" name="" id="" value="">
				      			</div>
					      	</div> 
					      </form>
					  </div>
					  
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary btn-sm">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			 <!-- *********************BANK ADDITION************************ -->
			
			<div class="modal fade" id="bankAdditionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog " role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalCenterTitle">Bank Addition Details</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      		<form>
			      			<div class="form-row">
			      				<div class="col-md-4">
						      		<label class="lbl-rm-l">Date</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Voucher No</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="Today's Date">
					      		</div>
					      		<div class="col-md-4">
						      		<label class="lbl-rm-l">Mode</label>
						      		<select class="form-control form-control-sm" name="" id="">
						      			<option value="">Cheque</option>
						      			<option value="">RTGS</option>
						      			<option value="">Cash</option>
						      		</select>
					      		</div>
			      			</div>
			      			<div class="form-row">
					      		<div class="col-md-12">
						      		<label class="lbl-rm-l lbl-rm-t">Description</label>
						      		<input type="text" class="form-control form-control-sm" name="" id="" value="">
					      		</div>
					      	</div> 
					      	<div class="form-row">
					      		<div class="col-md-4">
					      			<label class="lbl-rm-l lbl-rm-t">Amount</label>
					      			<input type="text" class="form-control form-control-sm" name="" id="" value="">
				      			</div>
				      			<div class="col-md-8">
					      			<label class="lbl-rm-l lbl-rm-t">Reference</label>
					      			<input type="text" class="form-control form-control-sm" name="" id="" value="">
				      			</div>
					      	</div>
			      		</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary btn-sm">Save</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		</div> 
	
	
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	callModalPopup("callCashModal","cashAdditionModal"); // Calling Cash Addition Pop-up
	callModalPopupWithIndex("callBankModal","bankAdditionModal"); // Calling Bank Addition Pop-up
	</script>
</body>
</html>
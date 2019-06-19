<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>

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
		<div class="col-md-12">
			<h4>Chart of Accounts</h4>
		</div>
		</div>
		
		<div class="row tile-background-row">
			<div class="col-md-3">
				<label class="lbl-rm-l lbl-rm-t">Company</label>
				<select class="form-control form-control-sm" name="company" id="company">
					<c:Company/>					
				</select>
			</div>
		</div>
		
		<div class="row tile-background-row">
			<div class="col-md-3 ">
				<div class="d-flex flex-row flex-wrap align-items-center">
					<div class="p-2">
						<input type="text" class="form-control form-control-sm " name="" id="" placeholder="Filter">
					</div>
					<div class="p-2">
						<img src="../property/img/add.png" alt="add" id="callAddAccount" class="ctm-hover" >
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Account Name</th>
							<th>Account Category</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<!--******************** Account Add Pop Up********************* -->
		<div class="modal fade" id="addAccount" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Account</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form id="charOfAccounts">
		        	<div class="form-row">
		        		<div class="col-md-6">
		        			<label>Account Category</label> <!-- take value from table accounttype -->
		        			<select class="form-control form-control-sm" name="accountType" id="accountType">
		        				<c:AccountCategory/>
		        			</select>
		        		</div>
		        		<div class="col-md-6">
		        			<label>Account Name</label>
							<input class="form-control form-control-sm" type="text" id="accountName" name="accountName">
		        		</div>
		        		<div class="col-md-12">
		        			<label>Description</label>
		        			<textarea class="form-control form-control-sm" name="accountDescription" id="accountDescription"></textarea>
		        		</div>
		        	</div>
		        	<div class="form-row">
		        		<div class="col-md-6">
		        			<label>Opening Balance</label>
		        			<input class="form-control form-control-sm" type="text" id="openingBal" name="openingBal">
		        		</div>
		        	</div>
		        	
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-primary" id="saveButton" onclick="submitAccount()">Save and Close</button>
		        <button type="button" class="btn btn-primary" id="updateButton" onclick="updateChartOfAccounts()">Update</button>
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
	callModalPopup("callAddAccount","addAccount");//Calling account add popup
	
	function submitAccount(){
		
		var companyId = document.getElementById('company').value;
		var accountType = document.getElementById('accountType').value;
		var accountName = document.getElementById('accountName').value;
		var description = document.getElementById('accountDescription').value;
		var openingBalance = document.getElementById('openingBal').value;
		
		url = "../processing/addAccount.jsp?company="+companyId+"&accountType="+accountType+"&accountName="+accountName+"&description="+description+"&openingBalance="+openingBalance;
		
		if(window.XMLHttpRequest){  
			submitReq=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			submitReq=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			console.log("AJAX Req sent");
			submitReq.open("GET",url,true);  
			submitReq.send();  
		}catch(e){alert("Unable to connect to server");}
		
	}
	
	</script>	
</body>
</html>
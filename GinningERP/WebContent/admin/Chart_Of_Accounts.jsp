<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Chart Of Accounts</title>
</head>

<body>

<%@include file="../admin/Top_Nav.jsp" %>
	<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	<div class="row mt-2 row-background border-bottom">
		<div class="col-md-12">
			<h4>Chart of Accounts</h4>
		</div>
		</div>
		
		<div class="row row-background">
			<div class="col-md-3">
				<label class="lbl-rm-l lbl-rm-t">Company</label>
				<select class="form-control form-control-sm" name="company" id="company">
					<option value="0">All</option>
					<c:Company/>					
				</select>
			</div>
		</div>
		
		<div class="row row-background">
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
		
		<div class="row mt-2 row-background">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Account ID</th>
							<th>Account Name</th>
							<th>Account Category</th>
							<th>Description</th>
							<th>Opening Balance</th>
						</tr>
					</thead>
					<tbody id="tableBody">
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
		        <form id="charOfAccounts" action="../processing/addAccountToGL.jsp">
		        <input type="hidden" id="companyId" name="companyId" value="0"/>
		        <input type="hidden" id="accountId" name="accountId" value="0"/>
		        	<div class="form-row">
		        		<div class="col-md-6">
		        			<label>Account Category</label> <!-- take value from table accounttype -->
		        			<select class="form-control form-control-sm" name="accGroupId" id="accGroupId">
		        				<c:AccountCategory/>
		        			</select>
		        		</div>
		        		<div class="col-md-6">
		        			<label>Account Name</label>
							<input class="form-control form-control-sm" type="text" id="accountLedgerName" name="accountLedgerName">
		        		</div>
		        		<div class="col-md-12">
		        			<label>Description</label>
		        			<textarea class="form-control form-control-sm" name="ledgerDesc" id="ledgerDesc"></textarea>
		        		</div>
		        	</div>
		        	<div class="form-row">
		        		<div class="col-md-4">
		        			<label>Opening Balance</label>
		        			<input class="form-control form-control-sm" type="text" id="openingBal" name="openingBal">
		        		</div>
		        		<div class="col-md-2">
		        			<label>Balance</label>
		        			<select class="form-control form-control-sm" name="openingBalType" id="openingBalType">
		        				<option value="1">Dr</option>
		        				<option value="2">Cr</option>
		        			</select>
		        		</div>
		        		<div class="col-md-6">
		        			<label>Date</label>
		        			<input class="form-control form-control-sm" type="date" id="openingBalDate" name="openingBalDate">
		        		</div>
		        	</div>
		        	
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-primary" id="saveButton" onclick="submitAccount()">Save and Close</button>
		        <button type="button" class="btn btn-primary" id="updateButton" >Update</button>
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
	
	document.getElementById("callAddAccount").addEventListener("click",function(e){
		var companyId = document.getElementById("company").value;
		if(companyId>0){
			document.getElementById("companyId").value = companyId;
			document.getElementById("accountId").value = "";
			document.getElementById("openingBal").value = "";
			document.getElementById("accountLedgerName").value = "";
			document.getElementById("ledgerDesc").value = "";
			document.getElementById("openingBalDate").value = "";
			$("#addAccount").modal();
		}else{
			alert("Please Select a company from dropdown.")
		}
	})
	
	function submitAccount(){
		document.getElementById("charOfAccounts").submit();
	}
	
	function fetchReport(){
		url = "../processing/generalLedgerReport.jsp";
		if(window.XMLHttpRequest){  
			fetchRequest=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchRequest=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchRequest.onreadystatechange=getLedgerData;  
			console.log("AJAX Req sent");
			fetchRequest.open("GET",url,true);  
			fetchRequest.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function getLedgerData(){
		if(fetchRequest.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			var data  = JSON.parse(response);
			console.log(data);
			setDataInTable(data);
		}

	function setDataInTable(data){
			var table = document.getElementById("tableBody");
			
			var dataLength = data.length;
			
			for(i=0; i<dataLength; i++)
			{
				var noOfRows = table.rows.length;
				
				var row = table.insertRow(noOfRows);
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				var cell6 = row.insertCell(5);
				var cell7 = row.insertCell(6);
				var cell8 = row.insertCell(7);
				cell1.hidden=true;
				cell7.hidden=true;
				cell8.hidden=true;
				
				cell1.innerHTML = data[i].id;
				cell2.innerHTML = data[i].accountId;
				cell3.innerHTML = data[i].accountLedger;
				cell4.innerHTML = data[i].groupName;
				cell5.innerHTML = data[i].ledgerDesc;
				cell6.innerHTML = data[i].openingBal;
				cell7.innerHTML = data[i].glDate;
				cell8.innerHTML = data[i].companyId;
			}
		}
	}
	fetchReport();
	
	
	document.addEventListener('click',function(e){
		if(e.srcElement.tagName === "TR"){
			var rowIndex = e.srcElement.rowIndex;
			var table = document.getElementById("tableBody");
			
			var selectGroup = document.getElementById("accGroupId");
			for(i=0; i<selectGroup.options.length; i++){
				if(table.rows[rowIndex].cells[3].innerHTML === selectGroup.options[i].innerHTML){
					selectGroup.options[i].selected=true;
					break;
					}
			}
			var selectTrans = document.getElementById("openingBalType");
				if(table.rows[rowIndex].cells[5].innerHTML > 0 ){
					selectTrans.options[0].selected=true;
				}
				else if(table.rows[rowIndex].cells[5].innerHTML < 0 ){
					selectTrans.options[1].selected=true;
				}
			document.getElementById("companyId").value = table.rows[rowIndex].cells[7].innerHTML;
			document.getElementById("accountId").value = table.rows[rowIndex].cells[1].innerHTML;
			document.getElementById("openingBal").value = table.rows[rowIndex].cells[5].innerHTML;
			document.getElementById("accountLedgerName").value = table.rows[rowIndex].cells[2].innerHTML;
			document.getElementById("ledgerDesc").value = table.rows[rowIndex].cells[4].innerHTML;
			document.getElementById("openingBalDate").value = table.rows[rowIndex].cells[6].innerHTML;
			
			$("#addAccount").modal();
		}
		else if(e.srcElement.tagName === "TD"){
			var rowIndex = Number(e.srcElement.parentNode.rowIndex) - 1;
			var table = document.getElementById("tableBody");
			
			var selectGroup = document.getElementById("accGroupId");
			for(i=0; i<selectGroup.options.length; i++){
				if(table.rows[rowIndex].cells[3].innerHTML === selectGroup.options[i].innerHTML){
					selectGroup.options[i].selected=true;
					break;
				}
			}
			var selectTrans = document.getElementById("openingBalType");
				if(table.rows[rowIndex].cells[5].innerHTML > 0 ){
					selectTrans.options[0].selected=true;
				}
				else if(table.rows[rowIndex].cells[5].innerHTML < 0 ){
					selectTrans.options[1].selected=true;
				}
			document.getElementById("companyId").value = table.rows[rowIndex].cells[7].innerHTML;
			document.getElementById("accountId").value = table.rows[rowIndex].cells[1].innerHTML;
			document.getElementById("openingBal").value = table.rows[rowIndex].cells[5].innerHTML.replace('-','');
			document.getElementById("accountLedgerName").value = table.rows[rowIndex].cells[2].innerHTML;
			document.getElementById("ledgerDesc").value = table.rows[rowIndex].cells[4].innerHTML;
			document.getElementById("openingBalDate").value = table.rows[rowIndex].cells[6].innerHTML;

			$("#addAccount").modal();
		}
	})
	
	document.getElementById("updateButton").addEventListener('click',function(e){
		document.getElementById("charOfAccounts").action = "../processing/updateGLAccount.jsp";
		document.getElementById("charOfAccounts").submit();	
	})
	
	document.getElementById("company").addEventListener('change',function(e){
		var companyId = e.srcElement.value;
		var tableBody = document.getElementById("tableBody");
		if(Number(companyId)>0){
			document.getElementById("companyId").value = e.srcElement.value;
			for(i=0;i<tableBody.rows.length;i++){
					tableBody.rows.item(i).removeAttribute('hidden');
				}
			for(i=0;i<tableBody.rows.length;i++){
				var id = tableBody.rows.item(i).cells[7].innerHTML;
				if(companyId != id){
					tableBody.rows.item(i).setAttribute('hidden','hidden');
				}
			}
		}else{
			for(i=0;i<tableBody.rows.length;i++){
				tableBody.rows.item(i).removeAttribute('hidden');
			}
		}
	})
	
	
	</script>	
</body>
</html>
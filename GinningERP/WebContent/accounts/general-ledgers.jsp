<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
 <link rel="stylesheet" href="../styles/WBStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Vouchers</title>
</head>

<body>
 <%@include file="NavBar.jsp" %>
  <div class="container-fluid">
	 <div class="row  row-background border-bottom mt-2">
			<div class="col-md-12 ">
					<h4 id="report-title" class="lbl-rm-l"></h4>
			</div>
			</div>
			<form action="../processing/getTrReport.jsp" id="dateFilterForm">
			<div class="row row-background">
			<div class="col-md-3">
					<label class="lbl-rm-l">Company</label>
					<select class="form-control form-control-sm" name="companyId" id="companyId">
						<option selected>Select</option>
						<c:Company />
					</select>
			</div>
			<div class="col-md-3">
					<label class="lbl-rm-l">Expense Ledger</label>
					<select class="form-control form-control-sm" name="accId" id="accId">
						<option selected>Select</option>
						<c:AccountLedger />
					</select>
			</div>
		</div>
		<div class="row row-background">
		<div class="col-md-2">
				<label>Search</label>
				<input type="text" class="form-control form-control-sm " name="" id="searchInput" placeholder="">
		</div>
		<div class="col-md-2" >		
				<button type="button" class="btn btn-success btn-sm lbl-rm-l" style="margin-top:45px;">Search</button>
			</div>
			<div class="col-md-2" style="margin-left:-150px;">
					<label>From</label>
						<input type="date" class="form-control form-control-sm" id="startDate" name="startDate">
						</div>
			<div class="col-md-2">	
					<label>To</label>
						<input type="date" class="form-control form-control-sm" id="endDate" name="endDate">
						</div>
			<div class="col-md-2">
					<button type="button" class="btn btn-success btn-sm" id="dateFilterButton"  style="margin-top:45px;">Filter</button>
			</div>
			<div class="col-md-2">
				<img src="../property/img/exportexcel.png" alt="option" class="img-set"  style="margin-top:45px;margin-left:-150px;" id="exportToExcel">
			</div>
			</div>
			</form> 
	 	<div class="row row-background">
	 		<div class="col-md-12">
	 		<input type="hidden" name="jsonOutput" id="jsonOutput" value='<%= session.getAttribute("jsonArray") %>' />
	 		<% session.removeAttribute("jsonArray"); %>
	 			<table id="tblAccRegister" class="table table-bordered">
	 				<thead>
	 					<tr>
	 					<th>Date</th>
	 					<th>Voucher No</th>
	 					<th>Voucher Ref</th>
	 					<th>Description</th>
	 					<th>Debit</th>
	 					<th>Credit</th>
	 					<th>Print</th>
	 					
	 					</tr>
	 				</thead>
	 				<tbody id="tableBody">
	 				<tr>
	 						<td></td>
	 						<td></td>
	 						<td></td>
	 						<td></td>
	 						<td></td>
	 						<td></td>
	 						<th></th>
	 					</tr>
	 				</tbody>
	 			</table>
	 		</div>
	 	</div>
	 </div>
	 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script type="text/javascript" src="../js/1.8.3-jq.js"></script>
		<script src="../js/export/export2excel.js"></script>
    	<script type="text/javascript">
    	function getCurrentDate(){
			var today = new Date();
			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
			var time = today.getHours()+ "_" + today.getMinutes()+ "_" + today.getSeconds();
			var dateTime = date+'_'+time;
			return dateTime;
		}
    	
        function Export() {
            $("#tblAccRegister").export2excel({
            	filename: "Expense_Register"+getCurrentDate()+".xls"
            });
        }
		</script>
		<script>
		setTitle("Vouchers");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		
		function fetchReport(){
			var companyId = document.getElementById("companyId").value;
			var accId = document.getElementById("accId").value;
			var startDate = document.getElementById("startDate").value;
			var endDate = document.getElementById("endDate").value;
			
			url = "../processing/getTrReport.jsp?companyId="+companyId+"&accId="+accId+"&startDate="+startDate+"&endDate="+endDate;
			console.log(url);
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
				var parent = JSON.parse(response);
				var openingBalance = parent.openingBal;
				var json = parent.array;
				setReportInTable(json, openingBalance);
			}
		}
		
		
		document.getElementById("dateFilterButton").addEventListener('click',function(e){
			fetchReport();
		})
		
		document.getElementById("companyId").addEventListener("change",function(e){
			var accOptions = document.getElementById("accId").options;
			for(i=0; i<accOptions.length; i++){
				accOptions[i].disabled = false;
				}
			for(i=0; i<accOptions.length; i++){
				if(e.srcElement.value != accOptions[i].getAttribute("data-company-id")){
					accOptions[i].disabled = true;
				}
			}
		})
		
		function setReportInTable(json, openingBalance){
			var table = document.getElementById("tableBody");
			table.innerHTML = '<tr>'+
					'<td></td>'+
						'<td></td>'+
						'<td></td>'+
						'<td>Opening Balance</td>'+
						'<td></td>'+
						'<td></td>'+
						'<th>0</th>'+
					'</tr>';
					
					table.rows[0].cells[6].innerHTML = openingBalance;
				for(i=0;i<json.length;i++){
					var noOfRows = table.rows.length;
					
					var rows = table.insertRow(noOfRows);
					var cell1 = rows.insertCell(0);
					var cell2 = rows.insertCell(1);
					var cell3 = rows.insertCell(2);
					var cell4 = rows.insertCell(3);
					var cell5 = rows.insertCell(4);
					var cell6 = rows.insertCell(5);
					var cell7 = rows.insertCell(6);
					
					cell1.innerHTML = json[i].transactionDate;
					cell2.innerHTML = json[i].voucherNo;
					cell3.innerHTML = json[i].voucherReference;
					cell4.innerHTML = json[i].narration;
					cell5.innerHTML = json[i].debit;
					cell6.innerHTML = json[i].credit;
					cell7.innerHTML = Number(table.rows[noOfRows-1].cells[6].innerHTML) + Number(json[i].debit) - Number(json[i].credit);
					
			}
		}	
		
		document.getElementById("exportToExcel").addEventListener("click",function(){
			Export();
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
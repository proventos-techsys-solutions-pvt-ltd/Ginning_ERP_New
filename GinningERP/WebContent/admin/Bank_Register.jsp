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
<title>Dashboard</title>
</head>

<body>

<%@include file="../admin/Top_Nav.html" %>
	<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	 <div class="row mt-2 row-background border-bottom">
			<div class="col-md-12 ">
					<h4 id="report-title" class="lbl-rm-l"></h4>
			</div>
			</div>
			<form action="../processing/getBankTrReport.jsp" id="dateFilterForm">
			<div class="row row-background">
			<div class="col-md-3">
					<label class="lbl-rm-l">Company</label>
					<select class="form-control form-control-sm" name="companyId" id="companyId">
						<option selected>Select</option>
						<c:Company />
					</select>
			</div>
			<div class="col-md-3">
					<label class="lbl-rm-l">Bank</label>
					<select class="form-control form-control-sm" name="bankId" id="bankId">
						<option selected>Select</option>
						<c:Bank />
					</select>
			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-auto">
				<div class="d-flex justify-content-start align-items-center">
					<label>From</label>
					&nbsp;&nbsp;
						<input type="date" class="form-control form-control-sm" id="startDate" name="startDate">
					&nbsp;&nbsp; 
					<label>To</label>
					&nbsp;&nbsp;
						<input type="date" class="form-control form-control-sm" id="endDate" name="endDate">
					&nbsp;&nbsp;
					<button type="button" class="btn btn-success btn-sm" id="dateFilterButton">Filter</button>
				</div>
			</div>
			</div>
			</form> 
			<div class="row row-background">
			<div class="col-md-auto">
				<div class="d-flex justify-content-start align-items-center">
				<input type="text" class="form-control form-control-sm inpt-rm-t" name="" id="searchInput" placeholder="">
				<button type="button" class="btn btn-success btn-sm lbl-rm-l">Search</button>
				</div>
			</div>
			<div class="col-md-auto">
				<img src="../property/img/setting.png" alt="option" class="img-set" id="options">
				<img src="../property/img/exportpdf.png" alt="option" class="img-set" id="exportToPdf">
				<img src="../property/img/exportexcel.png" alt="option" class="img-set" id="exportToExcel">
			</div>
			</div>
	 	<div class="row row-background">
	 		<div class="col-md-12">
	 		<input type="hidden" name="jsonOutput" id="jsonOutput" value='<%= session.getAttribute("jsonArray") %>' />
	 		<% session.removeAttribute("jsonArray"); %>
	 			<table id="tblBankRegister" class="table table-bordered">
	 				<thead>
	 					<tr>
	 					<th>Date</th>
	 					<th>Voucher No</th>
	 					<th>Voucher Ref</th>
	 					<th>Description</th>
	 					<th>Debit</th>
	 					<th>Credit</th>
	 					<th>Balance</th>
	 					</tr>
	 				</thead>
	 				<tbody id="tableBody">
	 				<tr>
	 						<td></td>
	 						<td></td>
	 						<td></td>
	 						<td>Opening Balance</td>
	 						<td></td>
	 						<td></td>
	 						<th>0</th>
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
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="../js/export/export2excel.js"></script>
    	<script type="text/javascript">
        function Export() {
            $("#tblBankRegister").export2excel({
            	filename: "Bank_Register.xls"
            });
        }
		</script>
		<script>
		setTitle("Bank Register");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		
		document.getElementById("dateFilterButton").addEventListener('click',function(e){
			document.getElementById('dateFilterForm').submit();
		})
		
		document.getElementById("companyId").addEventListener("change",function(e){
			var bankOptions = document.getElementById("bankId").options;
			for(i=0; i<bankOptions.length; i++){
					bankOptions[i].disabled = false;
				}
			for(i=0; i<bankOptions.length; i++){
				if(e.srcElement.value != bankOptions[i].getAttribute("data-company-id")){
					bankOptions[i].disabled = true;
				}
			}
		})
		
		function setReportInTable(){
			var data = document.getElementById("jsonOutput").value;
			var table = document.getElementById("tableBody");
			if(data != "null"){
				json = JSON.parse(data);
				console.log(json);
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
		}	
		
		setReportInTable();
		
		document.getElementById("exportToExcel").addEventListener("click",function(){
			Export();
			})
		
		
		</script>
</body>
</html>
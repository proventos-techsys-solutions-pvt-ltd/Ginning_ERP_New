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
<title>Post Dated Cheque's Report</title>
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
			<div class="row row-background">
			<div class="col-md-3">
					<label class="lbl-rm-l">Company</label>
					<select class="form-control form-control-sm" name="" id="companyId">
						<option selected>Select</option>
						<c:Company />
					</select>
			</div>
		</div>
		
		<div class="row row-background">
		<form action="../processing/getCashReport.jsp" id="dateFilterForm">
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
			</form>
			
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
	 			<table id="tblCashRegister" class="table table-bordered">
	 				<thead>
	 					<tr>
	 					<th>ID</th>
	 					<th>company ID</th>
	 					<th>Sr No</th>
	 					<th>Invoice No</th>
	 					<th>Bank Name</th>
	 					<th>Chq Date</th>
	 					<th>Chq No</th>
	 					<th>Payee</th>
	 					<th>Amount</th>
	 					</tr>
	 				</thead>
	 				<tbody id="tableBody">
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
    	<script>
    	setTitle("PDC Register");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		
		function getPdcReport(){
			
			var url="${pageContext.request.contextPath}/processing/getPDCReport.jsp";
			if(window.XMLHttpRequest){  
				request=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				request=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				request.onreadystatechange=getData;  
				console.log("AJAX Req sent");
				request.open("GET",url,true);  
				request.send();  
			}catch(e){alert("Unable to connect to server");}
			
		}
		
		function getData(){
			if(request.readyState == 4){
				var response = this.response.trim();
				console.log(response);
				var data = JSON.parse(response);
				setData(data);
			}
		}
		
		function setData(data){
			
			var table = document.getElementById("tableBody");
			
			for(i=0; i<data.length;i++){

				var rowIndex = table.rows.length;
				
				var row = table.insertRow(rowIndex);
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				var cell6 = row.insertCell(5);
				var cell7 = row.insertCell(6);
				var cell8 = row.insertCell(7);
				var cell9 = row.insertCell(8);
				
				cell1.innerHTML = data[i].pdcId;
				cell2.innerHTML = data[i].companyId;
				cell3.innerHTML = (i+1);
				cell4.innerHTML = data[i].invoiceNo;
				cell5.innerHTML = data[i].bankName;
				cell6.innerHTML = data[i].chequeDate;
				cell7.innerHTML = data[i].chequeNo;
				cell8.innerHTML = data[i].payeeName;
				cell9.innerHTML = data[i].chequeAmount;
				
			}
		}
		
		getPdcReport();
		
    	</script>
</body>
</html>
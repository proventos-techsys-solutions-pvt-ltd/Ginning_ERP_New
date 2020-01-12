<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../styles/bootstrap.min.css">
	<link rel="stylesheet" href="../styles/admin/sidenav.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>RTGS NEFT</title>
</head>
<body>

<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	 	<div class="row row-background border-bottom">
			<div class="col-md-12">
			<div class="d-flex justify-content-between align-content-center row-background">
				<div class="d-flex justify-content-start align-content-center row-background">
					<h4 class="lbl-rm-all">RTGS Report</h4>
				</div>
				<div class="d-flex justify-content-start align-content-center row-background">
					<button type="button" class="btn btn-success btn-sm" id="exportToExcel">Print Report</button>
				</div>
			</div>
			</div>
			</div>
		<div class="row row-background border-bottom">
			<div class="col-md-4 d-flex justify-content-start align-items-center">
				<label>Search</label>
				<input type="text" class="form-control form-control-sm ml-2" name="" id="searchInput">
				<label class="ml-2">From</label>
				<input type="text" class="form-control form-control-sm inpt-rm-t ml-2" name="" id="from-date" placeholder="">
				<label class="ml-2">To</label>
				<input type="text" class="form-control form-control-sm inpt-rm-t ml-2" name="" id="to-date" placeholder="">
 				<button type="button" class="btn btn-sm btn-success" id="">Filter</button>
 			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-12">
				<table class="table table-bordered" id="table">
					<thead>
						<tr>
							<th>Vendor Name</th>
							<th>Invoice No</th>
							<th>Amount</th>
							<th>Bank Name</th>
							<th>Acount No</th>
							<th>IFSC Code</th>
							<th hidden>RTGS ID</th>
							<th hidden>Invoice ID</th>
							<th hidden>Customer ID</th>
							<th class="text-center" width="5%">Delete</th>
						<tr>
					</thead>
					<tbody id="tableBody">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	</div>
	
		 
	 <!-- Response modal pop up -->
<div class="response-back-display"></div>
<div class="response-body">
	<div class="response-header">
		<h5>Information</h5>
	</div>
	<div class="response-content">
		<div class="d-flex justify-content-center align-items-center">
		<h5 id="response-text" class="ml-4"></h5>
		</div>
	</div>
	<div class="response-footer">
		<button type="button" class="btn btn-success btn-response" id="response-button">Ok</button>
	</div>
</div>
	 
	 	<!-- Delete confirmation  modal pop up -->
			<div class="response-back-display1"></div>
			<div class="response-body1">
				<div class="response-header1">
					<h5>Information</h5>
				</div>
				<div class="response-content1">
					<div class="d-flex justify-content-center align-items-center">
					<h5 id="response-text1" class="ml-4"></h5>
					</div>
				</div>
				<div class="response-footer1">
					<button type="button" class="btn btn-success btn-response" id="response-button1">Ok</button>
					<button type="button" class="btn btn-success btn-response ml-2" id="cancel-button1">Cancel</button>
				</div>
	</div>
	
	
	<script src="../js/3.4.1-jq.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script src="../js/Validation.js"></script>
	<script src="../js/export/export2excel.js"></script>
	<script>
	
	function getCurrentDate(){
		var today = new Date();
		var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		var time = today.getHours()+ "_" + today.getMinutes()+ "_" + today.getSeconds();
		var dateTime = date+'_'+time;
		return dateTime;
	}

function Export() {
     $("#table").export2excel({
     	filename: "RTGS_Report_"+getCurrentDate()+".xls"
     });
 }
 
 
 
 document.getElementById("exportToExcel").addEventListener("click",function(){
		Export();
		});
	
	 //*********************Search 
    $(document).ready(function(){
      $("#searchInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#tableBody tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
      });
    });
	
	function getReport(){
		var url="../processing/getAllRtgsReport.jsp";
		if(window.XMLHttpRequest){  
			fetchReport=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchReport=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchReport.onreadystatechange=fetchReportData;  
			console.log("AJAX Req sent");
			fetchReport.open("GET",url,true);  
			fetchReport.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function fetchReportData()
	{
		if(fetchReport.readyState == 4){
			var response = this.response.trim();
			setDataInTable(response)
		}
	}
	
	function setDataInTable(response){
		var data = JSON.parse(response);
		var table = document.getElementById("tableBody");
		table.innerHTML = "";
		for(i=0; i<data.length; i++){
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
			var cell9 = row.insertCell(8);
			var cell10 = row.insertCell(9);
			
			cell7.hidden = true;
			cell8.hidden = true;
			cell9.hidden = true;
			cell10.align = "center";
			
			cell1.innerHTML = data[i].customerName;
			cell2.innerHTML = data[i].invoiceNo;
			cell3.innerHTML = data[i].rtgsAmount;
			cell4.innerHTML = data[i].bankName;
			cell5.innerHTML = data[i].accountNo;
			cell6.innerHTML = data[i].ifscCode;
			cell7.innerHTML = data[i].id;
			cell8.innerHTML = data[i].invoiceId;
			cell9.innerHTML = data[i].customerId;
			cell10.innerHTML = '<img src="../property/img/delete.png" alt="deleteRow" >';
		}
	}
	
	document.addEventListener("click", function(e){
		if(e.srcElement.alt === 'deleteRow'){
			var table = document.getElementById('tableBody');
			var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-2;
			var rtgsId = table.rows[rowIndex].cells[6].innerHTML;
			var customerName = table.rows[rowIndex].cells[0].innerHTML;
			$.fn.confirmDelete(1,"Do you want to delete RTGS for "+ customerName+"  ?");
			$("#response-button1").click(function(){
				deleteRTGS(rtgsId);
			})
		}
	});
	
	function deleteRTGS(rtgsId){
		var url="../processing/deleteRtgs.jsp?rtgsId="+rtgsId;
		if(window.XMLHttpRequest){  
			deleteReq=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			deleteReq=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			deleteReq.onreadystatechange=getDeleteReturn;  
			console.log("AJAX Req sent");
			deleteReq.open("GET",url,true);  
			deleteReq.send();  
		}catch(e){alert("Unable to connect to server");}		
	}
	
	function getDeleteReturn(){
		if(deleteReq.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			getReport();
		}
	}
	
	$("#cancel-button1").click(function(){
		location.reload();
	})
	getReport();
	
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
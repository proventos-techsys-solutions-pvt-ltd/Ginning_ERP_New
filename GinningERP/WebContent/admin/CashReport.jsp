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

	<title>Cash Report</title>
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
					<h4 class="lbl-rm-all">Cash Report</h4>
				</div>
				<div class="d-flex justify-content-start align-content-center row-background">
					<button type="button" class="btn btn-success btn-sm">Print Report</button>
				</div>
			</div>
			</div>
			</div>
			<div class="row row-background border-bottom">
			<div class="col-md-4">
				<label>Search</label>
				<input type="text" class="form-control" name="" id="searchInput">
 			</div>
		</div>
		<div class="row  row-background">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Vendor Name</th>
							<th>Invoice No</th>
							<th>Invoice Date</th>
							<th>Amount</th>
							<th>Voucher No.</th>
							<th hidden>Invoice ID</th>
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
	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	
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
		var url="../processing/getInvoiceCashReport.jsp";
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
			console.log(response);
			setDataInTable(response);
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
			
			//cell6.hidden = true;
			cell6.hidden = true;
			cell7.align = "center";
			
			cell1.innerHTML = data[i].vendorName;
			cell2.innerHTML = data[i].invoiceNo;
			cell3.innerHTML = data[i].invoiceDate;
			cell4.innerHTML = data[i].amount;
			cell5.innerHTML = data[i].cashVoucherNo;
			cell6.innerHTML = data[i].invoiceId;
			cell7.innerHTML = '<img src="../property/img/delete.png" alt="deleteRow" >';
		}
	}
	
	document.addEventListener("click", function(e){
		if(e.srcElement.alt === 'deleteRow'){
			var table = document.getElementById('tableBody');
			var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-2;
			var invoiceId = table.rows[rowIndex].cells[5].innerHTML;
			deleteCash(invoiceId);
		}
	});
	
	function deleteCash(invoiceId){
		var url="../processing/deleteCashTransaction.jsp?invoiceId="+invoiceId;
		if(window.XMLHttpRequest){  
			cashDel=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			cashDel=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			cashDel.onreadystatechange=getDeleteReturn;  
			console.log("AJAX Req sent");
			cashDel.open("GET",url,true);  
			cashDel.send();  
		}catch(e){alert("Unable to connect to server");}		
	}
	
	function getDeleteReturn(){
		if(cashDel.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			getReport();
		}
	}
	
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
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
<script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
<title>WB Operator</title>
</head>

<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	<div class="row row-background border-bottom">
		<div class="col-md-12">
			<div class="d-flex justify-content-start align-items-center">
				<img src="../property/img/user.png" alt="user">
				&nbsp;
				<h5>User Logged-In as WB-Operator</h5>
			</div>
		</div>
	</div>
	<div class="row row-background">
				<div class="col-md-6">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="3" class="text-center">Pending for Tare Weight</th>
								</tr>
								<tr>
									<th>Rst No</th>
									<th>Vendor</th>
									<th>Gross Weight</th>
								</tr>
							</thead>
							<tbody id='pendingTable'></tbody>
						</table>
				</div>
				<div class="col-md-6">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="3" class="text-center">RST's Done</th>
								</tr>
								<tr>
									<th>Rst No</th>
									<th>Vendor</th>
									<th>Net Weight</th>
								</tr>
							</thead>
							<tbody id="completedTable"></tbody>
						</table>
				</div>
	</div>
</div>
</div>
</div>
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script>

function getReport(){
	
	url = "../processing/weighBridgeReport.jsp";
	if(window.XMLHttpRequest){  
		fetchRequest=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchRequest=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchRequest.onreadystatechange=getData;  
		console.log("AJAX Req sent");
		fetchRequest.open("GET",url,true);  
		fetchRequest.send();  
	}catch(e){alert("Unable to connect to server");}	
}

function getData(){
	if(fetchRequest.readyState == 4){
		var response = this.response.trim();
		var json = JSON.parse(response);
		var pendingArray = json.pendingReport;
		var completedArray = json.completedReport;
		setTableData('pendingTable', pendingArray)
		setTableData('completedTable', completedArray)
	}
}

function setTableData(tableId,array){
	
	var table = document.getElementById(tableId);
	table.innerHTML = "";
	var noOfRows = array.length;
	for(i=0; i<noOfRows; i++){
		rowIndex = table.rows.length;
		
		var row = table.insertRow(rowIndex);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		
		cell1.innerHTML = array[i].rst;
		cell2.innerHTML = array[i].customerName;
		if(array[i].hasOwnProperty('netWt')){
			cell3.innerHTML = array[i].netWt;
		}else if(array[i].hasOwnProperty('grossWt'))
		{
		    cell3.innerHTML = array[i].grossWt;
		}
	}
	
}
/***********************
Side bar 
************************/
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});
		
getReport();

</script>
</body>
</html>

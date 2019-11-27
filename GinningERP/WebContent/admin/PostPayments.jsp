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
<title>RTGS NEFT Payment Posting</title>
</head>
<body>

<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
	<div class="container-fluid ">
	 <div class="row mt-1 row-background border-bottom">
			<div class="col-md-12">
				<div class="d-flex justify-content-between align-items-center">
					<h4>RTSG/NEFT Report</h4>
				</div>
			</div>
		</div>
		
		 <div class="row  row-background border-bottom">
			<div class="col-md-3 d-flex justify-content-between align-items-center">
					<label>Date</label>
					<input type="date" class="form-control form-control-sm  ml-2" id="" name="" >
				</div>
				 
				<div class="col-md-5  d-flex justify-content-start align-items-center">
					<button type="button" class="btn btn-success btn-sm" id="">Print Report</button>
					<button type="button" class="btn btn-success btn-sm ml-2" id="">Post Payments</button>
				</div>
		</div>
		
		<div class="row  row-background">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th width="5%" class="text-center">Select</th>
							<th>Vendor Name</th>
							<th>Amount</th>
							<th>Bank Name</th>
							<th>Acount No</th>
							<th>IFSC Code</th>
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
		<script type="text/javascript" src="../js/1.8.3-jq.js"></script>
		<script src="../js/export/export2excel.js"></script>
    	<script>
    	function getReport(){
    		var url="../processing/getRtgsReport.jsp";
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
    		for(i=0; i<data.length; i++){
    			var noOfRows = table.rows.length;
    			var row = table.insertRow(noOfRows);
    			var cell1 = row.insertCell(0);
    			var cell2 = row.insertCell(1);
    			var cell3 = row.insertCell(2);
    			var cell4 = row.insertCell(3);
    			var cell5 = row.insertCell(4);
    			var cell6 = row.insertCell(5);
    			
    			cell1.className = "text-center";
    			
    			
    			cell1.innerHTML = '<input type="checkbox" id="selectEntryId" name="selectEntry" value="on">';
    			cell2.innerHTML = data[i].customerName;
    			cell3.innerHTML = data[i].rtgsAmount;
    			cell4.innerHTML = data[i].bankName;
    			cell5.innerHTML = data[i].accountNo;
    			cell6.innerHTML = data[i].ifsc;
    		}
    	}
		
		$(document).ready(function(){
			 $('input[name=selectEntry]').attr('checked',true);
		})
		
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
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
					<input type="date" class="form-control form-control-sm  ml-2" id="rtgsDate" name="rtgsDate" >
				</div>
				 
				<div class="col-md-5  d-flex justify-content-start align-items-center">
					<button type="button" class="btn btn-success btn-sm" id="">Print Report</button>
					<button type="button" class="btn btn-success btn-sm ml-2" id="submitPayments">Post Payments</button>
				</div>
		</div>
		
		<div class="row  row-background">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th width="5%" class="text-center">Select</th>
							<th>Invoice No</th>
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
	 
	 <form action='../processing/submitRtgsPayments.jsp' method='post'>
	 	<input type="hidden" id="output" name='output' />
	 </form>
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
    			var cell7 = row.insertCell(6);
    			var cell8 = row.insertCell(7);
    			var cell9 = row.insertCell(8);
    			var cell10 = row.insertCell(9);
    			var cell11 = row.insertCell(10);
    			var cell12 = row.insertCell(11);
    			
    			cell8.hidden = true;
    			cell9.hidden = true;
    			cell10.hidden = true;
    			cell11.hidden = true;
    			cell12.hidden = true;
    			cell1.className = "text-center";
    			
    			
    			cell1.innerHTML = '<input type="checkbox" id="selectEntryId" name="selectEntry" value="on">';
    			cell2.innerHTML = data[i].invoiceNo;
    			cell3.innerHTML = data[i].customerName;
    			cell4.innerHTML = data[i].rtgsAmount;
    			cell5.innerHTML = data[i].bankName;
    			cell6.innerHTML = data[i].accountNo;
    			cell7.innerHTML = data[i].ifscCode;
    			cell8.innerHTML = data[i].invoiceId;
    			cell9.innerHTML = data[i].companyId;
    			cell10.innerHTML = data[i].bankId;
    			cell11.innerHTML = data[i].customerId;
    			cell12.innerHTML = data[i].id;
    		}
    	}
    	
    	
    	/***********************************************************/
    	//get data from table
    	function createJsonObjects(){
    		var table = document.getElementById('tableBody');
    		var noOfRows = table.rows.length;
    		var jsonArr = [];
    		for(i=0; i<noOfRows; i++){
    			if(table.rows[i].cells[0].children[0].checked){
    				var json = {};
    				json.customerId = table.rows[i].cells[10].innerHTML;
    				json.rtgsAmount = table.rows[i].cells[3].innerHTML;
    				json.rtgsDate = document.getElementById('rtgsDate').value;
    				json.invoiceNo = table.rows[i].cells[1].innerHTML;
    				json.companyId = table.rows[i].cells[8].innerHTML;
    				json.bankId = table.rows[i].cells[9].innerHTML;
    				json.rtgsId = table.rows[i].cells[11].innerHTML;
    				jsonArr.push(json);
    			}
    		}
    		return jsonArr;
    	}
    	
    	document.getElementById('submitPayments').addEventListener('click',function(e){
    		var arr = createJsonObjects();
    		var output = JSON.stringify(arr);
    		document.getElementById('output').value = output;
    		document.getElementsByTagName('form')[0].submit();
    	});
    	
		
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
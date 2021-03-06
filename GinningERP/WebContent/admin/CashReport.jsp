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
	 	<div class="row row-background">
			<div class="col-md-12">
					<h4 class="lbl-rm-all">Cash Report</h4>
			</div>
			</div>
			<%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
		<div class="row  row-background">
			<div class="col-md-12">
				<table class="table table-bordered" id="table">
					<thead>
						<tr>
							<th>Vendor Name</th>
							<th>Invoice No</th>
							<th>Invoice Date</th>
							<th>Amount</th>
							<th>Voucher No.</th>
							<th hidden>Invoice ID</th>
							<th hidden>Company ID</th>
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
	<script type="text/javascript" src="../js/1.8.3-jq.js"></script>
	<script src="../js/export/export2excel.js"></script>
    <script src="../js/Validation.js"></script>
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
         	filename: "Cash_Report_"+getCurrentDate()+".xls"
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
			var cell8 = row.insertCell(7);
			
			//cell6.hidden = true;
			cell6.hidden = true;
			cell8.hidden = true;
			cell7.align = "center";
			
			cell1.innerHTML = data[i].vendorName;
			cell2.innerHTML = data[i].invoiceNo;
			cell3.innerHTML = data[i].invoiceDate;
			cell4.innerHTML = data[i].amount;
			cell5.innerHTML = data[i].cashVoucherNo;
			cell6.innerHTML = data[i].invoiceId;
			cell7.innerHTML = '<img src="../property/img/delete.png" alt="deleteRow" >';
			cell8.innerHTML = data[i].companyId;
		}
	}
	
	document.addEventListener("click", function(e){
		if(e.srcElement.alt === 'deleteRow'){
			var table = document.getElementById('tableBody');
			var rowIndex = e.srcElement.parentNode.parentNode.rowIndex-2;
			var invoiceId = table.rows[rowIndex].cells[5].innerHTML;
			var customerName = table.rows[rowIndex].cells[0].innerHTML;
			$.fn.confirmDelete(1,"Do you want to delete cash for "+ customerName+"  ?");
			$("#response-button1").click(function(){
				deleteCash(invoiceId);
			})
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
	
	$("#cancel-button1").click(function(){
		location.reload();
	})
	
	getReport();
	
	function dateFilter(){
        var startDate = (dates.convert(document.getElementById('startDate').value)).toDateString();
        var endDate = (dates.convert(document.getElementById('endDate').value)).toDateString();
        var companyId = document.getElementById('companyId').value;
		
        if(companyId === "Select"){
        	alert("Please Select Company.");
        }else{
			var tableBody = document.getElementById("tableBody");
	        for(i=0;i<tableBody.rows.length;i++){
	        	var date = tableBody.rows[i].cells[2].innerHTML;
	        	var id = tableBody.rows.item(i).cells[7].innerHTML;
	        	var d = (dates.convert(date)).toDateString();
	        	
	        	if(companyId != 0){
			        if(dates.inRange (d,startDate,endDate) && companyId === id ){
			        	tableBody.rows.item(i).hidden = false;
			        }else if(!dates.inRange (d,startDate,endDate) || companyId != id){
			        	tableBody.rows.item(i).hidden = true;
			        }else{
			        	alert('Choose proper dates from the filters.')
			        }
	        	}else if(Number(companyId) === 0){
			        if(dates.inRange (d,startDate,endDate)){
			        	tableBody.rows.item(i).hidden = false;
			        }else if(!dates.inRange (d,startDate,endDate)){
			        	tableBody.rows.item(i).hidden = true;
			        }else{
			        	alert('Choose proper dates from the filters.')
			        }
	        	}
	        }
        }
	}
	
	
	var dates = {
		    convert:function(d) {
		        // Converts the date in d to a date-object. The input can be:
		        //   a date object: returned without modification
		        //  an array      : Interpreted as [year,month,day]. NOTE: month is 0-11.
		        //   a number     : Interpreted as number of milliseconds
		        //                  since 1 Jan 1970 (a timestamp) 
		        //   a string     : Any format supported by the javascript engine, like
		        //                  "YYYY/MM/DD", "MM/DD/YYYY", "Jan 31 2009" etc.
		        //  an object     : Interpreted as an object with year, month and date
		        //                  attributes.  **NOTE** month is 0-11.
		        return (
		            d.constructor === Date ? d :
		            d.constructor === Array ? new Date(d[0],d[1],d[2]) :
		            d.constructor === Number ? new Date(d) :
		            d.constructor === String ? new Date(d) :
		            typeof d === "object" ? new Date(d.year,d.month,d.date) :
		            NaN
		        );
		    },
		    compare:function(a,b) {
		        // Compare two dates (could be of any type supported by the convert
		        // function above) and returns:
		        //  -1 : if a < b
		        //   0 : if a = b
		        //   1 : if a > b
		        // NaN : if a or b is an illegal date
		        // NOTE: The code inside isFinite does an assignment (=).
		        return (
		            isFinite(a=this.convert(a).valueOf()) &&
		            isFinite(b=this.convert(b).valueOf()) ?
		            (a>b)-(a<b) :
		            NaN
		        );
		    },
		    inRange:function(d,start,end) {
		        // Checks if date in d is between dates in start and end.
		        // Returns a boolean or NaN:
		        //    true  : if d is between start and end (inclusive)
		        //    false : if d is before start or after end
		        //    NaN   : if one or more of the dates is illegal.
		        // NOTE: The code inside isFinite does an assignment (=).
		       return (
		            isFinite(d=this.convert(d).valueOf()) &&
		            isFinite(start=this.convert(start).valueOf()) &&
		            isFinite(end=this.convert(end).valueOf()) ?
		            start <= d && d <= end :
		            NaN
		        );
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
	</script>
</body>
</html>
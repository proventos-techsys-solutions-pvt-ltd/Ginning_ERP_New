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

<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
	<div class="container-fluid ">
	<%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
	 <div class="row  row-background border-bottom">
			<div class="col-md-12 ">
					<h4 id="report-title" class="lbl-rm-l"></h4>
			</div>
			</div>
		
	 	<div class="row row-background">
	 		<div class="col-md-12">
	 		<input type="hidden" name="jsonOutput" id="jsonOutput" value='<%= session.getAttribute("jsonArray") %>' />
	 		<% session.removeAttribute("jsonArray"); %>
	 			<table id="tblPdcReport" class="table table-bordered">
	 				<thead>
	 					<tr>
	 					<th hidden>ID</th>
	 					<th hidden>company ID</th>
	 					<th>Sr No</th>
	 					<th>Invoice No</th>
	 					<th>Vendor Name</th>
	 					<th>Amount</th>
	 					<th>Payment Date</th>
	 					<th>Mode of Payment</th>
	 					</tr>
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
    	
    	setTitle("Post Payments Register");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		

   	 //*********************Search 
	        $(document).ready(function(){
	          $("#searchInput").on("keyup", function() {
	            var value = $(this).val().toLowerCase();
	            $("#tableBody tr").filter(function() {
	              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	            });
	          });
	        });
		
		
		function getCurrentDate(){
			var today = new Date();
			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
			var time = today.getHours()+ "_" + today.getMinutes()+ "_" + today.getSeconds();
			var dateTime = date+'_'+time;
			return dateTime;
		}
		
		function Export() {
            $("#tblPdcReport").export2excel({
            	filename: "PDC_Report_"+getCurrentDate()+".xls"
            });
        }
	
	 document.getElementById("exportToExcel").addEventListener("click",function(){
			Export();
			})
		
		
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
			table.innerHTML = "";
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
				
				cell1.innerHTML = data[i].pdcId;
				cell2.innerHTML = data[i].companyId;
				cell3.innerHTML = (i+1);
				cell4.innerHTML = data[i].invoiceNo;
				cell5.innerHTML = data[i].customerName;
				cell6.innerHTML = data[i].amount;
				cell7.innerHTML = data[i].payDate;
				cell8.innerHTML = data[i].modeOfPayment;
				
				cell1.hidden = true;
				cell2.hidden = true;
				
			}
		}
		
		
		function dateFilter(){

	        var startDate = (dates.convert(document.getElementById('startDate').value)).toDateString();
	        var endDate = (dates.convert(document.getElementById('endDate').value)).toDateString();
	        var companyId = document.getElementById('companyId').value;
	        if(companyId === "Select"){
	        	alert("Please Select Company.");
	        }else{
				var tableBody = document.getElementById("tableBody");
		        for(i=0;i<tableBody.rows.length;i++){
		        	var date = tableBody.rows[i].cells[6].innerHTML;
		        	var id = tableBody.rows.item(i).cells[1].innerHTML;
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
		
		
		
		getPdcReport();
		
		
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
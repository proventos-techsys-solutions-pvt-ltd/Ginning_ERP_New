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
<title>Weighment  Report</title>
</head>

<body>

<%@include file="../admin/Top_Nav.jsp" %>
	<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	 
	 <div class="row mt-2 row-background border-bottom">
			<div class="col-md-12 ">
					<h4 id="report-title" class="lbl-rm-l"></h4>
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
					<button type="button" class="btn btn-success btn-sm" id="dateFilterButton" onclick="dateFilter()">Filter</button>
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
	 			<table id="tblWeighBridgeReport" class="table table-bordered">
	 				<thead>
	 					<tr>
		 					<th hidden>Id</th>
		 					<th>Sr No</th>
		 					<th>RST</th>
		 					<th>Vendor Name</th>
		 					<th>Mobile</th>
		 					<th>Date</th>
		 					<th>Vehicle No.</th>
		 					<th>Vehicle Name</th>
		 					<th>Gross Wt. (Kgs)</th>
		 					<th>Net Wt. (Kgs)</th>
		 					<th>WB Operator</th>
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
    	setTitle("Weigh Bridge Report");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		
		function getCurrentDate(){
			var today = new Date();
			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
			var time = today.getHours()+ "_" + today.getMinutes()+ "_" + today.getSeconds();
			var dateTime = date+'_'+time;
			return dateTime;
		}
		
		 function Export() {
	            $("#tblWeighBridgeReport").export2excel({
	            	filename: "Weigh_Bridge_Report_"+getCurrentDate()+".xls"
	            });
	        }
		
		 document.getElementById("exportToExcel").addEventListener("click",function(){
				Export();
				})
		
		function getWeighBridgeReport(){
			
			var url="${pageContext.request.contextPath}/processing/getWeighBridgeReport.jsp";
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
				var cell10 = row.insertCell(9);
				var cell11 = row.insertCell(10);
				
				cell1.innerHTML = data[i].wmId;
				cell2.innerHTML = (i+1);
				cell3.innerHTML = data[i].rst;
				cell4.innerHTML = data[i].vendorName;
				cell5.innerHTML = data[i].vendorMobile;
				cell6.innerHTML = data[i].weighDate;
				cell7.innerHTML = data[i].vehicleNo;
				cell8.innerHTML = data[i].vehicleName;
				cell9.innerHTML = data[i].gross;
				cell10.innerHTML = data[i].net;
				cell11.innerHTML = data[i].wbOperator;
				
				cell1.hidden = true;
				
			}
		}
		
		function dateFilter(){

	        var startDate = (dates.convert(document.getElementById('startDate').value)).toDateString();
	        var endDate = (dates.convert(document.getElementById('endDate').value)).toDateString();
	        
			var tableBody = document.getElementById("tableBody");
			for(i=0;i<tableBody.rows.length;i++){
				tableBody.rows.item(i).removeAttribute('hidden');
			}

	        for(i=0;i<tableBody.rows.length;i++){
	        	var date = tableBody.rows[i].cells[5].innerHTML;
	        	var d = (dates.convert(date)).toDateString();
		        if(dates.inRange (d,startDate,endDate)){
		        	tableBody.rows.item(i).hidden = false;
		        }else if(!dates.inRange (d,startDate,endDate)){
		        	tableBody.rows.item(i).hidden = true;
		        }else{
		        	alert('Choose proper dates from the filters.')
		        }
	        }
		} 
		
		getWeighBridgeReport();
		
		
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
		
    	</script>
</body>
</html>
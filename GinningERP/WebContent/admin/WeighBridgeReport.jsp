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
					<div class="d-flex justify-content-start align-items-center">
						<div class="c-nav-collapse" onclick="myFunction(this)">
						  <div class="bar1"></div>
						  <div class="bar2"></div>
						  <div class="bar3"></div>
						</div>
						&nbsp;&nbsp;
					<h4 id="report-title" class="lbl-rm-l"></h4>
					</div>
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
		 					<th>Delete</th>
		 					<th>Reset Weight</th>
	 					</tr>
	 				</thead>
	 				<tbody id="tableBody">
	 				</tbody>
	 			</table>
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
	 
	 
	 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="../js/export/export2excel.js"></script>
		<script src="../js/Validation.js"></script>
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
				var cell12 = row.insertCell(11);
				var cell13 = row.insertCell(12);
				
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
				cell12.innerHTML = '<img src="../property/img/delete.png" alt="delete">';
				cell13.innerHTML = '<img src="../property/img/delete.png" alt="resetWeight">';
				
				cell1.hidden = true;
				cell12.className="text-center";
				cell13.className="text-center";
				
			}
		}
		
		function resetWeight(rst){
			var url="${pageContext.request.contextPath}/processing/resetWeight.jsp?rst="+rst;
			if(window.XMLHttpRequest){  
				resetWtReq=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				resetWtReq=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				resetWtReq.onreadystatechange=resetWtResponse;  
				console.log("AJAX Req sent");
				resetWtReq.open("GET",url,true);  
				resetWtReq.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function resetWtResponse(){
			if(resetWtReq.readyState === 4){
				var response = this.response.trim();
				console.log("Response --"+response)
				if(Number(response) === 4){
					$.fn.checkStatus(1,"Tare and Net Weight is reset.");
				}else if(Number(response) === 3){
					$.fn.checkStatus(1,"Gross Weight is reset");
				}else if(Number(response) === 2){
					$.fn.checkStatus(1,"Gross Weight is already 0.");
				}else if(Number(response) === 1){
					$.fn.checkStatus(1,"Cannot reset weights as Grading is done, Please delete Grade Entries.");
				}else if(Number(response) === 0){
					$.fn.checkStatus(1,"RST does not exist in Weighment data.");
				}
				//location.reload();
			}
		}
		
		document.addEventListener('click', function(e){
			if(e.srcElement.alt === 'resetWeight'){
				var table = document.getElementById('tableBody');
				var rowIndex = e.srcElement.parentNode.parentNode.rowIndex - 1;
				var rst = table.rows[rowIndex].cells[2].innerHTML;
				resetWeight(rst);
			}
		});
		
		function deleteRst(rst){
			var url="${pageContext.request.contextPath}/processing/deleteWeighment.jsp?rst="+rst;
			if(window.XMLHttpRequest){  
				deleteWtReq=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				deleteWtReq=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try{  
				deleteWtReq.onreadystatechange=deleteWtResponse;  
				console.log("AJAX Req sent");
				deleteWtReq.open("GET",url,true);  
				deleteWtReq.send();  
			}catch(e){alert("Unable to connect to server");} 
		}
		
		function deleteWtResponse(){
			if(deleteWtReq.readyState == 4){
				var response = this.response.trim();
				if(Number(response) === 1){
					$.fn.checkStatus(1,"Weighment Entry deleted successfully.");
				}else if(Number(response) === 0){
					$.fn.checkStatus(1,"Grading is done for this RST, please delete the Grade Entry first.");
				}
				//location.reload();
			}
		}
		
		document.addEventListener('click',function(e){
			if(e.srcElement.alt === 'delete'){
				var table = document.getElementById('tableBody');
				var rowIndex = e.srcElement.parentNode.parentNode.rowIndex - 1;
				var rst = table.rows[rowIndex].cells[2].innerHTML;
				deleteRst(rst);
			}
		});
		
		
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
		/**************************************
		Search in table
		**************************************/
		        $(document).ready(function(){
		          $("#searchInput").on("keyup", function() {
		            var value = $(this).val().toLowerCase();
		            $("#tableBody tr").filter(function() {
		              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		            });
		          });
		        });
		/*************************************
		Export in excel
		**************************************/
		 function Export() {
            $("#tblWeighBridgeReport").export2excel({
            	filename: "Weigh_Bridge_Report_"+getCurrentDate()+".xls"
            });
        }
		$(document).ready(function(){
			$("#exportToExcel").click(function(){
				Export();
			})
		})
		/**************************************
		Response window code
		**************************************/
		var sessionId = {
				"getSessionId":<%=session.getAttribute("") %>,
		}
		$(document).ready(function(){
			$.fn.checkStatus(sessionId.getSessionId,"Ledger has been created successfully!")
		})
		
		function myFunction(x) {
	  		x.classList.toggle("change");
		}
		
		$(document).ready(function(){
			$(".c-nav-collapse").click(function(){
					$(".sidebar").toggle(); 
					if($(".sidebar").css("display")==="none"){
						$(".row").css("margin-left","10px"); 
					}else{
						$(".row").css("margin-left","225px"); 
					}
					
			})
		})
		<% session.removeAttribute("");%>
    	</script>
</body>
</html>
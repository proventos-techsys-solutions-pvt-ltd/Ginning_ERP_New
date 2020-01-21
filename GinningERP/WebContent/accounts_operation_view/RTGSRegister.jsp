<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="../styles/bootstrap.min.css">
      <link rel="stylesheet" href="../styles/WBStyle.css">
      <script src="${pageContext.request.contextPath}/js/3.4.1-jq.js"></script>
      <script src="${pageContext.request.contextPath}/js/3.2.1-jq.js"></script>
      <script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
      <title>RTGS NEFT Report]</title>
   </head>
   <body>
<%@include file="../accounts_operation_view/NavBar.jsp" %>   
	<div class="container-fluid ">
		 <%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
		<div class="row  row-background">
			<div class="col-md-12">
				<table class="table table-bordered" id="rtgsReportTable">
					<thead>
						<tr>
							<th width="5%" class="text-center">Sr. No.</th>
							<th>Invoice No</th>
							<th>Vendor Name</th>
							<th>Amount</th>
							<th>Bank Name</th>
							<th>Acount No</th>
							<th>IFSC Code</th>
							<th>RTGS Date</th>
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
	 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script type="text/javascript" src="../js/1.8.3-jq.js"></script>
		<script src="../js/export/export2excel.js"></script>
    	<script>
    	setTitle("RTGS NEFT Register");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
    	function getReport(){
    		var url="../processing/getRtgsReportsForCashier.jsp";
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
    		
    			
    			cell1.innerHTML = (i+1);
    			cell2.innerHTML = data[i].invoiceNo;
    			cell3.innerHTML = data[i].customerName;
    			cell4.innerHTML = data[i].rtgsAmount;
    			cell5.innerHTML = data[i].bankName;
    			cell6.innerHTML = data[i].accountNo;
    			cell7.innerHTML = data[i].ifsc;
    			cell8.innerHTML = data[i].rtgsDate;
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
    				json.rtgsDate = document.getElementById('transactionDate').value;
    				json.invoiceNo = table.rows[i].cells[1].innerHTML;
    				json.companyId = table.rows[i].cells[8].innerHTML;
    				json.bankId = table.rows[i].cells[9].innerHTML;
    				json.rtgsId = table.rows[i].cells[11].innerHTML;
    				jsonArr.push(json);
    			}
    		}
    		return jsonArr;
    	}
    	
		
		$(document).ready(function(){
			 $('input[name=selectEntry]').attr('checked',true);
		});
		
		function dateFilter(){

	        var startDate = (dates.convert(document.getElementById('startDate').value)).toDateString();
	        var endDate = (dates.convert(document.getElementById('endDate').value)).toDateString();
	        //var companyId = document.getElementById('companyId').value;
	        
			var tableBody = document.getElementById("tableBody");
	        for(i=0;i<tableBody.rows.length;i++){
	        	var date = tableBody.rows[i].cells[7].innerHTML;
	        	//var id = tableBody.rows.item(i).cells[8].innerHTML;
	        	var d = (dates.convert(date)).toDateString();
	        	
			        if(dates.inRange (d,startDate,endDate) ){
			        	tableBody.rows.item(i).hidden = false;
			        }else if(!dates.inRange (d,startDate,endDate)){
			        	tableBody.rows.item(i).hidden = true;
			        }else{
			        	alert('Choose proper dates from the filters.')
			        }
			        if(dates.inRange (d,startDate,endDate)){
			        	tableBody.rows.item(i).hidden = false;
			        }else if(!dates.inRange (d,startDate,endDate)){
			        	tableBody.rows.item(i).hidden = true;
			        }else{
			        	alert('Choose proper dates from the filters.')
			        }
	        }
		} 
		
		
		document.getElementById('print').addEventListener('click',function(e){
			Export();
		});
		
		document.getElementById('filterDate').addEventListener('click',function(e){
			dateFilter();
		})
		
		getReport();
		

		function getCurrentDate(){
			var today = new Date();
			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
			var time = today.getHours()+ "_" + today.getMinutes()+ "_" + today.getSeconds();
			var dateTime = date+'_'+time;
			return dateTime;
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
		
		/*************************************
		Export in excel
		**************************************/
		 function Export() {
            $("#rtgsReportTable").export2excel({
            	filename: "RTGS_Report_"+getCurrentDate()+".xls"
            });
        }
		$(document).ready(function(){
			$("#exportToExcel").click(function(){
				Export();
			})
		})
		
		
		
		
    	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/WBStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Pending Amanat</title>
</head>
<body>
<%@include file="NavBar.jsp" %>
	<div class="container-fluid ">
	 <%--include file="../admin/CommonSearchHeaderForReports.jsp" --%>
	 <div class="row  row-background border-bottom">
			<div class="col-md-12 ">
					<h4 id="report-title" class="lbl-rm-l">Pending Amanat</h4>
					</div>
	 </div>
	 <div class="row row-background">
			
			<div class="col-md-2">
				<label class="lbl-rm-all">Search</label>
				<input type="text" class="form-control form-control-sm " name="" id="searchInput" placeholder="">
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-success btn-sm lbl-rm-l" style="margin-top:31px;">Search</button>
 			</div>
			<div class="col-md-2" style="margin-left:-150px;">
				<label class="lbl-rm-all">From</label>
				<input type="date" class="form-control form-control-sm " name="" id="startDate">
 			</div>
 			<div class="col-md-2">
				<label class="lbl-rm-all">To</label>
				<input type="date" class="form-control form-control-sm" name="" id="endDate">
 			</div>
 			<div class="col-md-2">
				<button type="button" class="btn btn-sm btn-success" id="filter" style="margin-top:31px;" onclick="dateFilter()">Filter</button>
 			</div>
 			<div class="col-md-2">
				<img src="../property/img/exportexcel.png" alt="option" class="img-set" style="margin-top:31px;margin-left:-150px;" id="exportToExcel">
 			</div>
 			
			</div>
		<div class="mt-2"></div>
		<div class="row row-background">
			<div class="col-md-12">
			<div class="setHeight">
			<table id="tblPendingAmanat" class="table table-bordered">
				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>Date</th>
						<th>RST</th>
						<th>Vendor Name</th>
						<th>Difference from Super</th>
						<th>Quantity</th>
						<th>Print</th>
					</tr>
				</thead>
				<tbody id="tableBody">
				
				</tbody>
			</table>
			</div>
			</div>
		</div>
	</div>
        <script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script type="text/javascript" src="../js/1.8.3-jq.js"></script>
		<script src="../js/3.4.1-jq.js"></script>
		<script src="../js/Validation.js"></script>
		<script src="../js/export/export2excel.js"></script>
    	<script type="text/javascript">
        
      //*********************Search 
        $(document).ready(function(){
          $("#searchInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#tableBody tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
        
		</script>
		<script>
		setTitle("Pending Amanat");//Setting Title of Page
		setSearchPlaceholder("Search");//Setting Placeholder of Search Input
		
		
		window.onload = function() {
			amanatRequest();
			};
			
		
		/*	var documentHeight = (function(){
				var height = document.getElementsByTagName("html")[0].offsetHeight;
				document.getElementsByClassName("setHeight")[0].style.height = ((height*2)/3) + "px";
				document.getElementsByClassName("setHeight")[0].style.overflow = "auto";
			})();*/
			
			
			function amanatRequest(){
				url = "../processing/pendingAmanatReport.jsp";
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
				if(fetchRequest.readyState == 4)
					{
						var response = this.response.trim();
						var data = JSON.parse(response);
						setData(data);
					}
			}
			
			function setData(data){
				
				var table = document.getElementById("tableBody");
				
				for(i=0;i<data.length;i++){
					
					if(Number(data[i].quantity) != 0){
						var noOfRows = table.rows.length;
						var row = table.insertRow(noOfRows);
						
						var cell1 = row.insertCell(0);
						var cell2 = row.insertCell(1);
						var cell3 = row.insertCell(2);
						var cell4 = row.insertCell(3);
						var cell5 = row.insertCell(4);
						var cell6 = row.insertCell(5);
						var cell7 = row.insertCell(6);
						
						cell7.className = "text-center";
						
						cell1.innerHTML = noOfRows+1;
						cell2.innerHTML = data[i].amanatDate;
						cell3.innerHTML = data[i].rst;
						cell4.innerHTML = data[i].name;
						cell5.innerHTML = data[i].differenceFromSuper;
						cell6.innerHTML = data[i].quantity;
						cell7.innerHTML = "<a href='../report/AmanatReceipt.html?rstNo="+data[i].rst+"' target='_blank' ><img src='../property/img/printer.png' alt='Print'></a>"
					}
				}
			}
			

		function dateFilter(){

		        var startDate = (dates.convert(document.getElementById('startDate').value)).toDateString();
		        var endDate = (dates.convert(document.getElementById('endDate').value)).toDateString();
		        
				var tableBody = document.getElementById("tableBody");
		        for(i=0;i<tableBody.rows.length;i++){
		        	var date = tableBody.rows[i].cells[1].innerHTML;
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
			
			
	/**************************************
	Exporting report to excel
	**************************************/
    function Export() {
        $("#tblPendingAmanat").export2excel({
        	filename: "Pending_Amanat.xls"
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
			"getSessionId":<%=session.getAttribute("invoiceId") %>,
	}

	$(document).ready(function(){
	$.fn.checkStatus(sessionId.getSessionId,"Invoice has been successfully saved!")
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
	
	/***********************
Side bar 
************************/
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});
	
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
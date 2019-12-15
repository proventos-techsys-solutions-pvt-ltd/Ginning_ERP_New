<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Pending Amanat</title>
</head>
<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
	<div class="container-fluid ">
	 <%@include file="../admin/CommonSearchHeaderForReports.jsp" %>
		<div class="row row-background">
			<div class="col-md-12">
			<div class="setHeight">
			<table id="tblPendingAmanat" class="table table-bordered">
				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>Amanat No.</th>
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
						var cell8 = row.insertCell(7);
						
						cell7.className = "text-center";
						
						cell1.innerHTML = noOfRows+1;
						cell2.innerHTML = data[i].amanatNo;
						cell3.innerHTML = data[i].amanatDate;
						cell4.innerHTML = data[i].rst;
						cell5.innerHTML = data[i].name;
						cell6.innerHTML = data[i].differenceFromSuper;
						cell7.innerHTML = data[i].quantity;
						cell8.innerHTML = "<a href='../report/AmanatReceipt.html?rstNo="+data[i].rst+"' target='_blank' ><img src='../property/img/printer.png' alt='Print'></a>"
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
		</script>
</body>
</html>
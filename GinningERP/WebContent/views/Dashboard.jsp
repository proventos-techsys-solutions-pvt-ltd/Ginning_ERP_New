<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
	  <link rel="stylesheet" href="../chart/package/dist/Chart.js">
	  
        <title>Dashboard</title>
    </head>
<body>
   <%@include file="../views/NavBar.html" %>
        <div class="container-fluid">
             <div class="row mt-2 tile-background-row">
                	<div class="col-md-6">
                		<div class="d-flex justify-content-center ">
                        	<h4 class="lbl-rm-all">Today's Purchase Rate</h4>&nbsp;
                        	<h4 id="tRate"></h4>
                        </div>
                    </div>
                	<div class="col-md-6">
                		<div class="d-flex justify-content-center ">
							<h4 class="lbl-rm-all">Average Purchase Rate</h4>&nbsp;
							<h4 id="aRate"></h4>
                    	</div>
                    </div>   
                </div>
                
             <div class="row mt-2 tile-background-row">
             	<div class="col-md-2">
             		<label class="lbl-rm-l">Company</label>
             		<select class="form-control form-control-sm" id="companyId">
             			<option disabled selected>Selected</option>
             			<c:Company />
             		</select>
             	</div>
             		<div class="col-md-2">
             		<label class="lbl-rm-l">Range</label>
             		<select class="form-control form-control-sm">
             			<option value="">Today's </option>
             			<option value="">Month</option>
             			<option value="">Year</option>
             		</select>
             	</div>
             </div>
             <div class="row tile-background-row">
             	<div class="col-md-6">
             		<canvas id="myChart"></canvas>
             	</div>
             </div>
                
            </div>
        <script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../chart/package/dist/Chart.js" ></script>
		<script src="../chart/package/dist/Chart.bundle.js" ></script>
		<script>

		document.addEventListener('change', function(e){
			if(e.srcElement.id === 'companyId'){
				getStockReport(e.srcElement.options[e.srcElement.selectedIndex].value);
			}
		})
		
		function getStockReport(companyId){
			var url="../processing/getTodaysStockReport.jsp?companyId="+companyId;
			if(window.XMLHttpRequest){  
				fetchStock=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchStock=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchStock.onreadystatechange=fetchData;  
				console.log("AJAX Req sent");
				fetchStock.open("GET",url,true);  
				fetchStock.send();  
			}catch(e){alert("Unable to connect to server");}
		}

		 function fetchData(){
			 if(fetchStock.readyState == 4){
				 setData(this.response.trim());
			 }
		 }

		 
		 function setData(data){
			 
			 var obj = JSON.parse(data);
			 console.log(obj);
			 
			 var canvas = document.getElementById("myChart");
			 var ctx = canvas.getContext('2d');

			 // Global Options:
			  Chart.defaults.global.defaultFontColor = 'black';
			  Chart.defaults.global.defaultFontSize = 16;

			 var data = {
			     labels: ["Cotton Bales", "Cotton Seeds", "Oil", "Cotton Cake"],
			       datasets: [
			         {
			             fill: true,
			             backgroundColor: [
			                 'black',
			                 'white',
			                 'green',
			                 'orange'],
			             data: [obj.closingStock.cottonBales,obj.closingStock.cottonSeed,obj.closingStock.cottonSeedOil,obj.closingStock.cottonCakes],
			 // Notice the borderColor 
			             borderColor:	['black', 'black','black','black'],
			             borderWidth: [2,2,2,2]
			         }
			     ]
			 };

			 // Notice the rotation from the documentation.
			 var options = {
			         title: {
			                   display: true,
			                   text: 'Stock Details',
			                   position: 'top'
			               },
			         rotation: -0.7 * Math.PI
			 };


			 // Chart declaration:
			 var myBarChart = new Chart(ctx, {
			     type: 'pie',
			     data: data,
			     options: options
			 });
				
				document.getElementById('aRate').innerHTML = obj.closingStock.avgRate;
				
				var tRate = document.getElementById("tRate").innerHTML;
				var aRate = document.getElementById("aRate").innerHTML;
				if(tRate > aRate){
					document.getElementById("aRate").style.background = "green";
					document.getElementById("aRate").style.color = "#fff";
				}else{
					document.getElementById("aRate").style.background = "red";	
					document.getElementById("aRate").style.color = "#fff";
				}
		 }
		
		getTodayCottonRate();
		
		function getTodayCottonRate(){
			var url="../processing/getTodaysSuperRate.jsp";
			if(window.XMLHttpRequest){  
				fetchCottonRate=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchCottonRate=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchCottonRate.onreadystatechange=fetchRate;  
				console.log("AJAX Req sent");
				fetchCottonRate.open("GET",url,true);  
				fetchCottonRate.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function fetchRate(){
			 if(fetchCottonRate.readyState == 4){
				var response = this.response.trim();
				console.log(response);
				var data = JSON.parse(response);
				document.getElementById('tRate').innerHTML = data['rate'];
			 }
		 }
		
		</script>
		
		
      </body>
</html>
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
                        	<h4 id="tRate">330</h4>
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
             	<div class="col-md-6">
             		<canvas id="myLineChart"></canvas>
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
				 //console.log(this.response.trim());
			 }
		 }

		 
		 function setData(data){
			 
			 var obj = JSON.parse(data);
			 console.log(obj);
			
			 var ctx = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(ctx, {
				    type: 'bar',
				    data: {
				        labels: ['Cotton Bales', 'Cotton Seeds', 'Oil', 'Cotton Cake'],
				        datasets: [{
				            label: 'Quantity in Quintals',
				            data: [obj.closingStock.cottonBales, obj.closingStock.cottonSeed, obj.closingStock.cottonSeedOil, obj.closingStock.cottonCakes],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
				});
				
				/********LINE CHART*********/
				var ctx = document.getElementById('myLineChart').getContext('2d');
				var myLineChart = new Chart(ctx, {
				    type: 'line',
				    data: {
				        labels: ['Cotton Bales', 'Cotton Seeds', 'Oil', 'Cotton Cake'],
				        datasets: [{
				            label: 'Rupees',
				            data: [obj.closingStock.cottonBales, obj.closingStock.cottonSeed, obj.closingStock.cottonSeedOil, obj.closingStock.cottonCakes],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options:{
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
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
		
		
		
		
		
		
		</script>
		
		
      </body>
</html>
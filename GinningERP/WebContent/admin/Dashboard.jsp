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
<title>Dashboard</title>
</head>

<body>

<%@include file="../admin/Top_Nav.html" %>
<div class="container-fluid container-mr-t">
	  <%@include file="../admin/Side_bar.html" %>
	  <div class="row row-background">
	  	<div class="col-md-12">
	  		<h4>Dashboard</h4>
	  	</div>
	  </div>
	  
	  
	  <div class="row row-background">
	  	<div class="col-md-3">
	  			<div class="d-flex justify-content-between align-items-center inner border">
	  				<div>
	  					Today's Rate
	  				</div>
	  				<div>
	  					<i class="fa fa-inr" aria-hidden="true" id="tRate">&nbsp;&nbsp;10000</i>
	  				</div>
	  			</div>
	  	</div>
	  	<div class="col-md-3">
	  			<div class="d-flex justify-content-between align-items-center inner1 border">
	  				<div>
	  					Average Rate
	  				</div>
	  				<div>
	  					<i class="fa fa-inr" aria-hidden="true" id="aRate">&nbsp;&nbsp;10000</i>
	  				</div>
	  			</div>
	  	</div>
	  	<div class="col-md-3">
	  			<div class="d-flex justify-content-between align-items-center inner2 border">
	  				<div>
	  					Total Purchase 
	  				</div>
	  				<div>
	  					<i class="fa fa-inr" aria-hidden="true">&nbsp;&nbsp;10000</i>
	  				</div>
	  			</div>
	  	</div>
	  	<div class="col-md-3">
	  			<div class="d-flex justify-content-between align-items-center inner3 border">
	  				<div>
	  					Financial Year	
	  				</div>
	  				<div>
	  					2019-20
	  				</div>
	  			</div>
	  	</div>
	  </div>
	  
	  
           <div class="row row-background border-top">
             	<div class="col-md-2">
             		<label class="lbl-rm-l">Company</label>
             		<select class="form-control form-control-sm" id="companyId">
             			<option value="0" selected>All</option>
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
             <div class="row row-background">
             	<div class="col-md-8">
             		<canvas id="myChart"></canvas>
             	</div>
             	<div class="col-md-4">
             		<div class="notification-frame border">
             			<div class="notification border">Active Users</div>
             			<div class="notification-panel border">
             				<table class="table">
             					<thead>
             						<tr>
             							<th>Username</th>
             							<th>Status</th>
             						</tr>
             					</thead>
             					<tbody>
             						<tr>
             							<td>Ameya Pagore</td>
             							<td>Active</td>
             						</tr>
             							<tr>
             							<td>Ameya Pagore</td>
             							<td>Active</td>
             						</tr>
             							<tr>
             							<td>Ameya Pagore</td>
             							<td>Active</td>
             						</tr>
             							<tr>
             							<td>Ameya Pagore</td>
             							<td>Active</td>
             						</tr>
             					</tbody>
             				</table>
             			</div>
             		</div>
             		<div></div>
             	</div>
             </div>
                
         
</div>

<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../chart/package/dist/Chart.js" ></script>
<script src="../chart/package/dist/Chart.bundle.js" ></script>
	<script>

		getStockReport(0);
		
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
			             borderColor: ['black', 'black','black','black'],
			             borderWidth: [2,2,2,2]
			         }
			     ]
			 };

			 // Notice the rotation from the documentation.
			 var options = {
			         title: {
			                   display: true,
			                   text: 'Stock Details',
			                   position: 'bottom'
			               },
			         rotation: -0.7 * Math.PI
			 };


			 // Chart declaration:
			 var myBarChart = new Chart(ctx, {
			     type: 'pie',
			     data: data,
			     options: options
			 });
		 }
		
		
		/* function getAverageRate(){
			var tRate = document.getElementById("tRate").innerHTML.trim();
			var aRate = document.getElementById("aRate").innerHTML.trim();
			console.log(tRate+"----------"+aRate);
			if(Number(tRate) > Number(aRate)){
				document.getElementById("aRate").style.background = "green";
				document.getElementById("aRate").style.color = "#fff";
			}else{
				document.getElementById("aRate").style.background = "red";	
				document.getElementById("aRate").style.color = "#fff";
			}
		} */
		
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
				document.getElementById('tRate').innerHTML = data['superRate'];
				document.getElementById('aRate').innerHTML = data['averageRate'];
				//getAverageRate();
			 }
		 }
		
		getTodayCottonRate();
		
		
		</script>
</body>
</html>

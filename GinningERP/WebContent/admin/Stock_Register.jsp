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
<title>Stock Register</title>
</head>

<body>

<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	 	<div class="row row-background border-bottom">
			<div class="col-md-12">
			<div class="d-flex justify-content-between align-content-center row-background">
				<div class="d-flex justify-content-start align-content-center row-background">
					<img src="../property/img/stock.png" alt="Stock">&nbsp; &nbsp;
					<h4 class="lbl-rm-all">Stock Register</h4>
				</div>
				<div class="d-flex justify-content-start align-content-center row-background">
					<button type="button" class="btn btn-success btn-sm" hidden>Print Report</button>
				</div>
			</div>
			</div>
			</div>
			<div class="row row-background border-bottom">
			<div class="col-md-5">
					<label>Company:</label>
					<select class="form-control form-control-sm " id="companyId" name="companyId" onchange="">
		        	    <option selected disabled>Select</option>
		        	    <option value="0">All</option>
		        	 	<c:Company />
	        	    </select>
			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Lint
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="balesOpening" name="balesOpening">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="balesAddition" name="balesAddition">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="balesClosing" name="balesClosing">
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Seed
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="seedOpening" name="seedOpening">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="seedAddition" name="seedAddition">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="seedClosing" name="seedClosing">
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Oil
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="oilOpening" name="oilOpening">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="oilAddition" name="oilAddition">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="oilClosing" name="oilClosing">
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stock-block-heading d-flex justify-content-center align-items-center">
					Cotton Cake
				</div>
				<div class="stock-block-content d-flex justify-content-center align-items-center">
					<div class="stock-block-contents">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm " id="cakeOpening" name="cakeOpening">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Addition</label>
						<input type="text" class="form-control form-control-sm " id="cakeAddition" name="cakeAddition">
					</div>
					<div class="stock-block-contents ml-1">
						<label>Closing Balance</label>
						<input type="text" class="form-control form-control-sm" id="cakeClosing" name="cakeClosing">
					</div>
				</div>
			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-12">
				<table class="table table-bordered ">
					<thead>
						<tr>
							<th>Date</th>
							<th>Particulars</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class='date'></td>
							<td>Cotton</td>
							<td id="cottonStock"></td>
						</tr>
						<tr>
							<td class='date'></td>
							<td>Cotton Bales</td>
							<td id="balesStock"></td>
						</tr>
						<tr>
							<td class='date'></td>
							<td>Cotton Seed</td>
							<td id="seedStock"></td>
						</tr>
						<tr>
							<td class='date'></td>
							<td>Cotton Seed Oil</td>
							<td id=oilStock></td>
						</tr>
						<tr>
							<td class='date'></td>
							<td>Cotton Cakes</td>
							<td id="cakesStock"></td>
						</tr>
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
			
			 document.getElementById('balesOpening').value = obj.openingStock.cottonBales;
			 document.getElementById('balesAddition').value = obj.stockAddition.cottonBales;
			 document.getElementById('balesClosing').value = obj.closingStock.cottonBales;
			 
			 document.getElementById('seedOpening').value = obj.openingStock.cottonSeed;
			 document.getElementById('seedAddition').value = obj.stockAddition.cottonSeed;
			 document.getElementById('seedClosing').value = obj.closingStock.cottonSeed;
			 
			 document.getElementById('oilOpening').value = obj.openingStock.cottonSeedOil;
			 document.getElementById('oilAddition').value = obj.stockAddition.cottonSeedOil;
			 document.getElementById('oilClosing').value = obj.closingStock.cottonSeedOil;
			 
			 document.getElementById('cakeOpening').value = obj.openingStock.cottonCakes;
			 document.getElementById('cakeAddition').value = obj.stockAddition.cottonCakes;
			 document.getElementById('cakeClosing').value = obj.closingStock.cottonCakes;
			 
			 document.getElementById('cottonStock').innerHTML = obj.stockAddition.rawCotton;
			 document.getElementById('balesStock').innerHTML = obj.stockAddition.cottonBales;
			 document.getElementById('seedStock').innerHTML = obj.stockAddition.cottonSeed; 
			 document.getElementById('oilStock').innerHTML = obj.stockAddition.cottonSeedOil;	
			 document.getElementById('cakesStock').innerHTML = obj.stockAddition.cottonCakes;
			 
			 for(i=0;i<document.getElementsByClassName('date').length;i++){
			 	document.getElementsByClassName('date')[i].innerHTML = obj.stockAddition.stockDate;
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
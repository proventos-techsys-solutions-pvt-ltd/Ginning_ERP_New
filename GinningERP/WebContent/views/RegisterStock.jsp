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
      <title>Stock Register</title>
    </head>
<body>
   <%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-12">
			<div class="d-flex justify-content-between align-content-center tile-background-row">
				<div class="d-flex justify-content-start align-content-center tile-background-row">
					<img src="../property/img/stock.png" alt="Stock">&nbsp; &nbsp;
					<h4 class="lbl-rm-all">Stock Register</h4>
				</div>
				<div class="d-flex justify-content-start align-content-center tile-background-row">
					<button type="button" class="btn btn-success btn-sm">Print Report</button>
				</div>
			</div>
			</div>
			</div>
			<div class="row mt-2">
			<div class="col-md-12">
			<div class="d-flex justify-content-between align-content-center tile-background-row">
				<div class="d-flex justify-content-start align-content-center tile-background-row">
					<label>Company:</label>
					<select class="form-control form-control-sm " id="companyId" name="companyId" onchange="">
		        	    <option selected disabled>Select</option>
		        	 	<c:Company />
	        	    </select>
				</div>
			</div>
			</div>
		</div>
		<div class="row mt-2">
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
		<div class="row mt-2">
			<div class="col-md-12">
				<table class="table table-bordered tile-background-row">
					<thead>
						<tr>
							<th>Date</th>
							<th>Particulars</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>05/01/2019</td>
							<td>Cotton</td>
							<td>1000 kg</td>
						</tr>
						<tr>
							<td>05/01/2019</td>
							<td>Cotton</td>
							<td>1000 kg</td>
						</tr>
						<tr>
							<td>05/01/2019</td>
							<td>Cotton</td>
							<td>1000 kg</td>
						</tr>
					</tbody>
				</table>
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
				getStockReport(e.srcElement.option[e.srcElement.selectedIndex].value);
			}
		})
		
		function getStockReport(companyId){
			var url="../processing/getTodaysStockReport.jsp?companyId="+companyId;
			if(window.XMLHttpRequest){  
				fetchData=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchData=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchData.onreadystatechange=fetchData;  
				console.log("AJAX Req sent");
				fetchData.open("GET",url,true);  
				fetchData.send();  
			}catch(e){alert("Unable to connect to server");}
		}

		 function fetchData(){
			 if(fetchData.readyState == 4){
				 console.log(this.response.trim());
				
				 
			 }
		 }


	</script>
	
</body>
</html>
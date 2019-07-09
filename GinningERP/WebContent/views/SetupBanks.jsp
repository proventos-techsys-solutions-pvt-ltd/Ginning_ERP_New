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
        <title>Final Purchase</title>
    </head>
<body>
   <%@include file="../views/NavBar.html" %>
       	<div class="container-fluid">
       		<div class="row mt-2">
       			<div class="col-md-12">
       				<div class="d-flex justify-content-start align-items-center tile-background-row">
	       				<img src="../property/img/money-bag.png" alt="banks">
	       				<h4 class="lbl-rm-all">Setup Bank Accounts</h4>
       				</div>
       			</div>
       		</div>
       		<div class="row mt-1">
       		<div class="col-md-8">
       		<div class="tile-background-row" id="getHeight">
				<form action="../processing/addBank.jsp" name="bankForm">
					<div class="form-row">
						<div class="form-group col-md-4">
						<label>Company Name</label>
						<select class="form-control form-control form-control-radius" name="companyId" id="companyId">
							<c:Company/>
						</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Bank Name</label>
						<input type="text" class="form-control form-control form-control-radius" name="bankName" id="bankName">
						</div>
						<div class="col-md-6">
						<label>Account No</label>
						<input type="text" class="form-control form-control form-control-radius" name="accountNo" id="accountNo">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>IFSC Code</label>
						<input type="text" class="form-control form-control form-control-radius" name="ifsc" id="ifsc">
						</div>
						<div class="form-group col-md-6">
						<label>MICR Code</label>
						<input type="text" class="form-control form-control form-control-radius" name="micr" id="micr">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Date</label>
						<input type="date" class="form-control form-control form-control-radius" name="date" id="date">
						</div>
					</div>
				</form>
					<div class="d-flex justify-content-end align-items-center">
						<button type="button" class="btn btn-success btn btn-mr-tp change-button" onclick="submitForm()">Save</button>
					</div>
				</div>
       			</div>
       			<div class="col-md-4">
       			<div class="tile-background-row scroll">
       					<div class="col-md-12 ">
       						<table class="table ">
       							<thead>
       								<tr>
       									<th>Company</th>
       									<th>Bank</th>
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
       	
       	<nav class="navbar navbar-default navbar-static-bottom footer border-top">
    
    	</nav>
       	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/commonjs.js"></script>
		<script>
		var height = new SettingHeightofAdjacentPanels("getHeight","scroll",0);//getting & setting height of panels
		height.calcHeight();
		
		
			function submitForm(){
				document.getElementsByName("bankForm")[0].submit();
			}
			
			window.onload = function() {
				  getBankData();
				};
			
			function getBankData(){

				url = "../processing/bankReport.jsp";
				
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
				
				if(fetchRequest.readyState == 4){
					var response = this.response.trim();
					console.log(response)
					
					var element = document.getElementById("tableBody");
					
					var dataList = JSON.parse(response);
					
					
					
					var size = dataList.length;
					console.log(size);
					
					for (i = 0; i < size; i++) {
					
						element.insertAdjacentHTML('beforeend',''+
						'<tr>'+
							'<td>'+dataList[i].companyName+'</td>'+
							'<td>'+dataList[i].bankName+'</td>'+
						'</tr>');
					}
					 
					
				}
				
			}
			
			
		</script>
</body>
</html>
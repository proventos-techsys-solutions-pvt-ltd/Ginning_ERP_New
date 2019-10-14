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
<title>Setup Bank</title>
</head>

<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
	<div class="container-fluid ">
       		<div class="row border-bottom row-background">
       			<div class="col-md-12">
       				<div class="d-flex justify-content-start align-items-center">
	       				<img src="../property/img/money-bag.png" alt="banks">
	       				<h4 class="lbl-rm-all">Setup Bank Accounts</h4>
       				</div>
       			</div>
       		</div>
       		<div class="row row-background">
       		<div class="col-md-8">
       		<div class="" id="getHeight">
				<form action="../processing/addBank.jsp" name="bankForm">
					<div class="form-row">
						<div class="form-group col-md-4">
						<label>Company Name</label>
						<select class="form-control form-control-sm " name="companyId" id="companyId">
							<c:Company/>
						</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Bank Name</label>
						<input type="text" class="form-control form-control-sm " name="bankName" id="bankName">
						</div>
						<div class="col-md-6">
						<label>Account No</label>
						<input type="text" class="form-control form-control-sm " name="accountNo" id="accountNo">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>IFSC Code</label>
						<input type="text" class="form-control form-control-sm " name="ifsc" id="ifsc">
						</div>
						<div class="form-group col-md-6">
						<label>MICR Code</label>
						<input type="text" class="form-control form-control-sm " name="micr" id="micr">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>Date</label>
						<input type="date" class="form-control form-control-sm" name="date" id="date">
						</div>
						<div class="form-group col-md-6">
						<label>Opening Balance</label>
						<input type="text" class="form-control form-control-sm" name="openingBal" id="openingBal">
						</div>
					</div>
				</form>
					<div class="d-flex justify-content-end align-items-center">
						<button type="button" class="btn btn-success btn btn-mr-tp change-button" onclick="submitForm()">Save</button>
					</div>
				</div>
       			</div>
       			<div class="col-md-4 border-left">
       			<div class=" scroll">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
	<script src="../js/commonjs.js"></script>
	<script src="../js/Validation.js"></script>
<script>
		
		
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
			
			/**************************************
			Response window code
			**************************************/
			var sessionId = {
					"getSessionId":<%=session.getAttribute("bankId") %>,
			}

			$(document).ready(function(){
				$.fn.checkStatus(sessionId.getSessionId,"Bank has been saved successfully!")
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
		<%
session.removeAttribute("bankId");
%>
</body>
</html>
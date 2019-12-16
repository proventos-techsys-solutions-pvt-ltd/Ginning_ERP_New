<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Setup Companies</title>
</head>

<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
	<div class="container-fluid ">
		<div class="row row-background border-bottom">
			<div class="col-md-12">
					<h4>Setup Companies</h4>
			</div>
		</div>
		<div class=" row row-background">
			<div class="col-md-12">
				<div class="tile-background-row">
					<form name="companyForm" enctype="multipart/form-data" action="../processing/addCompany.jsp" method="post">
						<input type="hidden" class="form-control" name="id" id="id">
						<div class="form-row">
							<div class="col-md-10">
								<label class="lbl-rm-all">Company Name</label>
								<input type="text" class="form-control  " name="name" id="name">
								<label class="lbl-rm-all">Company Address</label>
								<textarea class="form-control form-control-lg " name="address" id="address"></textarea>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4">
								<label class="lbl-rm-all">City</label>
								<input type="text" class="form-control  " name="city" id="city">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">State</label>
								<input type="text" class="form-control  " name="state" id="state">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">PAN</label>
								<input type="text" class="form-control  " name="pan" id="pan">
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4">
								<label class="lbl-rm-all">TAN</label>
								<input type="text" class="form-control  " name="tan" id="tan">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">CIN</label>
								<input type="text" class="form-control  " name="cin" id="cin">
							</div>
							<div class="col-md-4">
								<label class="lbl-rm-all">GST No</label>
								<input type="text" class="form-control  " name="gst" id="gst">
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-3">
								<label class="lbl-rm-all">Telephone</label>
								<input type="text" class="form-control  " name="telephone" id="telephone">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Mobile</label>
								<input type="text" class="form-control  " name="mobile" id="mobile">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Email</label>
								<input type="email" class="form-control  " name="email" id="email">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Invoice Series</label>
								<input type="text" class="form-control  " name="invoiceSeries" id="invoiceSeries">
							</div>
							<div class="col-md-3">
								<label class="lbl-rm-all">Logo</label>
								<input type="file" class="form-control  " name="file" id="logo">
							</div>
						</div>
						<div class="form-row border-top">
							<div class="col-md-12">
								<div class="d-flex justify-content-end align-items-center">
									<button type="button" class="btn btn-success btn-sm" id="add-company">Add</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-success btn-sm" id="update" disabled>Update</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-success btn-sm" id="reset">Reset</button>
								</div>
							</div>
						</div>
					</form>
					
				</div>
			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-12">
				<div id="companyDataDisplay">
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

<script src="../js/3.4.1-jq.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/Validation.js"></script>
<script>

		window.onload = function() {
			  getCompanyData();
			};
			
			$(document).ready(function(){
				$("#add-company").click(function(){
					if($.fn.validateData($("#name").val(),/^[A-Z0-9. ]+$/)){
						if($.fn.validateData($("#address").val(),/^[A-Z0-9., ]+$/)){
							if($.fn.validateData($("#city").val(),/^[A-Z]+$/)){
								if($.fn.validateData($("#state").val(),/[A-Z]+$/)){
									//if($.fn.validateData($("#pan").val(),/^[A-Z]{5}[0-9]{4}[A-Z]{1}$/)){
									//	if($.fn.validateData($("#tan").val(),/^[A-Z]{4}[0-9]{5}[A-Z]{1}$/)){
										//	if($.fn.validateData($("#cin").val(),/^[A-Z]{1}[0-9]{5}[A-Z]{2}[0-9]{4}[A-Z]{3}[0-9]{6}$/)){
											//	if($.fn.validateData($("#gst").val(),/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[A-Z0-9]{3}$/)){
													if(!$.fn.validateData($("#telephone").val(),/^\s*$/)){
														if(!$.fn.validateData($("#mobile").val(),/^\s*$/)){
															if($.fn.validateData($("#email").val(),/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/)){
																if($.fn.validateData($("#invoiceSeries").val(),/^[A-Z]{2,3}$/)){
																	submitForm()
																}else{
																	$.fn.checkStatus(1,"Only three letters are allowed in invoice series and should not be blank!")
																}
															}else{
																$.fn.checkStatus(1,"Invalid email id!")
															}
														}else{
															$.fn.checkStatus(1,"Invalid Mobile number!")
														}
													}else{
														$.fn.checkStatus(1,"Invalid Telephone number!")
													}
												}
												/*else{
													$.fn.checkStatus(1,"Invalid GST number!")
												}
											}else{
												$.fn.checkStatus(1,"Invalid CIN number!")
											}
										}else{
											$.fn.checkStatus(1,"Invalid Tan number!")
										}
									}else{
										$.fn.checkStatus(1,"Invalid Pan number!")
									}
								}
								*/else{
									$.fn.checkStatus(1,"Invalid State!")
								}
							}else{
								$.fn.checkStatus(1,"Invalid City!")
							}
							}
						else{
							$.fn.checkStatus(1,"Invalid Address!")
						}
						}
					else{
						$.fn.checkStatus(1,"Only [dot] is allowed in the company name!")
					}
				})
			})
			
			function submitForm(){
				document.getElementsByName("companyForm")[0].submit();
			}
			
			function getCompanyData(){

				url = "../processing/companyReport.jsp";
				
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
					
					var element = document.getElementById("companyDataDisplay");
					
					var dataList = JSON.parse(response);
					
					
					
					var size = dataList.length;
					console.log(size);
					
					for (i = 0; i < size; i++) {
					
						element.insertAdjacentHTML('beforeend',
						  '<ul class="list-unstyled companyList">'+
						  '<li class="media">'+
						  '<img class="mr-3" src="../images/'+dataList[i].logoPath+'" alt="Company 1 Logo" width="100px" height="100px">'+
						  '<div class="media-body">'+
						  '  <h5 class="mt-0 mb-1 displayCompanyName">'+dataList[i].name+'</h5>'+
						  '  		<p>Address : '+dataList[i].address+'</p>'+
						  '  		<p>Telephone : '+dataList[i].telephone+'</p>'+
						  '  		<p>Mobile : '+dataList[i].mobile+'</p>'+
						  '</div>'+
						  '<button id="edit'+(i+1)+'" data-companyId="'+dataList[i].id+'">Edit Company</button>'+
						  '</li>'+
						  '</ul>'+
						  '<div class="border-top border-mr-btm"></div>');
					}
				}
			}
			
			/**************************************
			Response window code
			**************************************/
			var sessionId = {
					"getSessionId":<%=session.getAttribute("companyId") %>,
			}

			$(document).ready(function(){
				$.fn.checkStatus(sessionId.getSessionId,"Company has been saved successfully!")
			})

			
			/***********************
			Side bar 
			************************/
			$(document).ready(function () {
			    $('#sidebarCollapse').on('click', function () {
			        $('#sidebar').toggleClass('active');
			    });
			});

	document.addEventListener('click',function(e){
		if(e.srcElement.id.includes('edit')){
			var id = e.srcElement.getAttribute('data-companyId');
			fetchCompanyData(id);
		}
	});
	
	document.addEventListener('click',function(e){
		if(e.srcElement.id === 'reset'){
			location.reload();
		}
	});
	
	document.addEventListener('click',function(e){
		if(e.srcElement.id === 'update'){
			document.getElementsByName('companyForm')[0].action = "../processing/updateCompany.jsp";
			document.getElementsByName('companyForm')[0].submit();
		}
	});
	
	function fetchCompanyData(id){
		url = "../processing/getCompanyData.jsp?id="+id;
		if(window.XMLHttpRequest){  
			fetchData=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchData=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			fetchData.onreadystatechange=getCompData;  
			console.log("AJAX Req sent");
			fetchData.open("GET",url,true);  
			fetchData.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function getCompData(){
		if(fetchData.readyState == 4){
			var response = this.response.trim();
			var data = JSON.parse(response);
			
			document.getElementById('id').value = data.id;
			document.getElementById('name').value = data.name;
			document.getElementById('name').setAttribute('readonly','readonly');
			document.getElementById('address').value = data.address;
			document.getElementById('city').value = data.city;
			document.getElementById('state').value = data.state;
			document.getElementById('pan').value = data.pan;
			document.getElementById('tan').value = data.tan;
			document.getElementById('cin').value = data.cin;
			document.getElementById('gst').value = data.gst;
			document.getElementById('email').value = data.email;
			//document.getElementById('logo').value = data.logoPath;
			document.getElementById('mobile').value = data.mobile;
			document.getElementById('telephone').value = data.telephone;
			document.getElementById('invoiceSeries').value = data.invoiceSeries;
			document.getElementById('update').disabled = false;
			document.getElementById('add-company').disabled = true;
		}
	}
			
	</script>
<%
session.removeAttribute("companyId");
%>
</body>
</html>
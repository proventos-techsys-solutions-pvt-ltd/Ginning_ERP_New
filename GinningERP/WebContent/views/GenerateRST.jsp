<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>RST Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap.min.css">	
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/WBStyle.css">
  <link href="https://fonts.googleapis.com/css?family=Vollkorn&display=swap" rel="stylesheet"> 
  <!-- Bootstrap JS -->
   	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  	<!-- script src="${pageContext.request.contextPath}/js/jquery-3.3.1.slim.min.js" ></script> -->
  	<script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
  <%@include file="../views/NavBar.html" %>
   <div hidden>
   <%
    out.print(session.getAttribute("weighmentId"));
    session.removeAttribute("weighmentId");
	%>
	</div>
  <div class="container-fluid">
  	<div class="row mt-2 ">
  		<div class="col-md-12">
  			<div class="d-flex justify-content-start align-items-center tile-background-row">
  				<img src="${pageContext.request.contextPath}/property/img/weight.png" alt="weight" >&nbsp;
  				<h4 class="lbl-rm-all" id="title">First Weighment</h4>
  			</div>
  		</div>
  	</div>
   	<div class="row mt-2 ">
    <div class="col-md-8">
    <div class="tile-background-row" id="getHeight">
      	<form id="newRST" action="${pageContext.request.contextPath}/processing/addWeighmentEntry.jsp" target="_blank">
      	<div class="form-row form-row-ctm">
	      	<input type="hidden" id="id" name="id" value="0" />
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">RST No</label>
	        	<div class="d-flex justify-content-start align-items-center">
	        		<input type="text" class="form-control" id="rst" name="rst" placeholder="Auto">
	        		<button type="button" class="btn btn-success" onclick="fetchDataForSecondWeighment(document.getElementById('rst').value)">Fetch</button>
	        	</div>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Date</label>
	        	<input type="date" class="form-control " id="date" name="date" placeholder="" readonly>
	        </div>
	
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Vehicle No</label>
	        	<input type="text" class="form-control " id="vehicleNo" name="vehicleNo" placeholder="Vh No">
	        </div>
        </div>
        <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Vehicle Type</label>
	        	 <select class="form-control " id="vehicleType" name="vehicleType" onchange="setWeighRate(this)">
	        	    <option disabled selected>Select</option>
	        	 	<c:VehicleCategoryTag />
	        	 </select>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Customer</label>
	        	<input type="text" class="form-control " name="customer" id="customer" placeholder="">
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Mobile No</label>
	        	<input type="text" class="form-control " id="mobile" name="mobile" placeholder="" >
	        </div>
	    </div>
	    <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Address</label>
	        	<textarea class="form-control " id="address" name="address"></textarea>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">BlackListed</label>
	        	<input type="text" class="form-control " id="blacklist" name="blacklist" placeholder="" readonly>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Membership</label>
	        	<input type="text" class="form-control " id="membership" name="membership" placeholder="" readonly>
	        </div>
	     </div>
	    <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Material</label>
	        	<input type="text" class="form-control " id="material" name="material" placeholder="">
	        </div>
	    </div>
        <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Gross Weight : </label>
	        	<div class="d-flex justify-content-start align-items-center">
	        		<input type="text" class="form-control  " id="gross" name="gross" placeholder="" value="0.0" readonly="readonly">
	        		<button type="button" class="btn btn-success" onclick="fetchGrossWt()" id="fetchGrossWeight">Fetch</button>
	        	</div>
	        	
	        	<input type="text" class="form-control  " id="grossWtTime" name="grossWtTime" placeholder="Date & Time" readonly="readonly">
	        </div>
	         <div class="col-md-4">
	        	<label class="lbl-rm-all">Tare Weight : </label>
	        	<div class="d-flex justify-content-start align-items-center">
	            	<input type="text" class="form-control" id="tare" name="tare" placeholder="" value="0.0" readonly="readonly">
	           	 	<button type="button" class="btn btn-success" id="fetchTareWeight" onclick="fetchTareWt()" disabled>Fetch</button>
	           	</div>
	            <input type="text" class="form-control  " id="tareWtTime" name="tareWtTime" placeholder="Date & Time" readonly="readonly">
	        </div>
	        <div class="col-md-4">
	            <label class="lbl-rm-all">Net Weight : </label>
	            <div class="d-flex justify-content-start align-items-center">
	            <input type="text" class="form-control  " id="net" name="net" placeholder="" readonly="readonly">
	            </div>
	            <input type="text" class="form-control  " id="netWtTime" name="netWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
        </div>
        <div class="form-row form-row-ctm">
        	<div class="col-md-4">
        		
	  		</div>
	  		<div class="col-md-4">
        		
	  		</div>
	  	</div>
        <div class="form-row form-row-ctm">
        <div class="col-md-4">
        	<label class="lbl-rm-all">Weigh Rate :</label>
        	<input type="text" class="form-control " id="weighRate" name="weighRate" value='0' readonly>
        </div>
        </div>
        <div class="form-row border-top">
	        <div class="col-md-12">
  			<div class="d-flex justify-content-end align-items-center ">
  				<button type="button" class="btn btn-success change-button" id="submitRstEntry" onclick="submitRSTEntry()">Submit</button>
  				&nbsp;
  				<button type="button" class="btn btn-success change-button" onclick="resetFormData()">Reset</button>
  				&nbsp;
  				<button type="button" class="btn btn-success change-button" onclick="printReceipt()">Print</button>
  				&nbsp;
  				<button type="button" class="btn btn-success change-button">PDF</button>
  			</div>
  			</div>
        </div>
        </form>
        </div>
        </div>
        
  
    <div class="col-md-4">
      <div class="col-md-12 scroll tile-background-row" >
        <input class="form-control mr-sm-2" type="search" placeholder="Enter RST To Search" aria-label="Search">
        <table class="table">
          <thead class="thead-dark">
              <tr>
                <th>RST</th>
                <th>Customer Name</th>
                <th>Gross Weight</th>
              </tr>
          </thead>
          <tbody id="tableBody">
          </tbody>
      </table>
      </div>
    </div>
    </div>
  	<!-- Modal -->
		<div class="modal fade" id="newCustomerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-top" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Add New Customer</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <form id="newCustomer" action="${pageContext.request.contextPath}/processing/addCustomer.jsp">
		       	<div class="form-row">
			       	<div class="col-md-6">
			       		<label class="lbl-rm-all">Name</label>
			       		<input type="text" id="newCustomerName" class="form-control" name="name">
			       	</div>	
			       	<div class="col-md-6">
			       		<label class="lbl-rm-all">Mobile</label>
			       		<input type="tel" class="form-control" name="mobile" id="newCustomerMobile">
			       	</div>
			       	<div class="col-md-12">
			       		<label class="lbl-rm-all">Address</label>
		       			<textarea class="form-control" name="address" id="newCustomerAddress"></textarea>
			       	</div>	
		       	</div>
		       </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-success" onclick="submitNewCustomer()" data-dismiss="modal">Add Customer</button>
		      </div>
		    </div>
		  </div>
		</div>
  </div>

<!--Footer code starts here-->
<nav class="navbar navbar-default navbar-static-bottom footer ">
 
</nav>
<script src="${pageContext.request.contextPath}/js/commonjs.js"></script>
<script src="${pageContext.request.contextPath}/js/validations/GenerateRST.js"></script>
<script>

//Send AJAX req to chech Daily setup
function checkDailySetup(){
	var url="${pageContext.request.contextPath}/processing/checkDailySetup.jsp";
	if(window.XMLHttpRequest){  
		dailySetup=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		dailySetup=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		dailySetup.onreadystatechange=getDailySetupRecords;  
		console.log("AJAX Req sent");
		dailySetup.open("GET",url,true);  
		dailySetup.send();  
	}catch(e){alert("Unable to connect to server");}
}

//Get response of Daily Setup Check performed by AJAX
function getDailySetupRecords(){
	if(dailySetup.readyState == 4){
		var response = this.response.trim();
		console.log("daily Setup---"+response);
		if(Number(response) > 0){
			$.unblockUI
		}
		else if(Number(response) <= 0){
			$.blockUI();
		}
	} 
}

//Send AJAX request to get RST series
function fetchRSTSeriesFunc(){
	var url="${pageContext.request.contextPath}/processing/getRstSeries.jsp";
	if(window.XMLHttpRequest){  
		fetchRSTSeries=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchRSTSeries=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchRSTSeries.onreadystatechange=fetchRST;  
		console.log("AJAX Req sent");
		fetchRSTSeries.open("GET",url,true);  
		fetchRSTSeries.send();  
	}catch(e){alert("Unable to connect to server");}
}

//Set RST series in input field
function fetchRST(){
	if(fetchRSTSeries.readyState == 4){
		var response = this.response.trim();
		document.getElementById('rst').value = response;
	}
}

//Change tile of the weighment page 
function decideWeighment(flag){
	if(flag === 1){
		document.getElementById("title").innerHTML = "Second Weighment";
	}else{
		document.getElementById("title").innerHTML = "First Weighment";
	}
}

//call RST Check AJAX method on chage of the RST search box
document.addEventListener('change',function(e){
	if(e.srcElement.id === "rst"){
		checkRSTAlreadyExists(e.srcElement.value);
	}
})

//Send AJAX request to check RST already Exists
function checkRSTAlreadyExists(rst){
	var url="${pageContext.request.contextPath}/processing/fetchSecondWeighment.jsp?rst="+rst;
	if(window.XMLHttpRequest){  
		fetchRstStatus=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchRstStatus=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchRstStatus.onreadystatechange=checkRstExists;  
		console.log("AJAX Req sent");
		fetchRstStatus.open("GET",url,true);  
		fetchRstStatus.send();  
	}catch(e){alert("Unable to connect to server");}
}

//check if RST already exists
function checkRstExists(){
	if(fetchRstStatus.readyState == 4){
		var response = this.response.trim();
		if(Number(response) != 0){
			setFirstWeighmentData(response);
			if(Number(document.getElementById('tare').value) != 0){
				document.getElementById("submitRstEntry").disabled=true;
				document.getElementById("fetchTareWeight").disabled=true;
			}
		}
	}
}

//Send AJAX request to get data of first weighment
function fetchDataForSecondWeighment(rst){
	var url="${pageContext.request.contextPath}/processing/fetchSecondWeighment.jsp?rst="+rst;
	if(window.XMLHttpRequest){  
		fetchWeighData=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchWeighData=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchWeighData.onreadystatechange=fetchFirstWeighment;  
		console.log("AJAX Req sent");
		fetchWeighData.open("GET",url,true);  
		fetchWeighData.send();  
	}catch(e){alert("Unable to connect to server");}
}

//Get response from AJAX of first weighment. 
function fetchFirstWeighment(){
	if(fetchWeighData.readyState == 4){
		var response = this.response.trim();
		if(Number(response) === 0){
			window.alert("Please enter a valid RST number.")
		}else{
			setFirstWeighmentData(response);
		}
	}
}

//Set the data of the first weighment automatically
function setFirstWeighmentData(response){
	
	var blacklisted;
	var membership;
	var data = JSON.parse(response);
	if(Number(data.vendorBlacklisted) === 1){
		blacklisted = 'YES';
	}else if(Number(data.vendorBlacklisted) === 0){
		blacklisted = 'NO'
	}
	if(Number(data.vendorMembership) === 1){
		membership = 'YES';
	}else if(Number(data.vendorMembership) === 0){
		membership = 'NO';
	}
	document.getElementById('id').value = data.weighmentId;
	document.getElementById('date').value = data.weighmentDate ;
	document.getElementById('vehicleNo').value = data.vehicleNo ;
	document.getElementById('customer').value = data.vendorName ;
	document.getElementById('address').value = data.vendorAddress ;
	document.getElementById('mobile').value = data.vendorMobile ;
	document.getElementById('blacklist').value = blacklisted ;
	document.getElementById('membership').value = membership ;
	document.getElementById('material').value = data.material ;
	document.getElementById('gross').value = data.grossWt ;
	document.getElementById('grossWtTime').value = data.grossWtTime ;
	document.getElementById('tare').value = data.tareWt ;
	document.getElementById('net').value = data.netWt ;
	document.getElementById('weighRate').value = data.weighRate ;
	document.getElementById('date').setAttribute('readonly','');
	document.getElementById('vehicleNo').setAttribute('readonly','');
	document.getElementById('vehicleType').setAttribute('readonly','');
	document.getElementById('customer').setAttribute('readonly','');
	document.getElementById('address').setAttribute('readonly','');
	document.getElementById('mobile').setAttribute('readonly','');
	document.getElementById('blacklist').setAttribute('readonly','');
	document.getElementById('membership').setAttribute('readonly','');
	document.getElementById('material').setAttribute('readonly','');
	document.getElementById('weighRate').setAttribute('readonly','');

	var element = document.getElementById('vehicleType');
	
	for(i=0;i<element.options.length;i++){
		if(element.options[i].innerHTML === data.vehicleName){
			element.options[i].selected=true;
		}else{
			element.options[i].disabled=true;
		}
	}
	
	document.getElementById("fetchGrossWeight").disabled = "true";
	if(Number(document.getElementById('tare').value) === 0.0){
		document.getElementById("fetchTareWeight").disabled = false;
	}
	decideWeighment(1);
}

//fetch Gross weight from weigh machine
function fetchGrossWt(){
	var url="${pageContext.request.contextPath}/processing/fetchWeight.jsp";
	if(window.XMLHttpRequest){  
		fetchData=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchData=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchData.onreadystatechange=fetchGrossWeighData;  
		console.log("AJAX Req sent");
		fetchData.open("GET",url,true);  
		fetchData.send();  
	}catch(e){alert("Unable to connect to server");}
}

//Set gross weight obtained by AJAX in input field
 function fetchGrossWeighData(){
	 if(fetchData.readyState == 4){
		 var response = this.response.trim();
		 console.log('Weight --- '+response);
		 var grossWtInput = document.getElementById('gross');
		 grossWtInput.value = response;
	 }
 }
 
 //fetch Tare weight from weigh machine
 function fetchTareWt(){
		var url="${pageContext.request.contextPath}/processing/fetchWeight.jsp";
		if(window.XMLHttpRequest){  
			fetchData=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchData=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			fetchData.onreadystatechange=fetchTareWeighData;  
			console.log("AJAX Req sent");
			fetchData.open("GET",url,true);  
			fetchData.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
 //Set tare weight obtained by AJAX in input field
	 function fetchTareWeighData(){
		 if(fetchData.readyState == 4){
			 var response = this.response.trim();
			 console.log('Weight --- '+response);
			 var tareWtInput = document.getElementById('tare');
			tareWtInput.value = response;
			document.getElementById('net').value = Number(document.getElementById('gross').value) - Number(document.getElementById('tare').value);
		 }
	 }
	var height = new SettingHeightofAdjacentPanels("getHeight","scroll",0);//getting & setting height of panels
	height.calcHeight();

//Submit RST Weigh Bridge Form
function submitRSTEntry(){
	if(uiController.validate()===true){
		document.getElementById("newRST").submit();	
		resetFormData();
		
	}else{
		alert("Please check if data has been properly entered!!!");
	}
	
}

//RESET ALL input FIELDS
function resetFormData(){
	document.getElementById("newRST").reset();
	document.getElementById('vehicleNo').removeAttribute('readonly');
	document.getElementById('vehicleType').removeAttribute('readonly');
	document.getElementById('customer').removeAttribute('readonly');
	document.getElementById('address').removeAttribute('readonly');
	document.getElementById('mobile').removeAttribute('readonly');
	document.getElementById('material').removeAttribute('readonly');
	document.getElementById('weighRate').removeAttribute('readonly');
	
	var element = document.getElementById('vehicleType');
	element.options[0].selected=true;
	for(i=0;i<element.options.length;i++){
			element.options[i].disabled=false;
	}
	document.getElementById("fetchGrossWeight").disabled = false;
	document.getElementById("submitRstEntry").disabled=false;
	document.getElementById("fetchTareWeight").disabled=true;
	setCurrentDate();
	fetchRSTSeriesFunc();
	decideWeighment(0);
}

//Check if the entered customer exists in DB
document.addEventListener('change',function(e){
	if(e.srcElement.id === "mobile")
		checkEnteredCustomer();
});

//Get customer data from input fields and call getCustomerData function.
function checkEnteredCustomer(){
	var customerName = document.getElementById("customer").value;
	var mobile = document.getElementById("mobile").value;
	getCustomerData(customerName, mobile);
}

//Create AJAX Req to get the customer data from DB if the customer exists in it
function getCustomerData(customerName,mobile){
	var url="${pageContext.request.contextPath}/processing/getCustomer.jsp?customerName="+customerName+"&mobileNo="+mobile;
	
	if(window.XMLHttpRequest){  
		checkRequest=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		checkRequest=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
  
	try{  
		checkRequest.onreadystatechange=checkCustomer;  
		console.log("AJAX Req sent");
		checkRequest.open("GET",url,true);  
		checkRequest.send();  
	}catch(e){alert("Unable to connect to server");}
}

//Set data in RST form if the customer exists in the DB
function checkCustomer(){
	if(checkRequest.readyState==4){
		var res = this.response.trim();
		if(res.toString() === 'false')
		{
			console.log("Customer not found, please add new customer!");
			addNewCustomer();
		}
		else{
			var customer = JSON.parse(res);
			
			var blacklisted;
			var membership;
			
			document.getElementById("id").value = customer.id;
			document.getElementById("customer").value = customer.name;
			document.getElementById("address").value = customer.address;
			document.getElementById("mobile").value = customer.mobile;
			
			if(Number(customer.blacklist) === 1){
				blacklisted = 'YES';
			}else if(Number(customer.blacklist) === 0){
				blacklisted = 'NO'
			}
			if(Number(customer.membership) === 1){
				membership = 'YES';
			}else if(Number(customer.membership) === 0)
			{
				membership = 'NO';
			}
			
			document.getElementById("blacklist").value = blacklisted;
			document.getElementById("membership").value = membership;
			
			console.log("Customer found -- "+ customer);
		}
	}
}

//Open Add new customer form popup
function addNewCustomer(){
	
	var name = document.getElementById("customer").value;
	var address = document.getElementById("address").value;
	var mobile = document.getElementById("mobile").value;
	
	$("#newCustomerModal").modal();
	
	document.getElementById("newCustomerName").value = name;
	document.getElementById("newCustomerMobile").value = mobile;
	document.getElementById("newCustomerAddress").value = address;
	
}

//Submit New Customer Form
function submitNewCustomer(){
	var newCustomerName = document.getElementById("newCustomerName").value;
	var newCustomerMobile = document.getElementById("newCustomerMobile").value;
	var newCustomerAddress = document.getElementById("newCustomerAddress").value;
	
	saveCustomerRequest(newCustomerName,newCustomerMobile,newCustomerAddress);
}

//Create AJAX Request for new customer form submission
function saveCustomerRequest(newCustomerName,newCustomerMobile,newCustomerAddress){
	var url="${pageContext.request.contextPath}/processing/addCustomer.jsp?name="+newCustomerName+"&mobile="+newCustomerMobile+"&address="+newCustomerAddress;
	if(window.XMLHttpRequest){  
		newCustomerRequest=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		newCustomerRequest=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
  
	try{  
		newCustomerRequest.onreadystatechange=setNewCustomerData;  
		console.log("AJAX Req sent");
		newCustomerRequest.open("GET",url,true);  
		newCustomerRequest.send();  
	}catch(e){alert("Unable to connect to server");}
}

//Set data in RST form fields of newly added customer
function setNewCustomerData(){
	
	if(newCustomerRequest.readyState==4){
		
		console.log("New Customer Added!!!");
		var blacklisted;
		var membership;
		var customer = JSON.parse(this.response.trim());
		
		if(customer.blacklist === '1'){
			blacklisted = 'YES';
		}else{
			blacklisted = 'NO'
		}
		if(customer.membership === '1'){
			membership = 'YES';
		}else{
			membership = 'NO';
		}
		document.getElementById("id").value = customer.id;
		document.getElementById("customer").value = customer.name;
		document.getElementById("address").value = customer.address;
		document.getElementById("mobile").value = customer.mobile;
		document.getElementById("blacklist").value = blacklisted;
		document.getElementById("membership").value = membership;
	}
}

//Sen AJAX request to get the tare weight pending RSTs
function pendingTareWt(){
var url="${pageContext.request.contextPath}/processing/pendingTareReport.jsp";
	if(window.XMLHttpRequest){  
		dataRequest=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		dataRequest=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		dataRequest.onreadystatechange=getRstData;  
		console.log("AJAX Req sent");
		dataRequest.open("GET",url,true);  
		dataRequest.send();  
	}catch(e){alert("Unable to connect to server");}
}

//Get tare weight pending RSTs from AJAX response
function getRstData(){
	if(dataRequest.readyState == 4){
		var pendingRst = this.response.trim();
		setPendingData(pendingRst);
	}
}

//Set tare weight pending RSTs in status table
function setPendingData(pendingRst){
	 var element = document.getElementById("tableBody");
   
	 var jsonData = JSON.parse(pendingRst);
	 
	 for(i=0;i<jsonData.length;i++){
	 
	   element.insertAdjacentHTML('beforeend','<tr>'+
			    '<td>'+jsonData[i].rst+'</td>'+
			    '<td>'+jsonData[i].customerName+'</td>'+  
			    '<td>'+jsonData[i].grossWt+'</td>'+     
			   '</tr>');
	 }
}

//Get current date and time
function setCurrentDate(){
	var today = new Date();
	 var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!
	    var yyyy = today.getFullYear();

	    if(dd<10){
	        dd='0'+dd;
	    } 
	    if(mm<10){
	        mm='0'+mm;
	    } 

	    todayDate = yyyy+'-'+mm+'-'+dd; 
	    formattedDate = dd+'-'+mm+'-'+yyyy;
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var dateTime = formattedDate+' '+time;
	document.getElementById('grossWtTime').value = dateTime;
	document.getElementById('tareWtTime').value = dateTime;
	document.getElementById('netWtTime').value = dateTime;
	document.getElementById("date").value = todayDate;
}	
	
//Set weight rate according to the vehicle type selected
function setWeighRate(event) {
	document.getElementsByName("weighRate")[0].value = event.selectedOptions[0].getAttribute('data-weighRate'); 
}

//Print RST Receipt
function printReceipt(){
	var weighmentId = document.getElementById('id').value;
	window.open('${pageContext.request.contextPath}/report/RSTPrintOnly.jsp?weighmentId='+weighmentId);
}

//Function calls on page load
pendingTareWt();
setCurrentDate();
fetchRSTSeriesFunc();
decideWeighment(0);
checkDailySetup();

</script>
</body>
</html>

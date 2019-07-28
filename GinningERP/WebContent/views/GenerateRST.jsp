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
  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
  <link rel="stylesheet" href="../styles/WBStyle.css">
</head>
<body>
  <%@include file="../views/NavBar.html" %>
  
  <div class="container-fluid">
  	<div class="row mt-2 ">
  		<div class="col-md-12">
  			<div class="d-flex justify-content-start align-items-center tile-background-row">
  				<img src="../property/img/weight.png" alt="weight" >&nbsp;
  				<h4 class="lbl-rm-all" id="title">Weighment</h4>
  			</div>
  		</div>
  	</div>
   	<div class="row mt-2 ">
    <div class="col-md-8">
    <div class="tile-background-row" id="getHeight">
      	<form id="newRST" action="../processing/addWeighmentEntry.jsp">
      	<div class="form-row form-row-ctm">
	      	<input type="hidden" id="id" name="id" value="0" />
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">RST No</label>
	        	<input type="text" class="form-control " id="rst" name="rst" placeholder="Auto">
	        </div>
			<div class="col-md-auto">
				<label class="lbl-rm-all"></label>
        		<button type="button" class="btn btn-success change-button" onclick="fetchDataForSecondWeighment(document.getElementById('rst').value)">Fetch RST</button>
	  		</div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Date</label>
	        	<input type="date" class="form-control " id="date" name="date" placeholder="">
	        </div>
	
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Vehicle No</label>
	        	<input type="email" class="form-control " id="vehicleNo" name="vehicleNo" placeholder="Vh No">
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
	        	<label class="lbl-rm-all">Address</label>
	        	<textarea class="form-control " id="address" name="address"></textarea>
	        </div>
	    </div>
	    <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Mobile No</label>
	        	<input type="text" class="form-control " id="mobile" name="mobile" placeholder="" >
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">BlackListed</label>
	        	<input type="text" class="form-control " id="blacklist" name="blacklist" placeholder="" >
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Membership</label>
	        	<input type="text" class="form-control " id="membership" name="membership" placeholder="" >
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
	        	<input type="text" class="form-control  " id="gross" name="gross" placeholder="" value="0.0">
	        	<input type="text" class="form-control  " id="grossWtTime" name="grossWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
	        
	        
	         <div class="col-md-4">
	        	<label class="lbl-rm-all">Tare Weight : </label>
	            <input type="text" class="form-control  " id="tare" name="tare" placeholder="" value="0.0">
	            <input type="text" class="form-control  " id="tareWtTime" name="tareWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
	        
	        <div class="col-md-4">
	            <label class="lbl-rm-all">Net Weight : </label>
	            <input type="text" class="form-control  " id="net" name="net" placeholder="" value="0.0">
	            <input type="text" class="form-control  " id="netWtTime" name="netWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
        </div>
        <div class="form-row form-row-ctm">
        	<div class="col-md-4">
        		<button type="button" class="btn btn-success change-button" onclick="fetchGrossWeight()">Fetch Gross Weight</button>
	  		</div>
	  		<div class="col-md-4">
        		<button type="button" class="btn btn-success change-button" onclick="fetchTareWeight()">Fetch Tare Weight</button>
	  		</div>
	  	</div>
        <div class="form-row form-row-ctm">
        <div class="col-md-4">
        	<label class="lbl-rm-all">Weigh Rate :</label>
        	<input type="text" class="form-control " id="weighRate" name="weighRate" value='0'>
        </div>
        </div>
        <div class="form-row justify-content-end border-top">
	        
  			<div class="col-md-auto ">
  				<button type="button" class="btn btn-success change-button" onclick="submitRSTEntry()">Submit</button>
  			</div>
  			<div class="col-md-auto ">
  				<button type="button" class="btn btn-success change-button" data-toggle="modal" data-target="#modalLoginForm">Reset</button>
  			</div>
  			<div class="col-md-auto ">
  				<button type="button" class="btn btn-success change-button">Print</button>
  			</div>
  			<div class="col-md-auto ">
  				<button type="button" class="btn btn-success change-button">PDF</button>
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
		       <form id="newCustomer" action="../processing/addCustomer.jsp">
		       	<div class="form-row">
			       	<div class="col-md-6">
			       		<label>Name</label>
			       		<input type="text" id="newCustomerName" class="form-control" name="name">
			       	</div>	
			       	<div class="col-md-6">
			       		<label>Mobile</label>
			       		<input type="tel" class="form-control" name="mobile" id="newCustomerMobile">
			       	</div>
			       	<div class="col-md-12">
			       		<label>Address</label>
		       			<textarea class="form-control" name="address" id="newCustomerAddress"></textarea>
			       	</div>	
			       	<div class="col-md-6">
			       	<div class="custom-control custom-checkbox">
		       			 <input type="checkbox" class="custom-control-input" name="newMembership" id="newMembership" value="0">
                         <label class="custom-control-label lbl-rm-t" for="newMembership">Membership</label>
			       	</div>
			       	</div>	
			       	<div class="col-md-6">
			       		<div class="custom-control custom-checkbox">
			       			<input type="checkbox" class="custom-control-input" name="newBlacklist" id="newBlacklist" value="0">
                      	 	<label class="custom-control-label lbl-rm-t" for="newBlacklist">Blacklist</label>
			       		</div>
			       	</div>	
		       	</div>
		       </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" onclick="submitNewCustomer()" data-dismiss="modal">Add Customer</button>
		      </div>
		    </div>
		  </div>
		</div>
  
  </div>

<!--Footer code starts here-->
<nav class="navbar navbar-default navbar-static-bottom footer ">
 <div class="container">	
  <div class="row">
	  	<div class="col-md-auto">
	       <label> No of Vehicles Inside Premises :</label>
	       <input type="text" class="form-control" name="notgiven" value="" readonly>
	    </div>
	    <div class="col-md-auto">
	    	<label> No of RST Pending for Tare Weight :</label>
	        <input type="text" class="form-control" name="notgiven" value="" readonly>
	    </div>
	    <div class="col-md-auto">
	     	 <label> No of RST Cleared for Tare Weight :</label>
	         <input type="text" class="form-control" name="notgiven" value="" readonly>
	    </div>          
   </div>
  <div class="row">
  	<div class="col-md-12">
  		<p class="text-right">Designed & Developed by Proventos</p>
  	</div>
  </div>
  </div>
</nav>
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/commonjs.js"></script>
<script>


document.addEventListener('change', function(e){
	if(e.srcElement.id === 'newMembership' || e.srcElement.id === 'newBlacklist' ){
		if(e.srcElement.value === '0'){
			e.srcElement.value = '1'
		}
		else if(e.srcElement.value === '1'){
			e.srcElement.value = '0'
			
		}
	}
})

function decideWeighment(flag){
	if(flag === 1){
		document.getElementById("title").innerHTML = "Second Weighment";
	}
}

function fetchDataForSecondWeighment(rst){
	var url="../processing/fetchSecondWeighment.jsp?rst="+rst;
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
function fetchFirstWeighment(){
	if(fetchWeighData.readyState == 4){
		var response = this.response.trim();
		console.log(response)
		if(Number(response) === 0){
			window.alert("Please enter a valid RST number.")
		}else{
			setFirstWeighmentData(response);
		}
	}
}

function setFirstWeighmentData(response){
	
	var blacklisted;
	var membership;
	var data = JSON.parse(response);
	
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
	document.getElementById('gross').setAttribute('readonly','');
	document.getElementById('weighRate').setAttribute('readonly','');
	if(Number(data.netWt) != 0.0){
		document.getElementById('net').setAttribute('readonly','');
		document.getElementById('tare').setAttribute('readonly','');
	}
	
	var element = document.getElementById('vehicleType');
	
	for(i=0;i<element.options.length;i++){
		if(element.options[i].innerHTML === data.vehicleName){
			element.options[i].selected=true;
		}else{
			element.options[i].disabled=true;
		}
	}
	decideWeighment(1);
}

function fetchGrossWeight(){
	var url="../processing/fetchWeight.jsp";
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

 function fetchGrossWeighData(){
	 if(fetchData.readyState == 4){
		 var response = this.response.trim();
		 console.log('Weight --- '+response);
		 var grossWtInput = document.getElementById('gross');
		 grossWtInput.value = response;
	 }
 }
 
 
 function fetchTareWeight(){
		var url="../processing/fetchWeight.jsp";
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

	 function fetchTareWeighData(){
		 if(fetchData.readyState == 4){
			 var response = this.response.trim();
			 console.log('Weight --- '+response);
			 var tareWtInput = document.getElementById('tare');
			tareWtInput.value = response;
		 }
	 }

	var height = new SettingHeightofAdjacentPanels("getHeight","scroll",0);//getting & setting height of panels
	height.calcHeight();

//Submit RST Weigh Bridge Form
function submitRSTEntry(){
	document.getElementById("newRST").submit();	
}



//Check if the entered customer exists in DB
document.getElementById("mobile").addEventListener('change',function(e){
		checkEnteredCustomer();
});


function checkEnteredCustomer(){
	
	var customerName = document.getElementById("customer").value;
	var mobile = document.getElementById("mobile").value;
	
	getCustomerData(customerName, mobile);
	
}


//Create AJAX Req to get the customer data from DB if the customer exists in it
function getCustomerData(customerName,mobile){
	var url="../processing/getCustomer.jsp?customerName="+customerName+"&mobileNo="+mobile;
	
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
		console.log(res);
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
			
			console.log("Customer found"+ customer);
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
	var newCustomerBlacklist = document.getElementById("newBlacklist").value;
	var newCustomerMembership = document.getElementById("newMembership").value;
	
	saveCustomerRequest(newCustomerName,newCustomerMobile,newCustomerAddress, newCustomerBlacklist, newCustomerMembership);
}


//Create AJAX Request for new customer form submission
function saveCustomerRequest(newCustomerName,newCustomerMobile,newCustomerAddress, newCustomerBlacklist, newCustomerMembership){
	var url="../processing/addCustomer.jsp?name="+newCustomerName+"&mobile="+newCustomerMobile+"&address="+newCustomerAddress+"&membership="+newCustomerMembership+"&blacklist="+newCustomerBlacklist;
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
		
		console.log("New Customer Added");
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


function pendingTareWt(){
	
var url="../processing/pendingTareReport.jsp";
	
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



function getRstData(){
	
	if(dataRequest.readyState == 4){
		var pendingRst = this.response.trim();
		console.log(pendingRst);
		setPendingData(pendingRst);
	}
	
}

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

window.onload = function() {
	pendingTareWt();
	var today = new Date();
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var dateTime = date+' '+time;
	document.getElementById('grossWtTime').value = dateTime;
	document.getElementById('tareWtTime').value = dateTime;
	document.getElementById('netWtTime').value = dateTime;
	};
	
	

function setWeighRate(event) {
	document.getElementsByName("weighRate")[0].value = event.selectedOptions[0].getAttribute('data-weighRate'); 
}

</script>
</body>
</html>

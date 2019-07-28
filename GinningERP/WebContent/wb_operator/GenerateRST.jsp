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
  
  <div class="container-fluid">
  	<div class="row mt-2 ">
  		<div class="col-md-12">
  			<div class="d-flex justify-content-start align-items-center tile-background-row">
  				<img src="../property/img/weight.png" alt="weight" >&nbsp;
  				<h4 class="lbl-rm-all">Weighment</h4>
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
	        	<input type="text" class="form-control " id="rst" name="rst" placeholder="Auto" required>
	        </div>

	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Date</label>
	        	<input type="date" class="form-control " id="date" name="date" placeholder="" required>
	        </div>
	
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Vehicle No</label>
	        	<input type="email" class="form-control " id="vehicleNo" name="vehicleNo" placeholder="AA 31 DA 0000" required>
	        </div>
        </div>
        <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Vehicle Type</label>
	        	 <select class="form-control " id="vehicleType" name="vehicleType" onchange="setWeighRate(this)" required>
	        	    <option disabled selected>Select</option>
	        	 	<c:VehicleCategoryTag />
	        	 </select>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Customer</label>
	        	<input type="text" class="form-control " name="customer" id="customer" placeholder="" required>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Address</label>
	        	<textarea class="form-control " id="address" name="address" required></textarea>
	        </div>
	    </div>
	    <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Mobile No</label>
	        	<input type="text" class="form-control " id="mobile" name="mobile" placeholder="" required>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">BlackListed</label>
	        	<input type="text" class="form-control " id="blacklist" name="blacklist" placeholder="" required>
	        </div>
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Membership</label>
	        	<input type="text" class="form-control " id="membership" name="membership" placeholder="" required>
	        </div>
	     </div>
	    <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Material</label>
	        	<input type="text" class="form-control " id="material" name="material" placeholder="" required>
	        </div>
	    </div>
        
        <div class="form-row form-row-ctm">
	        <div class="col-md-4">
	        	<label class="lbl-rm-all">Gross Weight : </label>
	        	<input type="text" class="form-control  " id="gross" name="gross" placeholder="" value="0.0" required>
	        	<input type="text" class="form-control  " id="tare" name="grossWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly" >
	        </div>
	        
	         <div class="col-md-4">
	        	<label class="lbl-rm-all">Tare Weight : </label>
	            <input type="text" class="form-control  " id="tare" name="tare" placeholder="" value="0.0" >
	            <input type="text" class="form-control  " id="tare" name="tareWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
	        
	        <div class="col-md-4">
	            <label class="lbl-rm-all">Net Weight : </label>
	            <input type="text" class="form-control  " id="net" name="net" placeholder="" value="0.0">
	            <input type="text" class="form-control  " id="tare" name="netWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
        </div>
        <div class="form-row form-row-ctm">
        <div class="col-md-4">
        	<label class="lbl-rm-all">Weigh Rate :</label>
        	<input type="text" class="form-control " name="weighRate" value='0'>
        </div>
        </div>
        <div class="form-row justify-content-end border-top">
	        <div class="col-md-auto">
        		<button type="button" class="btn btn-success change-button" onclick="fetchRst()">Fetch RST</button>
	  		</div>
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

	if(flag === 0){
		document.getElementById("newRST").action = "../processing/addInvoiceEntry.jsp";
	}else if(flag === 1){
		document.getElementById("title").innerHTML = "Second Weighment";
		document.getElementById("newRST").action = "../processing/secondWeighment.jsp";
	}
	
}

function fetchRst(){
	
	var url="../processing/readWeighBridgeData.jsp";
	if(window.XMLHttpRequest){  
		fetchData=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchData=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
  
	try{  
		fetchData.onreadystatechange=fetchWeighData;  
		console.log("AJAX Req sent");
		fetchData.open("GET",url,true);  
		fetchData.send();  
	}catch(e){alert("Unable to connect to server");}
}

 function fetchWeighData(){
	 if(fetchData.readyState == 4){
		 console.log(this.response.trim());
		 console.log("Data Found!!!!!!!");
	 }
 }



	var height = new SettingHeightofAdjacentPanels("getHeight","scroll",0);//getting & setting height of panels
	height.calcHeight();

//Submit RST Weigh Bridge Form
function submitRSTEntry(){
	document.getElementById("newRST").submit();	
}



//Check if the entered customer exists in DB
document.getElementById("mobile").addEventListener('input',function(e){
	//if(e.keyCode === 13){
		checkEnteredCustomer();
	//}
	
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
	};
	
	

function setWeighRate(event) {
	document.getElementsByName("weighRate")[0].value = event.selectedOptions[0].getAttribute('data-weighRate'); 
}

</script>
</body>
</html>
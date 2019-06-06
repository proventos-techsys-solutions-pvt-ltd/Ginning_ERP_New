<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   	<div class="row mt-2">
    <div class="col-md-8">
    <div class="tile-background" id="getHeight">
       	<h3 class="text-center" >Generate RST</h3>
      	<form id="newRST" action="../processing/addInvoiceEntry.jsp">
      	<div class="form-row">
	      	<input type="hidden" id="id" name="id" value="0" />
	        <div class="col-md-4">
	        	<label>RST No</label>
	        	<input type="text" class="form-control " id="rst" name="rst" placeholder="Auto">
	        </div>

	        <div class="col-md-4">
	        	<label>Date</label>
	        	<input type="date" class="form-control " id="date" name="date" placeholder="">
	        </div>
	
	        <div class="col-md-4">
	        	<label>Vehicle No</label>
	        	<input type="email" class="form-control " id="vehicleNo" name="vehicleNo" placeholder="Vh No">
	        </div>
        </div>
        <div class="form-row">
	        <div class="col-md-4">
	        	<label>Vehicle Type</label>
	        	 <input type="text" class="form-control " id="vehicleType" name="vehicleType" placeholder="" >
	        </div>
	        <div class="col-md-4">
	        	<label>Customer</label>
	        	<input type="text" class="form-control " name="customer" id="customer" placeholder="">
	        </div>
	        <div class="col-md-4">
	        	<label>Address</label>
	        	<textarea class="form-control " id="address" name="address"></textarea>
	        </div>
	    </div>
	    <div class="form-row">
	        <div class="col-md-4">
	        	<label>Mobile No</label>
	        	<input type="text" class="form-control " id="mobile" name="mobile" placeholder="" >
	        </div>
	        <div class="col-md-4">
	        	<label>Material</label>
	        	<input type="text" class="form-control " id="material" name="material" placeholder="">
	        </div>
        </div>
        <div class="form-row">
	        <div class="col-md-4">
	        	<label>Gross Weight : </label>
	        	<input type="text" class="form-control  " id="gross" name="gross" placeholder="" value="0.0">
	        	<input type="text" class="form-control  " id="tare" name="grossWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
	        
	         <div class="col-md-4">
	        	<label>Tare Weight : </label>
	            <input type="text" class="form-control  " id="tare" name="tare" placeholder="" value="0.0">
	            <input type="text" class="form-control  " id="tare" name="tareWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
	        
	        <div class="col-md-4">
	            <label>Net Weight : </label>
	            <input type="text" class="form-control  " id="net" name="net" placeholder="" value="0.0">
	            <input type="text" class="form-control  " id="tare" name="netWtTime" placeholder="Date & Time" value="0001-01-01" readonly="readonly">
	        </div>
        </div>
        <div class="form-row">
        <div class="col-md-4">
        	<label>Weigh Rate :</label>
        	<input type="text" class="form-control " name="weighRate">
        </div>
        </div>
        <div class="form-row">
        <div class=col-md-12>
        <div class="d-flex justify-content-end">
        		<button type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp">Fetch RST</button>
  				<button type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp" onclick="submitRSTEntry()">Submit</button>
  				<button type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp" data-toggle="modal" data-target="#modalLoginForm">Reset</button>
  				<button type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp">Print</button>
  				<button type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp">PDF</button>
  				<button id="addCustomer" type="button" class="btn btn-primary btn-sm btn-mr-rt btn-mr-tp" data-toggle="modal" data-target="#exampleModalCenter">call here</button>
        </div>
        </div>
        </div>
        </form>
        </div>
        </div>
        
  
    <div class="col-md-4">
    <div class="tile-background">
      <h3 class="text-center">RST Pending for Tare Weight</h3>
      <div class="col-md-12 scroll" >
        <input class="form-control mr-sm-2" type="search" placeholder="Enter RST To Search" aria-label="Search">
        <table class="table">
          <thead class="thead-dark">
              <tr>
                <th>RST</th>
                <th>Gross Weight</th>
                <th>Net Weight</th>
              </tr>
          </thead>
          <tbody>
        <tr>
          <td>01</td>
          <td>2000 kg</td>  
          <td>1000 Kg</td>     
        </tr>
        <tr>
            <td>01</td>
            <td>2000 kg</td>  
            <td>1000 Kg</td>     
          </tr>
          <tr>
              <td>01</td>
              <td>2000 kg</td>  
              <td>1000 Kg</td>     
            </tr>
            <tr>
                <td>01</td>
                <td>2000 kg</td>  
                <td>1000 Kg</td>     
              </tr>
              <tr>
                  <td>01</td>
                  <td>2000 kg</td>  
                  <td>1000 Kg</td>     
                </tr>
                <tr>
                    <td>01</td>
                    <td>2000 kg</td>  
                    <td>1000 Kg</td>     
                  </tr>
                  <tr>
                      <td>01</td>
                      <td>2000 kg</td>  
                      <td>1000 Kg</td>     
                    </tr>
           </tbody>
      </table>
      </div>
    </div>
    </div>
    </div>
  	<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
<nav class="navbar navbar-default navbar-static-bottom footer border-top">
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
	settingHeightofAdjacentPanels("getHeight","scroll");//getting & setting height of panels
//Submit RST Weigh Bridge Form
function submitRSTEntry(){
	document.getElementById("newRST").submit();	
}


//Submit New Customer Form
function submitNewCustomer(){
	
	var newCustomerName = document.getElementById("newCustomerName").value;
	var newCustomerMobile = document.getElementById("newCustomerMobile").value;
	var newCustomerAddress = document.getElementById("newCustomerAddress").value;
	
	//var newCustomerJson = {"name":newCustomerName,"moile":newCustomerMobile,"address":newCustomerAddress};
	
	saveCustomerRequest(newCustomerName,newCustomerMobile,newCustomerAddress);
}


//Create AJAX Request for new customer form submission
function saveCustomerRequest(newCustomerName,newCustomerMobile,newCustomerAddress){
	var url="../processing/addCustomer.jsp?name="+newCustomerName+"&mobile="+newCustomerMobile+"&address="+newCustomerAddress;
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
		
		var customer = JSON.parse(this.response);
		
		document.getElementById("id").value = customer.id;
		document.getElementById("customer").value = customer.name;
		document.getElementById("address").value = customer.address;
		document.getElementById("mobile").value = customer.mobile;
	}
}


//Check if the entered customer exists in DB
document.getElementById("mobile").addEventListener('keypress',function(e){
	if(e.keyCode === 13){
		checkEnteredCustomer();
	}
	
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
		var res = this.response;
		console.log(res);
		if(res.toString().trim() === 'false')
		{
			console.log("Customer not found, please add new customer!");
			addNewCustomer();
		}
		else{
			var customer = JSON.parse(res);
			
			document.getElementById("id").value = customer.id;
			document.getElementById("customer").value = customer.name;
			document.getElementById("address").value = customer.address;
			document.getElementById("mobile").value = customer.mobile;
			
			console.log("Customer found"+ customer);
		}
	}
}


//Open Add new customer form popup
function addNewCustomer(){
	
	var name = document.getElementById("customer").value;
	var address = document.getElementById("address").value;
	var mobile = document.getElementById("mobile").value;
	
	document.getElementById("addCustomer").click();
	
	document.getElementById("newCustomerName").value = name;
	document.getElementById("newCustomerMobile").value = mobile;
	document.getElementById("newCustomerAddress").value = address;
	
}

</script>
</body>
</html>

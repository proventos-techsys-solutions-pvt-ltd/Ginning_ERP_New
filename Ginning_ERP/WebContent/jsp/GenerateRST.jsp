<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>RST Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="../styles/WBStyle.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="height:100%;">
  <nav class="navbar navbar-default navbar-static-top cusotm-navbar">
      <a class="navbar-brand" href="#">Company Logo</a>
      
        
  </nav>
  <div class="container-fluid">
    <div class="row">
    <div class="col-md-12"><h4 class="text-center custom-margin">Company name goes here</h4></div>
    <div class="col-md-8 custom-border">
      <h4 class="text-center custom-form-title" >Generate RST</h4>
      <form id="newRST">
      	<input type="hidden" id="id" name="id" />
        <div class="form-group col-md-3"><label>RST No</label></div>
        <div class="form-group col-md-3">
            <input type="text" class="form-control" id="rst" name="rst" placeholder="Auto">
        </div>
        <div class="form-group col-md-3"><label>Date</label></div>
        <div class="form-group col-md-3">
            <input type="date" class="form-control" id="date" name="date" placeholder="">
        </div>
        <div class="form-group col-md-3"><label>Vehicle No</label></div>
        <div class="form-group col-md-3">
            <input type="email" class="form-control" id="vehicleNo" name="vehicleNo" placeholder="Vh No">
        </div>
        <div class="form-group col-md-3"><label>Vehicle Type</label></div>
        <div class="form-group col-md-3">
            <input type="text" class="form-control" id="vehicleType" name="vehicleType" placeholder="">
        </div>
        <div class="form-group col-md-3"><label>Customer</label></div>
        <div class="form-group col-md-3">
            <input type="text" class="form-control" name="customer" id="customer" placeholder="">
        </div>
        <div class="form-group col-md-3"><label>Address</label></div>
        <div class="form-group col-md-3">
            <input type="textarea" class="form-control" id="address" name="address" placeholder="">
        </div>
        <div class="form-group col-md-3"><label>Material</label></div>
        <div class="form-group col-md-3">
            <input type="text" class="form-control" id="material" name="material" placeholder="">
        </div>
        <div class="form-group col-md-3"><label>Mobile No</label></div>
        <div class="form-group col-md-3">
            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="" onchange="getCustomerData()">
        </div>
      </form>
      
        <table class="col-md-12 table table-borderless  custom-table">
          <tr>
            <td scope="row"><label>Gross Weight : </label></td>
            <td><input type="text" class="form-control" id="gross" placeholder=""></td>
            <td>Date & Time</td>
          </tr>
          <tr>
            <td scope="row"><label>Tare Weight : </label></td>
            <td><input type="text" class="form-control" id="tare" placeholder=""></td>
            <td>Date & Time</td>
          </tr>
          <tr scope="row">
            <td><label>Net Weight : </label> </td>
            <td><input type="text" class="form-control" id="net" placeholder=""></td>
            <td>Date & Time</td>
          </tr>
          <tr scope="row">
            <td><label>Charges :</label></td>
            <td colspan="2"><input type="text" class="form-control"></td>
          </tr>
        </table>
        <div class="form-group col-md-2">
            <button type="button" class="btn btn-primary  custom-button">Fetch RST</button>
        </div>
        <div class="form-group col-md-2">    
            <button type="button" class="btn btn-primary  custom-button">Submit</button>
        </div>
        <div class="form-group col-md-2">  
            <button type="button" class="btn btn-primary  custom-button"
            data-toggle="modal" data-target="#modalLoginForm"
            >Reset</button>
        </div>
        <div class="form-group col-md-2">  
            <button type="button" class="btn btn-primary  custom-button">Print</button>
        </div>
        <div class="form-group col-md-2">  
            <button type="button" class="btn btn-primary  custom-button">PDF</button>
        </div>
        
         <div class="form-group col-md-2">  
            <button id="addCustomer" type="button" class="btn btn-primary  custom-button" data-toggle="modal" data-target="#exampleModalCenter">call here</button>
        </div>
        
  </div>
    <div class="col-md-4 custom-border">
      <h4 class="text-center custom-form-title">RST Pending for Tare Weight</h4>
      <div class="col-md-12" >
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
  	<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle">Add New Customer</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <form id="newCustomer" action="../processing/addCustomer.jsp">
		       	<div class="form-row">
		       	<div class="col-md-auto">
		       		<label>Name</label>
		       		<input type="text" id="newCustomerName" class="form-control form-control-sm" name="name">
		       		<label>Address</label>
		       		<textarea class="form-control form-control-sm" name="address" id="newCustomerAddress"></textarea>
		       	</div>	
		       	<div class="col-md-auto">
		       		<label>Mobile</label>
		       		<input type="tel" class="form-control form-control-sm" name="mobile" id="newCustomerMobile">
		       	</div>	
		       	</div>
		       </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" onclick="submitNewCustomer()">Add Customer</button>
		      </div>
		    </div>
		  </div>
		</div>
  
  </div>
</div>


<!--Footer code starts here-->
<nav class="navbar navbar-default navbar-static-bottom custom-footer">
  <div class="row">
    <div class="col-md-5">
        <table class="table  custom-table">
          <tr>
            <td class="custom-table-font-color"><label> No of Vehicles Inside Premises :</label> </td>
            <td><input type="text" class="" name="notgiven" value="" readonly></td>
          </tr>
          <tr>
              <td class="custom-table-font-color"><label> No of RST Pending for Tare Weight :</label> </td>
              <td><input type="text" class="" name="notgiven" value="" readonly></td>
          </tr>
          <tr>
              <td class="custom-table-font-color"><label> No of RST Cleared for Tare Weight :</label> </td>
              <td><input type="text" class="" name="notgiven" value="" readonly></td>
          </tr>
        </table>
    </div>
    <div class="col-md-12"><hr></div>
    <div class="col-md-4">
    
    </div>
    <div class="col-md-4"></div>
    <div class="col-md-4"><p class="text-right">Designed & Developed by Proventos</p></div>
  </div>
</nav>
</body>
<script>

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
		request=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		request=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
  
	try{  
		request.onreadystatechange=setNewCustomerData;  
		console.log("AJAX Req sent");
		request.open("GET",url,true);  
		request.send();  
	}catch(e){alert("Unable to connect to server");}
}


//Set data in RST form fields of newly added customer
function setNewCustomerData(){
	
	if(request.readyState==4){
		
		console.log("New Customer Added");
		
		var customer = JSON.parse(this.response);
		
		document.getElementById("id").value = customer.id;
		document.getElementById("customer").value = customer.name;
		document.getElementById("address").value = customer.address;
		document.getElementById("mobile").value = customer.mobile;
	}
}


//Check if the entered customer exists in DB
function checkEnteredCustomer(){
	
	var customerName = document.getElementById("customer").value;
	var mobile = document.getElementById("mobile").value;
	
	getCustomerData(customerName, mobile);
	
}


//Create AJAX Req to get the customer data from DB if the customer exists in it
function getCustomerData(customerName,mobile){
	
	var url="../processing/getCustomer.jsp?customerName="+customerName+"&mobileNo="+mobile;
	
	if(window.XMLHttpRequest){  
		request=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		request=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
  
	try{  
		request.onreadystatechange=checkCustomer;  
		console.log("AJAX Req sent");
		request.open("GET",url,true);  
		request.send();  
	}catch(e){alert("Unable to connect to server");}
}



//Set data in RST form if the customer exists in the DB
function checkCustomer(){
	if(request.readyState==4){
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
</html>

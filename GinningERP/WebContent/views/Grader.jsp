<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
    <title>Grading Operation</title>
  </head>
  <body>
   <%@include file="../views/NavBar.html" %>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-8 border-right col-md-margintop">
          <form action="">
            <div class="form-row">
              <div class="col-md-6">
                  <label>Authorized Grader Name</label>&nbsp;&nbsp;
                  <input type="search" class="form-control form-control-sm" name="authoGradeName" placeholder="Mr. ABC XYZ" readonly>
              </div>
              <div class="col-md-4"> 
              	<label for="">Search RST</label>&nbsp;&nbsp;
              	<div class="input-group">
                  	<input type="search" class="form-control form-control-sm" name="searchRst" placeholder="RST" id="searchRST">
              		<div class="input-group-append">
    				<button class="btn btn-outline-secondary btn-sm" type="button" onclick="fetchData(document.getElementById('searchRST').value)">Fetch</button>
    				</div>
    			</div>
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-6">
              <input type="hidden" id="customerID" name="customerID" />
              <input type="hidden" id="invoiceID" name="invoiceID" />
              <input type="hidden" id="vehicleID" name="vehicleID" />
                <label>Customer Name & Address</label>
                <textarea class="form-control form-control-lg" id="customerData" name="customerData"></textarea>
              </div>
              <div class="col-md-4">
                <label>Grade Record</label>
                <input type="text" class="form-control form-control-sm" placeholder="" id="gradeRST" name="gradeRST">
                <label>Date</label>
                <input type="date" class="form-control form-control-sm" placeholder="" id="date" name="date">
              </div>
              </div>
              <div class="form-row">
              <div class="col-md-12 col-md-margintop">
              <table class="table table-bordered custom-table">
                    <thead>
                      <tr>
                        <th>Sr No</th>
                        <th>Material</th>
                        <th>Quantity</th>
                        <th>Grade</th>
                        <th>Rate</th>
                        <th>Total</th> 
                      </tr>
                    </thead>
                    <tbody  id="gradeTable">
                      <tr>
                        <td>01</td>
                        <td>Cotton</td>
                        <td>100 Qtl</td>
                        <td>
                          <select name="grade" id="grade" class="form-control form-control-sm">
                            <option value="">Grade A</option>
                            <option value="">Grade B</option>
                            <option value="">Grade C</option>
                          </select>
                        </td>
                        <td><input type="text" class="form-control form-control-sm" id="rate" name="rate"></td>
                        <td>15000</td>
                      </tr>
                    </tbody>
                </table>
              </div>
              <div class="col-md-12">
                  <div class="d-inline-flex p-2 bd-highlight">
                      <button type="button" class="btn btn-primary btn-sm custom-button-submit">Submit</button>
                      <button type="button" class="btn btn-primary btn-sm custom-button-submit">PDF</button>
                  </div>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-4 col-md-margintop">
          <input type="text" class="form-control form-control-sm" placeholder="search">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>RST No</th>
                <th>Material</th>
                <th>Qty</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>4357</td>
                <td>Cotton</td>
                <td>100 Qntl</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	
	//Fetch data using RST
	function fetchData(rst){
		
		url = "../processing/getGraderData.jsp?rst="+rst;
		
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
			var response = this.response;
			console.log(response);
			
			var data =  JSON.parse(response);
			
			document.getElementById("customerData").value = data.name + "\n" + data.address + "\n" + data.mobile;
			document.getElementById("gradeTable").rows[0].cells[1].innerHTML = data.material;
			document.getElementById("gradeTable").rows[0].cells[2].innerHTML = data.gross;
			document.getElementById("customerID").value = data.cid
			document.getElementById("vehicleID").value = data.vid
			doument.getElementById("gradeRST").value = data.rst;
			
		}
			
	}
	
	</script>
  </body>
  </html>
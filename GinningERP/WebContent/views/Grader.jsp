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
    
    <div class="row justify-content-md-center mt-2 tile-background-row ">
                <div class="col-md-3">
                        <label class="lbl-rm-l">Today's Purchase Rate</label>
                        <input type="text" class="form-control form-control-sm" value="Today's Purchase Rate">
                    </div>
                <div class="col-md-3">
                        <label class="lbl-rm-l">Average Purchase Price</label>
                        <input type="text" class="form-control form-control-sm" value="Average Purchase Price">
                    </div>   
                </div>
            
            <div class="row mt-2 tile-background-row">
            	<div class="col-md-auto">
            		<h2>Grading</h2>
            	</div>
            </div>
    
      <div class="row mt-2">
        <div class="col-md-8">
        <div class="tile-background">
          <form action="">
            <div class="form-row">
              <div class="col-md-6">
                  <label>Authorized Grader Name</label>&nbsp;&nbsp;
                  <input type="search" class="form-control " name="authoGradeName" placeholder="Mr. ABC XYZ" readonly>
              </div>
              <div class="col-md-4"> 
              	<label for="">Search RST</label>&nbsp;&nbsp;
              	<div class="input-group">
                  	<input type="search" class="form-control " name="searchRst" placeholder="RST" id="searchRST">
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
                <input type="text" class="form-control " placeholder="" id="gradeRST" name="gradeRST">
                <label>Date</label>
                <input type="date" class="form-control " placeholder="" id="date" name="date">
              </div>
              </div>
              <div class="form-row">
              <div class="col-md-12">
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
                          <select name="grade" id="grade" class="form-control ">
                            <option value="">Grade A</option>
                            <option value="">Grade B</option>
                            <option value="">Grade C</option>
                          </select>
                        </td>
                        <td><input type="text" class="form-control " id="rate" name="rate"></td>
                        <td>15000</td>
                      </tr>
                    </tbody>
                </table>
              </div>
              <div class="col-md-12">
                  <div class="d-inline-flex p-2 bd-highlight">
                      <button type="button" class="btn btn-primary btn-sm btn-mr-rt">Submit</button>
                      <button type="button" class="btn btn-primary btn-sm btn-mr-rt">PDF</button>
                  </div>
              </div>
            </div>
          </form>
          </div>
        </div>
        <div class="col-md-4">
        <div class="tile-background-row">
          <input type="text" class="form-control " placeholder="search">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>RST No</th>
                <th>Customer Name</th>
                <th>Cotton Qty</th>
              </tr>
            </thead>
            <tbody id="tableBody">
              
            </tbody>
          </table>
          </div>
        </div>
      </div>
    </div>
    <!--Footer code starts here-->
	<nav class="navbar navbar-default navbar-static-bottom footer border-top">
	</nav>
 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	
	window.onload = function() {
		pendingGrade();
		};
	
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
			document.getElementById("gradeRST").value = data.rst;
			
		}
			
	}
	
	
	function pendingGrade(){
		
		var url="../processing/pendingGradingReport.jsp";
			
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
				var pendingGrade = this.response.trim();
				console.log(pendingGrade);
				setPendingData(pendingGrade);
			}
			
		}

		function setPendingData(pendingGrade){
			
			 var element = document.getElementById("tableBody");
		   
			 var jsonData = JSON.parse(pendingGrade);
			 
			 for(i=0;i<jsonData.length;i++){
			 
			   element.insertAdjacentHTML('beforeend','<tr>'+
					   '<td>'+(i+1)+'</td>'+
					    '<td>'+jsonData[i].rst+'</td>'+
					    '<td>'+jsonData[i].customerName+'</td>'+  
					    '<td>'+jsonData[i].gross+'</td>'+     
					   '</tr>');
			 }
			
		}
	
	</script>
  </body>
  </html>
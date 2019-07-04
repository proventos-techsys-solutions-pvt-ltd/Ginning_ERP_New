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
        <div class="row mt-2 tile-background-row">
        	<div class="col-md-12">
        		<div class="d-flex justify-content-between align-items-center">
		        	<div class="d-flex justify-content-start align-items-center">
		        		<img src="../property/img/bill.png" alt="recipt">&nbsp;
		        		<h4 class="lbl-rm-all">Goods Grading Note</h4>&nbsp;&nbsp;
		        	</div>
		        	<div class="d-flex justify-content-between align-items-center">	
		        		<h4 class="lbl-rm-all border receipt-no">GGN No : 0001</h4>
		        	</div>
	        	</div>
	        </div>
	        <div class="col-md-1 offset-md-8">
	        	
	        </div>
        </div>
        <div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<form>
				<input id="weighmentId" name="weighmentId" hidden="hidden" value="" />
					<div class="form-row form-row-ctm">
						<div class="col-md-auto">
							<label class="lbl-rm-all">RST No/GRN No</label>
							<div class="d-flex justify-content align-items-center">
								<input type="text" class="form-control form-control-sm" id="rst" name="rst">
								<button type="button" class="btn btn-success btn-sm btn-no-radius" onclick="fetchData(this.value)">Fetch</button>
							</div>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Material</label>
							<input type="text" class="form-control form-control-sm" id="material" name="material" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Quantity in Kg</label>
							<input type="text" class="form-control form-control-sm" id="quantity" name="quantity" >
						</div>
					</div>
					<div class="form-row form-row-ctm">
						<div class="col-md-2">
							<label class="lbl-rm-all">Vendor Name</label>
							<input type="text" class="form-control form-control-sm" id="vendorName" name="vendorName" readonly>
						</div>
						<div class="col-md-2">
							<label class="lbl-rm-all">Vendor Address</label>
							<input type="text" class="form-control form-control-sm" id="vendorAddress" name="vendorAddress" readonly>
						</div>
						<div class="col-md-2">
							<label class="lbl-rm-all">Mobile No</label>
							<input type="text" class="form-control form-control-sm" id="vendorMobile" name="vendorMobile" readonly>
						</div>
					</div>
					<div class="form-row form-row-ctm">
						<div class="col-md-12">
							<table class="table table-bordered">
								<thead>
									<tr class="table-back">
										<th width="5%" >Sr No</th>
										<th width="10%">Quantity</th>
										<th width="20%">Grade</th>
										<th>Grade Description</th>
										<th width="7%">Moisture</th>
										<th width="5%"></th>
									</tr>
								</thead>
								<tbody id="tableBody">
									 <tr>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="" name="srNo" value="1" ></td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="tblQty" name="dividedQuantity" value="" ></td>
										<td>
											<select class="form-control form-control-sm lbl-rm-all" id="" name="grade">
												<option>Grade A</option>
												<option>Grade B</option>
												<option>Grade C</option>
											</select>
										</td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="" name="description" ></td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="" name="moisture" ></td>
										<td></td>
									</tr> 
								</tbody>
							</table>
						</div>
					</div>
					<div class="form-row form-row-ctm border-top">
						<div class="col-md-1 offset-md-10 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button ">Save</button>
							</div>
						</div>
						<div class="col-md-1 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button ">Save & Print</button>
							</div>
						</div>
					</div>
				</form>
			</div>
        </div>
   </div>
   
   
   	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	//Global variables
	var totalQuantity = 0;
	var tableQuantityGlobal = 0;
	
	//Set data in the first row
	document.getElementById("quantity").addEventListener("change",function(){
		/*USING AJAX BRING THE DEFUALT GRADE VALUE FROM DATABASE*/
		var defaultGrade ="Grade A";
		var defaultGradeDescription = "Grade A Description";
		totalQuantity = document.getElementById("quantity").value;
		
		var table = document.getElementById("tableBody");
		document.getElementById("tblQty").value = totalQuantity;
		
			
	})
	
	
	
	//Add  rows to the Grading table dynamically
	document.addEventListener("change",function(e){
		if(e.srcElement.id == 'tblQty' && e.srcElement.value != "0" && e.srcElement.value != ""){
	
		console.log("total QTY --- "+totalQuantity );
				var table = document.getElementById("tableBody");
				var noOfRows = document.getElementsByName("dividedQuantity").length;
				var remainingQuantity = totalQuantity;
				
				
				for(var i=0;i<document.getElementsByName("dividedQuantity").length;i++){
					
					remainingQuantity = remainingQuantity - document.getElementsByName("dividedQuantity")[i].value ;
				}
				console.log("Remaining Qty --- "+remainingQuantity);
				if(remainingQuantity >= 0){
					var row = table.insertRow(tableBody.children.length);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					var cell5 = row.insertCell(4);
					var cell6 = row.insertCell(5);
				
					cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='' name='srNo' value="+(noOfRows+1)+">";
					cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='tblQty' name='dividedQuantity' value="+remainingQuantity+">";
					cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='' name='grade'>"
										+	"<option>Grade A</option>"
										+	"<option>Grade B</option>"
										+	"<option>Grade C</option>"
										+	"</select>";
					cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='' name='description'>";
					cell5.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='' name='moisture'>";
					cell6.innerHTML = "<img src='../property/img/delete.png' alt='delete'>";
				
				}
				noOfRows = document.getElementsByName("dividedQuantity").length;
		}	
	
	})
	
	//Fetch data for grading using RST
	function fetchData(rst){
		
		url = "../processing/getWeighmentData.jsp?rst="+rst;
		
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
	
	//Set data in form fields of the page
	function getData(){
		
		if(fetchRequest.readyState == 4){
			var response = this.response;
			console.log(response);
			
			var data =  JSON.parse(response);
			
			document.getElementById("vendorName").value = data.vendorName;
			document.getElementById("vendorAddress").value = data.vendorAddress;
			document.getElementById("vendorMobile").value = data.vendorMobile;
			document.getElementById("material").value = data.material;
			document.getElementById("quantity").value = data.netWeight;
			document.getElementById("weighmentId").value = data.weighmentId;
		}
	}
	
	function submitGradingData(){
		
		JSONObject
	}
	
	
	</script>
  </body>
  </html>
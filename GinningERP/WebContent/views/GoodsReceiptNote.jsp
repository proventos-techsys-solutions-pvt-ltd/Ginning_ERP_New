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
        	<div class="col-md-3">
	        	<div class="d-flex justify-content-start align-items-center">
	        		<img src="../property/img/bill.png" alt="recipt">&nbsp;
	        		<h4>Goods Receipt Note</h4>
	        	</div>
	        </div>
	        <div class="col-md-1 offset-md-8">
	        	<h4>0001</h4>
	        </div>
        </div>
        <div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<form>
					<div class="form-row form-row-ctm">
						<div class="col-md-auto">
							<label class="lbl-rm-all">RST No/GRN No</label>
							<div class="d-flex justify-content align-items-center">
								<input type="text" class="form-control form-control-sm" id="" name="">
								<button type="button" class="btn btn-success btn-sm btn-no-radius">Fetch</button>
							</div>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Material</label>
							<input type="text" class="form-control form-control-sm" id="" name="" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Quantity in Kg</label>
							<input type="text" class="form-control form-control-sm" id="quantity" name="" >
						</div>
					</div>
					<div class="form-row form-row-ctm">
						<div class="col-md-2">
							<label class="lbl-rm-all">Vendor Name</label>
							<input type="text" class="form-control form-control-sm" id="" name="" readonly>
						</div>
						<div class="col-md-2">
							<label class="lbl-rm-all">Mobile No</label>
							<input type="text" class="form-control form-control-sm" id="" name="" readonly>
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
										<th width="5%"></th>
									</tr>
								</thead>
								<tbody id="tableBody">
									<tr>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="" name="tableData" ></td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="tblQty" name="tableData" ></td>
										<td>
											<select class="form-control form-control-sm lbl-rm-all" id="" name="tableData">
												<option>Grade A</option>
												<option>Grade B</option>
												<option>Grade C</option>
											</select>
										</td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="" name="tableData" ></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="form-row form-row-ctm border-top">
						<div class="col-md-12">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button">Save</button>
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
	
	document.getElementById("quantity").addEventListener("change",function(){
		/*USING AJAX BRING THE DEFUALT GRADE VALUE FROM DATABASE*/
		var defaultGrade ="Grade A";
		var defaultGradeDescription = "Grade A Description";
		totalQuantity = document.getElementById("quantity").value;
		
		var tableData = document.getElementsByName("tableData");
		tableData[0].value = 001;
		tableData[1].value = totalQuantity;
		tableData[2].value = defaultGrade;
		tableData[3].value = defaultGradeDescription;
		
		tableQuantityGlobal = tableData[1].value;
		console.log(tableQuantityGlobal + "Global");
	})
	
	document.getElementById("tblQty").addEventListener("change",function(){
		var tableQuantity = document.getElementById("tblQty").value;
		console.log(tableQuantity + "table QTY");
		console.log(totalQuantity + "total QTY")
		
			if(tableQuantity < totalQuantity){
				var table = document.getElementById("tableBody");
				var noOfRows = tableBody.children.length; 
				if(noOfRows === 1){
					var row = table.insertRow(1);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					var cell5 = row.insertCell(4);
				
					cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='' name='tableData'>";
					cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='' name='tableData'>";
					cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='' name='tableData'>"
										+	"<option>Grade A</option>"
										+	"<option>Grade B</option>"
										+	"<option>Grade C</option>"
										+	"</select>";
					cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='' name='tableData'>";
					cell5.innerHTML = "<img src='../property/img/delete.png' alt='delete'>";
				}
			}
				
	
	})
		
	</script>
  </body>
  </html>
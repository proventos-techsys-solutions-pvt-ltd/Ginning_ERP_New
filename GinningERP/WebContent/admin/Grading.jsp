<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Goods Grading Note</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
</head>

<body>
<%@include file="../admin/Top_Nav.html" %>

<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	  <div class="row row-background border-bottom">
        	<div class="col-md-12">
        		<div class="d-flex justify-content-between align-items-center">
		        	<div class="d-flex justify-content-start align-items-center">
		        		<img src="../property/img/bill.png" alt="recipt">&nbsp;
		        		<h4 class="lbl-rm-all">Goods Grading Note</h4>&nbsp;&nbsp;
		        	</div>
	        	</div>
	        </div>
	        <div class="col-md-1 offset-md-8">
	      </div>
	     <div hidden>
		   <%
		    out.print(session.getAttribute("gradeSubmitFlag"));
		    session.removeAttribute("gradeSubmitFlag");
			%>
		</div>  
        </div>
        <select id="gradeRate" hidden>
        	<c:GradeRate/>
        </select>
        
        <div class="row row-background">
			<div class="col-md-12">
				<form id="gradeForm" action=''>
					<input hidden="hidden" id="output" name="output" value=""/>
				</form>
				<input type="hidden" id="weighmentId" name="weighmentId"  value="0" />
					<div class="form-row form-row-ctm">
						<div class="col-md-auto">
							<label class="lbl-rm-all">RST No/GRN No</label>
							<div class="d-flex justify-content align-items-center">
								<input type="text" class="form-control form-control-sm" id="rst" name="rst">
								<button type="button" class="btn btn-success btn-sm btn-no-radius" onclick="fetchData(document.getElementById('rst').value)">Fetch</button>
							</div>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Material</label>
							<input type="text" class="form-control form-control-sm" id="material" name="material" readonly>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Quantity in Kg</label>
							<input type="text" class="form-control form-control-sm" id="quantity" name="quantity" value="" readonly/>
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Authorizer</label>
							<input type="text" class="form-control form-control-sm" id="authorizer" name="authorizer" value="NA" >
						</div>
					</div>
					<div class="form-row">
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
						<div class="col-md-2">
							<label class="lbl-rm-all">Membership</label>
							<input type="text" class="form-control form-control-sm" id="vendorMembership" name="vendorMembership" readonly>
						</div>
						<div class="col-md-2">
							<label class="lbl-rm-all">Blacklisted</label>
							<input type="text" class="form-control form-control-sm" id="vendorBlacklisted" name="vendorBlacklisted" readonly>
						</div>
						<div class="col-md-2">
							<label class="lbl-rm-all">Bonus Amount per Quintal</label>
							<input type="text" class="form-control form-control-sm" id="bonusAmount" name="bonusAmount" value="0" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-12">
							<table class="table table-bordered">
								<thead>
									<tr class="table-back">
										<th width="5%" >Sr No</th>
										<th width="10%">Quantity in Kg</th>
										<th width="20%">Grade</th>
										<th>Grade Description</th>
										<th width="7%">Moisture</th>
										<th width="8%">Rate per Qtl</th>
										<th width="5%" class="text-center">PDC</th>
										<th width="5%" class="text-center"></th>
									</tr>
								</thead>
								<tbody id="tableBody">
									 <%-- <tr>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="srNo1" name="srNo1" value="1" ></td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="tblQty1" name="dividedQuantity" value="" ></td>
										<td>
											<select class="form-control form-control-sm lbl-rm-all" id="grade1" name="grade1">
												<option>Select</option>
												<c:Grade />
											</select>
										</td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="description1" name="description1" ></td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="moisture1" name="moisture1" ></td>
										<td><input type="text" class="form-control form-control-sm lbl-rm-all" id="rate1" name="rate1" ></td>
										<td></td>
									</tr> --%> 
								</tbody>
							</table>
						</div>
					</div>
					</div>
					</div>
					<div class="row row-background">
						<div class="col-md-2">
							<label>PDC Bonus per qtl. per month</label>
							<input type="text" id="pdcRate" name="pdcRate" class="form-control form-control-sm" value="50">
						</div>
						<div class="col-md-auto">
							<label>PDC Months</label>
							<select  id="pdcMonths" name="pdcMonths" class="form-control form-control-sm" >
								<option>0</option>
								<option selected>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
							</select>
						</div>
						<div class="col-md-2">
							<label>PDC Date</label>
							<input type="date" id="pdcDate" name="pdcDate" class="form-control form-control-sm" value="">
						</div>
						<div class="col-md-2">
							<label>Total PDC Bonus</label>
							<input type="text" id="pdcBonusAmount" name="pdcBonusAmount" class="form-control form-control-sm" value="0" readonly>
						</div>
						<div class="col-md-2">
							<label>Total PDC Amount</label>
							<input type="text" id="pdcAmount" name="pdcAmount" class="form-control form-control-sm" value="0" readonly>
						</div>
						<div class="col-md-2 offset-md-1">
							<label for="" class="lbl-rm-all">Total Amount</label> 
	                        <input type="text" id="totalAmount" name="totalAmount" class="form-control form-control-sm" value="0" readonly="readonly">
						</div>
					</div>
					</div>
					<div class="form-row border-top">
						<div class="col-md-1 offset-md-10 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button " id="submitGrades" onclick="submitGradingData()">Approve</button>
							</div>
						</div>
						<div class="col-md-1 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button " id="updateGrades"  disabled>Update</button>
							</div>
						</div>
					</div>
		

<!-- <script src="../js/jquery-3.3.1.slim.min.js" ></script> -->
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
//***********************VALIDATIONS**********************************
var appController = (function(){
	var namesAndIds = {
		rstId : "rst",
		rstName : "rst",
		gradeId : "grade1",
		gradeName : "grade",
		moistureId : "moisture1",
		moistureName : "moisture"
}

})();

//***********************VALIDATIONS ENDED****************************


//Send AJAX req to chech Daily setup
function checkDailySetup(){
	var url="../processing/checkDailySetup.jsp";
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
		if(Number(response) > 0){
			$.unblockUI
		}
		else if(Number(response) <= 0){
			$.blockUI();
		}
	} 
}

function fetchBonusRate(){
	var url="${pageContext.request.contextPath}/processing/getLatestBonusRate.jsp";
	if(window.XMLHttpRequest){  
		fetchBonus=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchBonus=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchBonus.onreadystatechange=getBonusAmount;  
		console.log("AJAX Req sent");
		fetchBonus.open("GET",url,true);  
		fetchBonus.send();  
	}catch(e){alert("Unable to connect to server");}
}

function getBonusAmount(){
	if(fetchBonus.readyState == 4){
		console.log("bonus ---" +this.response.trim());
		document.getElementById("bonusAmount").value = this.response.trim();
	}
}

//Global variables
var totalQuantity = 0;
var tableQuantityGlobal = 0;

//Set data in the first row
document.getElementById("quantity").addEventListener("change",function(){
	/*USING AJAX BRING THE DEFUALT GRADE VALUE FROM DATABASE*/
	setFirstRowData()
})


//Set data for Grading
function setDataForNewGrading(data){
	document.getElementById('tableBody').innerHTML = '';
	var blacklisted;
	var membership;
	console.log(data);
	document.getElementById("vendorName").value = data[0].vendorName;
	document.getElementById("vendorAddress").value = data[0].vendorAddress;
	document.getElementById("vendorMobile").value = data[0].vendorMobile;
	document.getElementById("material").value = data[0].material;
	document.getElementById("quantity").value = data[0].netWeight;
	document.getElementById("weighmentId").value = data[0].weighmentId;

	if(Number(data[0].vendorBlacklisted) === 1){
		blacklisted = 'YES';
	}else if(Number(data[0].vendorBlacklisted) === 0){
		blacklisted = 'NO';
	}
	if(Number(data[0].vendorMembership) === 1){
		membership = 'YES';
	}else if(Number(data[0].vendorMembership) === 0){
		membership = 'NO';
	}
	
	document.getElementById("vendorBlacklisted").value = blacklisted;
	document.getElementById("vendorMembership").value = membership;
	
	totalQuantity = document.getElementById("quantity").value;
	
	var table = document.getElementById("tableBody");
	
	
	var row = table.insertRow(tableBody.children.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	var cell4 = row.insertCell(3);
	var cell5 = row.insertCell(4);
	var cell6 = row.insertCell(5);
	var cell7 = row.insertCell(6);
	var cell8 = row.insertCell(7);
	
	cell7.className = "text-center";
	cell8.className = "text-center";

	cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='srNo1' name='srNo' value='1'>";
	cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='tblQty1' name='dividedQuantity' value=''>";
	cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='grade1' name='grade'>"
						+	"<option>Select</option>"
						+	"<c:Grade />"
						+	"</select>";
	cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='description1' name='description'>";
	cell5.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='moisture1' name='moisture' value=''>";
	cell6.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='rate1' name='rate'>"
	cell7.innerHTML = "<input type='checkbox' class='' id='pdcCheck1' name='pdcCheck' value='false'>"					
	
	document.getElementById("tblQty1").value = totalQuantity;
	calculateTotal();
	
	document.getElementById("submitGrades").disabled=false;
	document.getElementById("updateGrades").disabled=true;
	
	
	}	



//Add  rows to the Grading table dynamically
document.addEventListener("change",function(e){
		
	var id = e.srcElement.id.toString();
	if(id.includes('tblQty') && e.srcElement.value != "0" && e.srcElement.value != ""){
	totalQuantity = document.getElementById("quantity").value;
	var quantityDivisions = document.getElementsByName('dividedQuantity');
	var sumOfQuantities = 0;
	for(j=0;j<quantityDivisions.length;j++){
		sumOfQuantities = Number(sumOfQuantities) + Number(quantityDivisions[j].value); 
	}
	if(sumOfQuantities >= totalQuantity){
		e.srcElement.value = totalQuantity - (sumOfQuantities - e.srcElement.value); 
		alert('Weight Division is greater then Net Quantity.');
	}else{
			var table = document.getElementById("tableBody");
			var noOfRows = document.getElementsByName("dividedQuantity").length;
			var remainingQuantity = totalQuantity;
			
			for(var i=0;i<document.getElementsByName("dividedQuantity").length;i++){
				//console.log(document.getElementsByName("dividedQuantity")[i].value);
				remainingQuantity = remainingQuantity - document.getElementsByName("dividedQuantity")[i].value ;
			}
			console.log("Remaining Qty --- "+remainingQuantity);
			if(remainingQuantity > 0){
				var row = table.insertRow(tableBody.children.length);
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				var cell6 = row.insertCell(5);
				var cell7 = row.insertCell(6);
				var cell8 = row.insertCell(7);
				
				cell7.className = "text-center";
				cell8.className = "text-center";
			
				cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='srNo"+(noOfRows+1)+"' name='srNo' value="+(noOfRows+1)+">";
				cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='tblQty"+(noOfRows+1)+"' name='dividedQuantity' value="+remainingQuantity+">";
				cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='grade"+(noOfRows+1)+"' name='grade'>"
									+	"<option>Select</option>"
									+	"<c:Grade />"
									+	"</select>";
				cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='description"+(noOfRows+1)+"' name='description'>";
				cell5.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='moisture"+(noOfRows+1)+"' name='moisture'>";
				cell6.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='rate"+(noOfRows+1)+"' name='rate' >"
				cell7.innerHTML = "<input type='checkbox' class='' id='pdcCheck"+(noOfRows+1)+"' name='pdcCheck' value='false'>";
				cell8.innerHTML = "<img src='../property/img/delete.png' alt='delete' id='deleteRow'>";
			
			}
			noOfRows = document.getElementsByName("dividedQuantity").length;
		}	
		calculateTotal();
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
		var response = this.response.trim();
		console.log(response);
		if(Number(response) === 0 ){
			window.alert("RST entered is either blank or 0.")
		}
		else if(Number(response) === 1){
			window.alert("Invalid RST.")
		}else if(Number(response) === 2){
			window.alert("Second Weighment is pending.")
		}else{
			var data = JSON.parse(response);
			if(Number(data[0].flag) === 0){
				setDataForNewGrading(data);
			}
			else if(Number(data[0].flag) > 0){
				setGradeUpdationData(data);
			}
		}
	}
}

//Submit Grdaing data
function submitGradingData(){
	var netQuantity = document.getElementById("quantity").value;
	var quantityDivisions = document.getElementsByName('dividedQuantity');
	var sumOfQuantities = 0;
	for(j=0;j<quantityDivisions.length;j++){
		sumOfQuantities = Number(sumOfQuantities) + Number(quantityDivisions[j].value); 
	}
	if(sumOfQuantities >= netQuantity){
		alert('Weight Division is greater then Net Quantity.');
	}else{
		var jsonObj = {};
		
		jsonObj['rst'] = document.getElementById('rst').value;
		jsonObj['material'] = document.getElementById("material").value;
		jsonObj['totalQuantity'] = document.getElementById("quantity").value;
		jsonObj['vendorName'] = document.getElementById("vendorName").value;
		jsonObj['vendorAddress'] = document.getElementById("vendorAddress").value;
		jsonObj['vendorMobile'] = document.getElementById("vendorMobile").value;
		jsonObj['weighmentId'] = document.getElementById("weighmentId").value;
		jsonObj['authorizer'] = document.getElementById("authorizer").value;
		jsonObj['bonusPerQtl'] = document.getElementById("bonusAmount").value;
		jsonObj['pdcMonths'] = document.getElementById("pdcMonths").value;
		jsonObj['pdcDate'] = document.getElementById("pdcDate").value;
		jsonObj['pdcRate'] = document.getElementById("pdcRate").value;
		
		var noOfRows = document.getElementById('tableBody').childElementCount;
		
		var gradeList=[];
		
		for(i=0;i<noOfRows;i++){
			grade={};
			
			 grade['srNo'] = document.getElementById('srNo'+(i+1)).value;
			 grade['quantity'] = document.getElementById('tblQty'+(i+1)).value;
			 grade['grade'] = document.getElementById('grade'+(i+1)).value;
			 grade['description'] = document.getElementById('description'+(i+1)).value;
			 grade['moisture'] = document.getElementById('moisture'+(i+1)).value;
			 grade['rate'] = document.getElementById('rate'+(i+1)).value;
			 if(document.getElementById('gradeId'+(i+1)) != null){
				 grade['gradeId'] = document.getElementById('gradeId'+(i+1)).value;
				}
			 grade['pdcCheck'] = document.getElementById('pdcCheck'+(i+1)).value;
		    
			 gradeList.push(grade);
		}
		jsonObj['gradeList']=gradeList;
		
		console.log(jsonObj);
		
		var jsonStr = JSON.stringify(jsonObj);
		
		document.getElementById('output').value=jsonStr;
		
		document.getElementById('gradeForm').submit();
	}
}


//Function to delete rows in grade table
function deleteGradeEntry(index){
	var element = document.getElementById('tableBody');
	var qty1 = Number(element.rows[(index-2)].cells[1].children[0].value);
	
	var qty2 = Number(element.rows[index-1].cells[1].children[0].value);
	
	element.rows[(index-2)].cells[1].children[0].value = (qty1+qty2);
	
	document.getElementById('tableBody').deleteRow(index-1);
	calculateTotal();
	
}

//Event for deleting rows in Grade Table
document.addEventListener('click',function(e){
	if(e.srcElement.tagName.toString().includes("img") || e.srcElement.id.toString().includes("deleteRow")){
		deleteGradeEntry(e.srcElement.parentNode.parentNode.rowIndex);
	}
});


//Set data for which rates has already been submitted
function setGradeUpdationData(data)
{
	document.getElementById('tableBody').innerHTML = '';
	
	var blacklisted;
	var membership;
	document.getElementById("pdcAmount").value = 0;
	document.getElementById("vendorName").value = data[0].customerName;
	document.getElementById("vendorAddress").value = data[0].customerAddress;
	document.getElementById("vendorMobile").value = data[0].customerMobile;
	document.getElementById("material").value = data[0].material;
	document.getElementById("quantity").value = data[0].netWeight;
	document.getElementById("weighmentId").value = data[0].weighmentId;
	document.getElementById("authorizer").value = data[0].authorizer;
	document.getElementById("bonusAmount").value = data[0].bonusPerQtl;
	
	if(Number(data[0].customerBlacklisted) === 1){
		blacklisted = 'YES';
	}else if(Number(data[0].customerBlacklisted) === 0){
		blacklisted = 'NO';
	}
	if(Number(data[0].customerMembership) === 1){
		membership = 'YES';
	}else if(Number(data[0].customerMembership) === 0){
		membership = 'NO';
	}
	
	document.getElementById("vendorBlacklisted").value = blacklisted;
	document.getElementById("vendorMembership").value = membership;
	
	var noOfRows = data.length;
	console.log(noOfRows);
	
	var table = document.getElementById("tableBody");
	
	var totalQty = 0
	
	for(i=0; i<noOfRows; i++ ){
	
		var row = table.insertRow(i);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		var cell6 = row.insertCell(5);
		var cell7 = row.insertCell(6);
		var cell8 = row.insertCell(7);
		var cell9 = row.insertCell(8);
		cell9.setAttribute('hidden',true);
		cell7.className = "text-center";
		cell8.className = "text-center";
	
		cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='srNo"+(i+1)+"' name='srNo' value="+(i+1)+">";
		cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='tblQty"+(i+1)+"' name='dividedQuantity' value="+data[i].quantity+">";
		cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='grade"+(i+1)+"' name='grade'>"
							+	"<option>Select</option>"
							+	"<c:Grade />"
							+	"</select>";
		var textToFind = data[i].grade;	
		var gradeDD = document.getElementById("grade"+(i+1)+"");
		for ( j = 0; j < gradeDD.options.length; j++) {
		    if (gradeDD.options[j].text === textToFind) {
		    	gradeDD.selectedIndex = j;
		        var description = gradeDD.options[j].getAttribute('data-description');
		        break;
			}
		}
		
		cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='description"+(i+1)+"' name='description' value='"+description+"'>";
		cell5.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='moisture"+(i+1)+"' name='moisture' value="+data[i].moisture+">";
		cell6.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='rate"+(i+1)+"' name='rate' value="+data[i].rate+" >";
							
		if(i>0){
			cell8.innerHTML = "<img src='../property/img/delete.png' class='delete-row' alt='delete' id='deleteRow"+(i+1)+"'>";
		}
		if(data[i].pdcAmount>0){
			cell7.innerHTML = "<input type='checkbox' class='' id='pdcCheck"+(i+1)+"' name='pdcCheck' value='true'>";
			document.getElementById("pdcCheck"+(i+1)).checked = true;
			document.getElementById("pdcAmount").value = Number(document.getElementById("pdcAmount").value) + Number(Number(data[i].pdcAmount) * (Number(data[i].quantity)/100)) + Number((Number(data[i].quantity)/100)*Number(data[i].rate));
			document.getElementById("pdcDate").value = data[i].pdcDate;
			var date2 = new Date(data[i].pdcDate);
			var date1 = new Date(data[i].weighmentDate);
			document.getElementById("pdcMonths").value = date2.getMonth() - date1.getMonth() + (12 * (date2.getFullYear() - date1.getFullYear()));
				
		}
		else if(data[i].pdcAmount<=0)
		{
			cell7.innerHTML = "<input type='checkbox' class='' id='pdcCheck"+(i+1)+"' name='pdcCheck' value='false'>";
		}
		
		cell9.innerHTML = "<input type='hidden' id='gradeId"+(i+1)+"' name='gradeId' value='"+data[i].gradeId+"'>";
		
		totalQty = totalQty + Number(data[i].quantity);
		
		if(data[0].invoiceFlag == 1){
			var inputElements = document.getElementsByClassName('form-control');
			for(k=0;k<inputElements.length;k++){
				if((inputElements[k].id).includes('srNo') || (inputElements[k].id).includes('tblQty') || (inputElements[k].id).includes('description') || (inputElements[k].id).includes('moisture') || (inputElements[k].id).includes('quantity')){
					inputElements[k].setAttribute('readonly',false);
				}
			} 
			document.getElementById("submitGrades").disabled=true;
			document.getElementById("updateGrades").disabled=true;
		}else if(data[0].invoiceFlag == 0){
			document.getElementById("submitGrades").disabled=true;
			document.getElementById("updateGrades").disabled=false;
		}
	}
	
	document.getElementById("quantity").value = totalQty;
	
	if(data[0].invoiceFlag === 1){
		var inputElements = document.getElementsByTagName('input');
		for(i=0;i<inputElements.length;i++){
			if(inputElements[i].id != 'rst'){
				inputElements[i].disabled=true;
			}
		}
		var selectElements = document.getElementsByTagName('select');
		for(i=0;i<selectElements.length;i++){
			selectElements[i].setAttribute('disabled', '');
		}
		var deleteIcons = document.getElementsByClassName('delete-row');
		for(i=0;i<deleteIcons.length;i++){
			removeElement(deleteIcons[i]);
		}
		document.getElementById('rst').removeAttribute('readonly');
	}
	calculateTotal();
}

 // Removes an element from the document
function removeElement(element) {
    element.parentNode.removeChild(element);
}


//Set Grade Description and rate on selecting grade
document.addEventListener("change",function(e){
	if(e.srcElement.id.includes("grade"))
	{
		var selectedGrade = e.srcElement.options[e.srcElement.selectedIndex];
		var gradeId = selectedGrade.getAttribute('data-gradeId');
		var rowNo = e.srcElement.parentElement.parentElement.rowIndex;
		
		document.getElementById("description"+rowNo).value = selectedGrade.getAttribute('data-description');
		
		var options = document.getElementById("gradeRate").options;
		var noOfOptions = options.length;
		
		for(i=0; i< noOfOptions; i++){
			if(options[i].getAttribute('data-gradeid') === gradeId){
				document.getElementById("rate"+(rowNo)).value = options[i].value;
				break;
			}
		}
	}
});

function calculateTotal(){
	//var totalBonus = Number(document.getElementById("bonusAmount").value) * Number(document.getElementById("quantity").value /100) ;
	var rates = document.getElementsByName("rate");
	var total = 0;
	var qty = document.getElementsByName("dividedQuantity");
	for(i=0; i<rates.length; i++){
		total = total + (Number(rates[i].value) * (Number(qty[i].value)/100));
	}
		document.getElementById("totalAmount").value = total+Number(document.getElementById("pdcBonusAmount").value);
}

document.addEventListener('keyup', function(e){
	calculateTotal();
})

document.addEventListener('change', function(e){
	if(e.srcElement.name === "grade"){
	calculateTotal();
	}
})

document.getElementById("submitGrades").addEventListener('click',function(e){
	document.getElementById("gradeForm").action = "../processing/setGrade.jsp";
	submitGradingData();
})

document.getElementById("updateGrades").addEventListener('click', function(e){
	document.getElementById("gradeForm").action = "../processing/updateGrades.jsp";
	submitGradingData();
})

//Set Date for PDC
function setPDCDate(){
	let now = new Date()
	var noOfMonths = document.getElementById("pdcMonths").value;
	let next30days = new Date(now.setDate(now.getDate() + (30*Number(noOfMonths))))
	var dd = next30days.getDate();
    var mm = next30days.getMonth()+1; //January is 0!
    var yyyy = next30days.getFullYear();

    if(dd<10){
        dd='0'+dd;
    } 
    if(mm<10){
        mm='0'+mm;
    } 

    todayDate = yyyy+'-'+mm+'-'+dd; 
	document.getElementById("pdcDate").value = todayDate;
}

//Set PDC checkbox value
document.addEventListener('change', function(e){
	if(e.srcElement.name === 'pdcCheck'){
		var pdcAmount = document.getElementById("pdcAmount").value;
		var rowIndex = Number(e.srcElement.parentNode.parentNode.rowIndex)-1;
		var table = document.getElementById('tableBody');
		var ratePerQtl = table.rows[rowIndex].cells[5].children[0].value;
		var quantity = table.rows[rowIndex].cells[1].children[0].value;
		var qtyInQtl = Number(quantity)/100;
		var noOfMonths = document.getElementById("pdcMonths").value;
		var pdcRatePerMonth = document.getElementById("pdcRate").value;
		var pdcRate = Number(noOfMonths)*Number(pdcRatePerMonth);
		var pdcBonusAmount = (Number(pdcRate)*Number(qtyInQtl)).toFixed(2);
		var totalAmount = Number(Number(qtyInQtl) * Number(ratePerQtl))+Number(pdcBonusAmount);
		if(e.srcElement.value === 'false'){
			e.srcElement.value = 'true'
			document.getElementById('pdcBonusAmount').value = Number(document.getElementById('pdcBonusAmount').value) + Number(pdcBonusAmount);
			document.getElementById("pdcAmount").value = Number(pdcAmount)+ Number(totalAmount);
		}
		else if(e.srcElement.value === 'true'){
			e.srcElement.value = 'false'
			document.getElementById('pdcBonusAmount').value = Number(document.getElementById('pdcBonusAmount').value) - Number(pdcBonusAmount);
			document.getElementById("pdcAmount").value = Number(pdcAmount)- Number(totalAmount);
		}
		calculateTotal();
	}
})

function calculatePDCBonusOnMonthChange(){
	var noOfMonths = document.getElementById("pdcMonths").value;
	var pdcCheckBoxes = document.getElementsByName("pdcCheck");
	document.getElementById("pdcAmount").value = 0;
	document.getElementById('pdcBonusAmount').value = 0;
	for(i = 0; i< pdcCheckBoxes.length; i++){
		if(pdcCheckBoxes[i].value === 'true'){
			//document.getElementById("pdcAmount").value;
			var rowIndex = Number(pdcCheckBoxes[i].parentNode.parentNode.rowIndex)-1;
			var table = document.getElementById('tableBody');
			var ratePerQtl = table.rows[rowIndex].cells[5].children[0].value;
			var quantity = table.rows[rowIndex].cells[1].children[0].value;
			var qtyInQtl = Number(quantity)/100;
			var noOfMonths = document.getElementById("pdcMonths").value;
			var pdcRatePerMonth = document.getElementById("pdcRate").value;
			var pdcRate = Number(noOfMonths)*Number(pdcRatePerMonth);
			var pdcBonusAmount = Number(pdcRate)*Number(qtyInQtl);
			var totalAmount = Number(Number(qtyInQtl) * Number(ratePerQtl))+Number(pdcBonusAmount);
			document.getElementById('pdcBonusAmount').value =  Number(pdcBonusAmount);
			document.getElementById("pdcAmount").value = Number(document.getElementById("pdcAmount").value)+Number(totalAmount);
		}
	}
	calculateTotal();
}

document.getElementById("pdcMonths").addEventListener("change",function(e){
	setPDCDate();
	calculatePDCBonusOnMonthChange();
})

document.getElementById("pdcRate").addEventListener("change",function(e){
	calculatePDCBonusOnMonthChange();
})

setPDCDate();
checkDailySetup();
fetchBonusRate();


function responseScreen(){
	var responseId= document.getElementById("responseId").value;
	if(responseId>0){
		document.getElementsByClassName("response-background")[0].style.display = "block";
		document.getElementsByClassName("response")[0].style.display = "block";
	}else if(responseId===0){
		document.getElementsByClassName("response-background")[0].style.display = "block";
		document.getElementsByClassName("response")[0].style.display = "block";
		document.getElementById("responseText").querySelector("h4").innerHTML = "Company setup is unsuccessful";
	}else if(responseId===null){
		}
}


document.getElementById("responseBtn").addEventListener("click",function(){
	document.getElementsByClassName("response-background")[0].style.display = "none";
	document.getElementsByClassName("response")[0].style.display = "none";
	document.getElementById("responseId").value=0;
})

responseScreen();
</script>

</body>
</html>

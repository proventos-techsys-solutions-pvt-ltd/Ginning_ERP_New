<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
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
	        	</div>
	        </div>
	        <div class="col-md-1 offset-md-8">
	        	
	        </div>
        </div>
        <div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<form action='../processing/setGrade.jsp'>
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
							<input type="text" class="form-control form-control-sm" id="quantity" name="quantity" value="" />
						</div>
						<div class="col-md-auto">
							<label class="lbl-rm-all">Authorizer</label>
							<input type="text" class="form-control form-control-sm" id="authorizer" name="authorizer" >
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
						<div class="col-md-2">
							<label class="lbl-rm-all">Membership</label>
							<input type="text" class="form-control form-control-sm" id="vendorMembership" name="vendorMembership" readonly>
						</div>
						<div class="col-md-2">
							<label class="lbl-rm-all">Blacklisted</label>
							<input type="text" class="form-control form-control-sm" id="vendorBlacklisted" name="vendorBlacklisted" readonly>
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
										<th width="7%">Rate</th>
										<th width="5%"></th>
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
					<div class="form-row form-row-ctm border-top">
						<div class="col-md-1 offset-md-10 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button " onclick="submitGradingData()">Save</button>
							</div>
						</div>
						<div class="col-md-1 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button ">Save & Print</button>
							</div>
						</div>
					</div>
					
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
		setFirstRowData()
	})
	
	function setDataForNewGrading(data){
		document.getElementById('tableBody').innerHTML = '';
		var blacklisted;
		var membership;
		
		document.getElementById("vendorName").value = data[0].vendorName;
		document.getElementById("vendorAddress").value = data[0].vendorAddress;
		document.getElementById("vendorMobile").value = data[0].vendorMobile;
		document.getElementById("material").value = data[0].material;
		document.getElementById("quantity").value = data[0].netWeight;
		document.getElementById("weighmentId").value = data[0].weighmentId;
		if(data[0].vendorBlacklisted === '1'){
			blacklisted = 'YES';
		}else{
			blacklisted = 'NO'
		}
		if(data[0].vendorMembership === '1'){
			membership = 'YES';
		}else{
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
	
		cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='srNo1' name='srNo1' value='1'>";
		cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='tblQty1' name='dividedQuantity' value=''>";
		cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='grade1' name='grade1'>"
							+	"<option>Select</option>"
							+	"<c:Grade />"
							+	"</select>";
		cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='description1' name='description1'>";
		cell5.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='moisture1' name='moisture1' value=''>";
		cell6.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='rate1' name='rate1'>"
							+	"<option>Select</option>"
							+	"<c:GradeRate />"
							+	"</select>";
		cell7.innerHTML = "<img src='../property/img/delete.png' alt='delete' id='deleteRow'>";
		
		document.getElementById("tblQty1").value = totalQuantity;
		
		}	
	
	
	
	//Add  rows to the Grading table dynamically
	document.addEventListener("change",function(e){
			
		var id = e.srcElement.id.toString();
		if(id.includes('tblQty') && e.srcElement.value != "0" && e.srcElement.value != ""){
		totalQuantity = document.getElementById("quantity").value;
		console.log("total QTY --- "+totalQuantity );
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
				
					cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='srNo"+(noOfRows+1)+"' name='srNo"+(noOfRows+1)+"' value="+(noOfRows+1)+">";
					cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='tblQty"+(noOfRows+1)+"' name='dividedQuantity' value="+remainingQuantity+">";
					cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='grade"+(noOfRows+1)+"' name='grade"+(noOfRows+1)+"'>"
										+	"<option>Select</option>"
										+	"<c:Grade />"
										+	"</select>";
					cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='description"+(noOfRows+1)+"' name='description"+(noOfRows+1)+"'>";
					cell5.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='moisture"+(noOfRows+1)+"' name='moisture"+(noOfRows+1)+"'>";
					cell6.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='rate"+(noOfRows+1)+"' name='rate"+(noOfRows+1)+"' >"
										+	"<option>Select</option>"
										+	"<c:GradeRate />"
										+	"</select>";
					cell7.innerHTML = "<img src='../property/img/delete.png' alt='delete' id='deleteRow'>";
				
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
			var response = this.response.trim();
			console.log(response);
			
			var data = JSON.parse(response);
			
			if(Number(data[0].flag) === 0){
				setDataForNewGrading(data);
			}
			else if(Number(data[0].flag) > 0){
				setGradeUpdationData(data);
			}
		}
	}
	
	function submitGradingData(){
		
		var jsonObj = {};
		
		jsonObj['rst'] = document.getElementById('rst').value;
		jsonObj['material'] = document.getElementById("material").value;
		jsonObj['totalQuantity'] = document.getElementById("quantity").value;
		jsonObj['vendorName'] = document.getElementById("vendorName").value;
		jsonObj['vendorAddress'] = document.getElementById("vendorAddress").value;
		jsonObj['vendorMobile'] = document.getElementById("vendorMobile").value;
		jsonObj['weighmentId'] = document.getElementById("weighmentId").value;
		jsonObj['authorizer'] = document.getElementById("authorizer").value;
		
		
		var noOfRows = document.getElementById('tableBody').childElementCount;
		console.log('no of Rows --- '+noOfRows);
		
		var gradeList=[];
		
		for(i=0;i<noOfRows;i++){
			grade={};
			
			 grade['srNo'] = document.getElementById('srNo'+(i+1)).value;
			 grade['quantity'] = document.getElementById('tblQty'+(i+1)).value;
			 grade['grade'] = document.getElementById('grade'+(i+1)).value;
			 grade['description'] = document.getElementById('description'+(i+1)).value;
			 grade['moisture'] = document.getElementById('moisture'+(i+1)).value;
			 grade['rate'] = document.getElementById('rate'+(i+1)).value;
		    
			 gradeList.push(grade);
			 
		}
		jsonObj['gradeList']=gradeList;
		
		console.log(jsonObj);
		
		var jsonStr = JSON.stringify(jsonObj);
		
		document.getElementById('output').value=jsonStr;
		
		document.getElementsByTagName('form')[0].submit();
		
	}
	
	function deleteGradeEntry(index){
		
		var qty1 = Number(document.getElementById('tblQty'+(index-1)).value);
		
		var qty2 = Number(document.getElementById('tblQty'+(index)).value);
		
		document.getElementById('tblQty'+(index-1)).value = (qty1+qty2);
		
		document.getElementById('tableBody').deleteRow(index-1);
		
	}
	
	document.addEventListener('click',function(e){
		if(e.srcElement.tagName.toString().includes("img") || e.srcElement.id.toString().includes("deleteRow")){
			deleteGradeEntry(e.srcElement.parentNode.parentNode.rowIndex);
		}
	});
	
	
	function setGradeUpdationData(data)
	{
		document.getElementById('tableBody').innerHTML = '';
		
		var blacklisted;
		var membership;
		
		document.getElementById("vendorName").value = data[0].customerName;
		document.getElementById("vendorAddress").value = data[0].customerAddress;
		document.getElementById("vendorMobile").value = data[0].customerMobile;
		document.getElementById("material").value = data[0].material;
		document.getElementById("quantity").value = data[0].netWeight;
		document.getElementById("weighmentId").value = data[0].weighmentId;
		document.getElementById("authorizer").value = data[0].authorizer;
		
		if(data[0].vendorBlacklisted === '1'){
			blacklisted = 'YES';
		}else{
			blacklisted = 'NO'
		}
		if(data[0].vendorMembership === '1'){
			membership = 'YES';
		}else{
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
		
			cell1.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='srNo"+(i+1)+"' name='srNo"+(i+1)+"' value="+(i+1)+">";
			cell2.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='tblQty"+(i+1)+"' name='dividedQuantity' value="+data[i].quantity+">";
			cell3.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='grade"+(i+1)+"' name='grade"+(i+1)+"'>"
								+	"<option>Select</option>"
								+	"<c:Grade />"
								+	"</select>";
			var textToFind = data[i].grade;	
			var dd = document.getElementById("grade"+(i+1)+"");
			loop1:
			for ( j = 0; i < dd.options.length; j++) {
			    if (dd.options[j].text === textToFind) {
			        dd.selectedIndex = j;
			        var description = dd.options[j].getAttribute('data-description');
			        break loop1;
			    }
			}
			
			cell4.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='description"+(i+1)+"' name='description"+(i+1)+"' value='"+description+"'>";
			cell5.innerHTML = "<input type='text' class='form-control form-control-sm lbl-rm-all' id='moisture"+(i+1)+"' name='moisture"+(i+1)+"' value="+data[i].moisture+">";
			cell6.innerHTML = "<select class='form-control form-control-sm lbl-rm-all' id='rate"+(i+1)+"' name='rate"+(i+1)+"' >"
								+	"<option>"+data[i].rate+"</option>"
								+	"<c:GradeRate />"
								+	"</select>";
								
			if(i>0){
				cell7.innerHTML = "<img src='../property/img/delete.png' alt='delete' id='deleteRow'>";
			}
			totalQty = totalQty + Number(data[i].quantity);
			
		}
		
		document.getElementById("quantity").value = totalQty;
		
		if(data[0].invoiceFlag === 1){
			var inputElements = document.getElementsByTagName('input');
			for(i=0;i<inputElements.length;i++){
				inputElements[i].setAttribute('readonly', '')
			}
			var selectElements = document.getElementsByTagName('select');
			for(i=0;i<selectElements.length;i++){
				selectElements[i].setAttribute('disabled', '')
			}
		}
	}
	
	
	document.addEventListener("change",function(e){
		
		if(e.srcElement.id.includes("grade"))
		{
			
			var selectedGrade = e.srcElement.options[e.srcElement.selectedIndex];
			var gradeId = selectedGrade.getAttribute('data-gradeId');
			//console.log("gradeId --- "+gradeId);
			var rowNo = e.srcElement.parentElement.parentElement.rowIndex;
			//console.log("rowNo -- "+rowNo);
			
			document.getElementById("description"+rowNo).value = selectedGrade.getAttribute('data-description');
			
			var options = document.getElementById("rate"+rowNo).options;
			var noOfOptions = options.length;
			
			for(i=0; i< noOfOptions; i++){
				if(options[i].getAttribute('data-gradeid') === gradeId){
					options[i].selected = 'selected';
					break;
				}
			}
			
		}
		
	});
	
	</script>
  </body>
  </html>
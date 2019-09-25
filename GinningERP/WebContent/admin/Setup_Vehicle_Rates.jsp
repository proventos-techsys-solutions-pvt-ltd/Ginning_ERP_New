<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Setup Vehicle Rates</title>
</head>

<body>

<%@include file="../admin/Top_Nav.jsp" %>
<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	 <div hidden>
		   <%
		    out.print(session.getAttribute("weighRateId"));
		    session.removeAttribute("weighRateId");
			%>
		</div> 
		<div class="row row-background border-bottom">
			<div class="d-flex justify-content-between align-items-center">
				<img src="../property/img/vehicle.png" alt="Grade"/>&nbsp;
				<h4>Setup Vehicle Rates</h4>
			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-12">
				<form action="../processing/addVehiclesRate.jsp">
					<input type="hidden" id="output" name="output" />
				</form>
					<div class="form-row form-row-ctm">
						<div class="col-md-2">
							<label class="lbl-rm-l lbl-rm-t">Vehicle Name</label>
							<input type="text" class="form-control form-control-sm" id="vehicleName" name="vehicleName">
						</div>
						<div class="col-md-5">
							<label class="lbl-rm-l lbl-rm-t">Description</label>
								<input type="text" class="form-control form-control-sm" id="description" name="description">
						</div>
						<div class="col-md-2">
							<label class="lbl-rm-l lbl-rm-t">Rate</label>
							<div class="d-flex justify-content-between align-items-center">
								<input type="text" class="form-control form-control-sm" id="rate" name="rate">
								&nbsp;
								<button type="button" class="btn btn-success btn-sm" id="submitButton">Add</button>
							</div>
						</div>
					</div>
				
			</div>
		</div>
		<div class="row row-background">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr class="table-back">
							<th width="15%">Vehicle</th>
							<th>Description</th>
							<th>Rate</th>
							<th width="5%" class="text-center">Edit</th>
							<th width="5%" class="text-center">Delete</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- ***********************************POP UP FOR GRADING OPTION UPDATE, EDIT AND DELETE********************** -->
		<div class="modal fade" id="calledModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Grading</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		    	<form action="../processing/updateWeighRates.jsp">
		    	<input type="hidden" id="outputUpdate" name="outputUpdate" />
		    	</form>
		    	<input type="hidden" id="weighRateId" name="weighRateId" />
		    		<div class="form-row r-p-all">
		    			<div class="col-md-6">
		    				<label class="lbl-rm-l lbl-rm-t lbl-rm-b">Vehicle</label>
		    				<input type="text" class="form-control form-control-sm" id="vehicleNameUpdate" name="vehicleNameUpdate">
		    			</div>
		    			<div class="col-md-6">
		    				<label class="lbl-rm-l lbl-rm-t lbl-rm-b">Rate</label>
		    				<input type="text" class="form-control form-control-sm" id="updateRate" name="updateRate">
		    			</div>
		    		</div>
		    		<div class="form-row r-p-all">
		    			<div class="col-md-12">
		    				<label class="lbl-rm-l lbl-rm-t">Description</label>
		    				<textarea class="form-control form-control-sm" id="updateDescription" name="updateDescription">
		    				
		    				</textarea>
		    			</div>
		    		</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-success" data-dismiss="modal" id="submitUpdate">Save & Update</button>
		      </div>
		    </div>
		  </div>
	 
</div>
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
	
	window.onload = function() {
		weighRateReport();
	};
		
	
	document.getElementById('submitButton').addEventListener('click',function(e){
		submitDataNewEntry();
	})
	
	document.getElementById('submitUpdate').addEventListener('click',function(e){
		submitDataToUpdate();
	})
	
	function submitDataNewEntry(){
		var json={};
		
		json['vehicleName'] =  document.getElementById('vehicleName').value;
		json['description'] = document.getElementById('description').value;
		json['weighRate'] = document.getElementById('rate').value;
		
		document.getElementById('output').value = JSON.stringify(json);
		
		document.getElementsByTagName('form')[0].submit();
	}
	
	function submitDataToUpdate(){
		var json={};
		
		var element = document.getElementById('vehicleNameUpdate');
		
		json['vehicleTypeId'] = document.getElementById('weighRateId').value;
		json['vehicleNameUpdate'] = document.getElementById('vehicleNameUpdate').value;
		json['description'] = document.getElementById('updateDescription').value;
		json['rate'] = document.getElementById('updateRate').value;
		
		document.getElementById('outputUpdate').value = JSON.stringify(json);
		
		document.getElementsByTagName('form')[1].submit();
	}
	
		
		function weighRateReport(){
			var url="../processing/weighRateReport.jsp";
			
			if(window.XMLHttpRequest){  
				dataRequest=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				dataRequest=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				dataRequest.onreadystatechange=getWeighRateData;  
				console.log("AJAX Req sent");
				dataRequest.open("GET",url,true);  
				dataRequest.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		
	function getWeighRateData(){
		
		if(dataRequest.readyState == 4){
			var rateData = this.response.trim();
			console.log(rateData);
			setData(rateData);
		}
	}
	
	function setData(rateData){
		var json = JSON.parse(rateData);
		var element = document.getElementById('tableBody');
		for(i=0; i< json.length; i++){
			element.insertAdjacentHTML('beforeend','<tr>'+
					'<td hidden>'+json[i].id+'</td>'+
					'<td>'+json[i].vehicleName+'</td>'+
					'<td>'+json[i].vehicleDesc+'</td>'+
					'<td>'+json[i].weighrate+'</td>'+
					'<td id="edit" class="text-center"><img src="../property/img/edit.png" alt="edit"></td>'+
					'<td class="text-center"><img src="../property/img/delete.png" alt="delete" id="deleteRow"></td>'+
				'</tr>');
		}
		
	}
	
	document.addEventListener('click',function(e){
		if(e.srcElement.id === 'edit' || e.srcElement.alt==='edit'){
			var row;
			if(e.srcElement.id === 'edit' ){
				row = e.srcElement.parentNode;
				console.log(row);
			}else if(e.srcElement.alt==='edit'){
				row = e.srcElement.parentNode.parentNode;
				console.log(row);
			}
			
			document.getElementById('weighRateId').value = row.cells[0].innerHTML;
			document.getElementById('vehicleNameUpdate').value = row.cells[1].innerHTML;
			document.getElementById('updateDescription').value = row.cells[2].innerHTML;
			document.getElementById('updateRate').value = row.cells[3].innerHTML;
			
			
			$("#calledModal").modal();
		}
	});
	
	
	document.addEventListener("click", function(e){
		if(e.srcElement.alt==="delete"){
			var rowIndex = Number(e.srcElement.parentNode.parentNode.rowIndex)-1;
			var tableBody = document.getElementById("tableBody");
			var vehicleId = tableBody.rows[rowIndex].cells[0].innerHTML;
			deleteVehicle(vehicleId);//calling to delete entry method
		}
	});
	
	function deleteVehicle(vehicleId){
		var url="../processing/deleteVehicleRates.jsp?vehicleId="+vehicleId;
		
		if(window.XMLHttpRequest){  
			dataRequest=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			dataRequest=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	  
		try{  
			dataRequest.onreadystatechange=getReponse;  
			console.log("AJAX Req sent");
			dataRequest.open("GET",url,true);  
			dataRequest.send();  
		}catch(e){alert("Unable to connect to server");}
	}
			
	function getReponse(){
		if(dataRequest.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			if(Number(response) === 0){
				alert("Cannot Delete as invoice has been created for this vehicle Type.");
			}else if(Number(response) > 0){
				location.reload();
			}
		}
	}	
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
      <title>Setup Grading Rates</title>
   
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
		<div class="row mt-2 tile-background-row">
			<div class="d-flex justify-content-between align-items-center">
				<img src="../property/img/grade.png" alt="Grade"/>&nbsp;
				<h4>Setup Grading Levels</h4>
			</div>
		</div>
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<form action='../processing/addGradeLevels.jsp' id="form">
					<input type="hidden" name="output" id="output"/>
				</form>
					<div class="form-row form-row-ctm">
						<div class="col-md-2">
							<label class="lbl-rm-l lbl-rm-t">Grading Nomenclature</label>
							<input type="text" class="form-control form-control-sm" id="gradeName" name="gradeName" />
						</div>
						<div class="col-md-8">
							<label class="lbl-rm-l lbl-rm-t">Description</label>
							<div class="d-flex justify-content-between align-items-center">
								<input type="text" class="form-control form-control-sm" id="description" name="description">
								&nbsp;
								<button type="button" class="btn btn-success btn-sm" id="submitButton">Add</button>
							</div>
						</div>
					</div>
				
			</div>
		</div>
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<table class="table table-bordered">
					<thead>
						<tr class="table-back">
							<th width="15%">Grade</th>
							<th>Description</th>
							<th width="5%" class="text-center">Edit</th>
							<th width="5%" class="text-center">Delete</th>
							<th width="5%" class="text-center">Default</th>
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
		    	<form action="../processing/updateGradeLevels.jsp">
		    		<input type="hidden" id="outputUpdate" name="outputUpdate" />
		    	</form>
		    		<div class="form-row r-p-all">
		    			<div class="col-md-6">
		    				<label class="lbl-rm-l lbl-rm-t">Grade</label>
		    				<select class="form-control form-control-sm" id="gradeNameUpdate" name="gradeNameUpdate">
								<option disabled selected>Select</option>
								<c:Grade />
							</select>
		    			</div>
		    		</div>
		    		<div class="form-row r-p-all">
		    			<div class="col-md-12">
		    				<label class="lbl-rm-l lbl-rm-t">Description</label>
		    				<textarea class="form-control form-control-sm" id="descriptionUpdate" name="descriptionUpdate">
		    				
		    				</textarea>
		    			</div>
		    		</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-success" data-dismiss="modal" id="submitUpdate" >Save & Update</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	
	<!-- ********************************END OF POP UP MODAL CODE ************************************************* -->

	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/modal.js"></script>
	<script src="../js/commonjs.js"></script>
	<script>
	
	window.onload = function() {
		gradeReport();
	};
	
	document.getElementById('submitUpdate').addEventListener('click',function(e){
		submitDataToUpdate();
	})
	
	document.getElementById('submitButton').addEventListener('click',function(e){
		submitDataNewEntry();
	})
	
	function submitDataToUpdate(){
		var json={};
		
		var element = document.getElementById('gradeNameUpdate');
		
		json['gradeId'] = element.options[element.selectedIndex].getAttribute('data-gradeid');
		json['gradeName'] = element.options[element.selectedIndex].value;
		json['description'] = document.getElementById('descriptionUpdate').value;
		
		document.getElementById('outputUpdate').value = JSON.stringify(json);
		
		document.getElementsByTagName('form')[1].submit();
	}
	
	
	function submitDataNewEntry(){
		var json={};
		
		json['gradeName'] =  document.getElementById('gradeName').value;
		json['description'] = document.getElementById('description').value;
		
		document.getElementById('output').value = JSON.stringify(json);
		
		document.getElementsByTagName('form')[0].submit();
	}

	
	//Calling pop up for editing
	callModalPopup("callModal","calledModal");
		
		function gradeReport(){
			var url="../processing/gradeReport.jsp";
			
			if(window.XMLHttpRequest){  
				dataRequest=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				dataRequest=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				dataRequest.onreadystatechange=getGradeData;  
				console.log("AJAX Req sent");
				dataRequest.open("GET",url,true);  
				dataRequest.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		
	function getGradeData(){
		
		if(dataRequest.readyState == 4){
			var gradeData = this.response.trim();
			console.log(gradeData);
			setData(gradeData);
		}
	}
	
	function setData(gradeData){
		var json = JSON.parse(gradeData);
		var element = document.getElementById('tableBody');
		for(i=0; i< json.length; i++){
			element.insertAdjacentHTML('beforeend','<tr>'+
					'<td hidden>'+json[i].id+'</td>'+
					'<td>'+json[i].grade+'</td>'+
					'<td>'+json[i].desc+'</td>'+
					'<td id="callModal" class="text-center"><img src="../property/img/edit.png" alt="edit"></td>'+
					'<td class="text-center"><img src="../property/img/delete.png" alt="delete"></td>'+
					'<td class="text-center"><input type="radio" class="" id="" name=""  value=""></td>'+
				'</tr>');
		}
		
	}
			
	
	</script>
</body>
</html>
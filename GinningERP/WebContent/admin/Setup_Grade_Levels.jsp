<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Setup Grade Levels</title>
</head>

<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
  	<div class="container-fluid ">
		<div class="row  row-background border-bottom">
			<div class="d-flex justify-content-between align-items-center">
				<img src="../property/img/grade.png" alt="Grade"/>&nbsp;
				<h4>Setup Grading Levels</h4>
			</div>
		</div>
		<div class="row row-background">
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
		<div class="row row-background">
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
		    	<form id='updateGradeForm' action="../processing/updateGradeLevels.jsp">
		    		<input type="hidden" id="gradeId" name="gradeId" />
		    		<div class="form-row r-p-all">
		    			<div class="col-md-6">
		    				<label class="lbl-rm-l lbl-rm-t">Grade</label>
		    				<input type="text" class="form-control form-control-sm" id="gradeNameUpdate" name="gradeNameUpdate">
		    			</div>
		    		</div>
		    		<div class="form-row r-p-all">
		    			<div class="col-md-12">
		    				<label class="lbl-rm-l lbl-rm-t">Description</label>
		    				<textarea class="form-control form-control-sm" id="descriptionUpdate" name="descriptionUpdate">
		    				
		    				</textarea>
		    			</div>
		    		</div>
		    	</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-success" data-dismiss="modal" id="submitUpdate" >Save & Update</button>
		      </div>
		    </div>
		  </div>
	 </div>
	 
<!-- Response modal pop up -->
<div class="response-back-display"></div>
<div class="response-body">
	<div class="response-header">
		<h5>Information</h5>
	</div>
	<div class="response-content">
		<div class="d-flex justify-content-center align-items-center">
		<h5 id="response-text" class="ml-4"></h5>
		</div>
	</div>
	<div class="response-footer">
		<button type="button" class="btn btn-success btn-response" id="response-button">Ok</button>
	</div>
</div>	 
	 </div>
</div>	 
	 
<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/Validation.js"></script>
<script>

/***********************
 Form validation & Submission
 ***********************/
 $(document).ready(function(){
	$("#submitButton").click(function(){
		if($.fn.validateData($("#gradeName").val(),/^([A-Za-z0-9 ]+)$/)){
			if($.fn.validateData($("#description").val(),/(^[A-Za-z0-9 ]+)$/)){
				submitDataNewEntry();
			}else{
				$.fn.checkStatus(1,"Invalid grade description!")	
			}
		}else{
			$.fn.checkStatus(1,"Invalid grade name!")	
		}
	})
 })

	window.onload = function() {
		gradeReport();
	};
	
	function submitDataNewEntry(){
		var json={};
		
		json['gradeName'] =  document.getElementById('gradeName').value;
		json['description'] = document.getElementById('description').value;
		
		document.getElementById('output').value = JSON.stringify(json);
		
		document.getElementsByTagName('form')[0].submit();
	}
		
		function gradeReport(){
			var url="../processing/gradeMasterReport.jsp";
			
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
					'<td id="edit" class="text-center"><img src="../property/img/edit.png" alt="edit"></td>'+
					'<td class="text-center"><img src="../property/img/delete.png" alt="delete"></td>'+
					'<td class="text-center"><input type="radio" class="" id="" name=""  value=""></td>'+
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
			
			document.getElementById('gradeId').value = row.cells[0].innerHTML;
			document.getElementById('gradeNameUpdate').value = row.cells[1].innerHTML;
			document.getElementById('descriptionUpdate').value = row.cells[2].innerHTML;
			
			$("#calledModal").modal();
		}
	});
	
	document.getElementById('submitUpdate').addEventListener('click',function(e){
		document.getElementById('updateGradeForm').submit();
	});
	
	document.addEventListener("click", function(e){
		if(e.srcElement.alt==="delete"){
			var rowIndex = Number(e.srcElement.parentNode.parentNode.rowIndex)-1;
			var tableBody = document.getElementById("tableBody");
			var gradeId = tableBody.rows[rowIndex].cells[0].innerHTML;
			deleteGrade(gradeId);//calling to delete entry method
		}
	});
	
	function deleteGrade(gradeId){
		var url="../processing/deleteGrade.jsp?gradeId="+gradeId;
		
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
				$.fn.checkStatus(1,"Invoice already created for this grade!")
			}else if(Number(response) > 0){
				location.reload();
			}
		}
	}	
	/**************************************
	Response window code
	**************************************/
	var sessionId = {
			"getSessionId":<%=session.getAttribute("gradeId") %>,
	}
	$(document).ready(function(){
		$.fn.checkStatus(sessionId.getSessionId,"Grade successfully saved!")
	})
	
	$(document).ready(function(){
		$(".c-nav-collapse").click(function(){
				$(".sidebar").toggle(); 
				if($(".sidebar").css("display")==="none"){
					$(".row").css("margin-left","10px"); 
				}else{
					$(".row").css("margin-left","225px"); 
				}
				
		})
	})
	
			/***********************
			Side bar 
			************************/
			$(document).ready(function () {
			    $('#sidebarCollapse').on('click', function () {
			        $('#sidebar').toggleClass('active');
			    });
			});
	  <%	    session.removeAttribute("gradeId");		%>
	</script>
</body>
</html>
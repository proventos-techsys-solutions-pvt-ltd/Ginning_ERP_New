<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!doctype html>
<html lang="en">
    <head>
      <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="../styles/bootstrap.min.css">	
	  <link rel="stylesheet" href="../styles/WBStyle.css">
      <title>Daily Transactions Setup</title>
   
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
	<div class="container-fluid">
	<div hidden>
		   <%
		    out.print(session.getAttribute("gradeId"));
		    session.removeAttribute("gradeId");
			%>
		</div> 
		<div class="row mt-2 tile-background-row">
			<div class="d-flex justify-content-between align-items-center">
				<img src="../property/img/grade.png" alt="Grade"/>&nbsp;
				<h4>Setup Grading Levels</h4>
			</div>
		</div>
		<div class="row mt-2 tile-background-row">
			<div class="col-md-12">
				<form>
					<div class="form-row form-row-ctm">
						<div class="col-md-2">
							<label class="lbl-rm-l lbl-rm-t">Grading Nomenclature</label>
							<input type="text" class="form-control form-control-sm id="" name="">
						</div>
						<div class="col-md-8">
							<label class="lbl-rm-l lbl-rm-t">Description</label>
							<input type="text" class="form-control form-control-sm id="" name="">
						</div>
					</div>
				</form>
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
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Grade A</td>
							<td>Description of Grade A</td>
							<td id="callModal" class="text-center"><img src="../property/img/edit.png" alt="edit"></td>
							<td class="text-center"><img src="../property/img/delete.png" alt="delete"></td>
						</tr>
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
		    	<form>
		    		<div class="form-row r-p-all">
		    			<div class="col-md-6">
		    				<label class="lbl-rm-l lbl-rm-t">Grade</label>
		    				<input type="text" class="form-control form-control-sm" id="" name="">
		    			</div>
		    		</div>
		    		<div class="form-row r-p-all">
		    			<div class="col-md-12">
		    				<label class="lbl-rm-l lbl-rm-t">Description</label>
		    				<textarea class="form-control form-control-sm">
		    				
		    				</textarea>
		    			</div>
		    		</div>
		    	</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-success" data-dismiss="modal" >Save & Update</button>
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
		callModalPopup("callModal","calledModal");//Calling pop up for editing
	
	</script>
</body>
</html>
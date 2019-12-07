<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="../styles/css/all.css">
<title>Journal Entry</title>
</head>
<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	<div class="row row-background">
		<div class="col-md-2">
			<h4>Journal Entry</h4>
		</div>
	</div>

	<div class="row row-background">
		<div class="col-md-2 text-right">
			<label style="margin-bottom:0px;">Company Selected</label>
		</div>
		<div class="col-md-4">
			<select class="form-control  ml-2" >
			<option>Test</option>
			</select>
		</div>
	</div>
	
		<div class="row  row-background">
		<div class="col-md-2 text-right">
			<label style="margin-bottom:0px;">Date</label>
		</div>
		<div class="col-md-4">
			<input type="date" class="form-control  ml-2" id="journal-entry-date" name="journal-entry-date-name">
		</div>
		<div class="col-md-2 text-right">
			<label style="margin-bottom:0px;">Reference:</label>
		</div>
		<div class="col-md-4">
			<input type="text" class="form-control  ml-2" id="journal-entry-reference" name="journal-entry-reference-name">
		</div>
	</div>
	
		<div class="row  row-background">
			<div class="col-md-12">
				<table class="table table-sm table-bordered">
					<thead>
						<tr>
							<th width="20%">Account Id</th>
							<th>Description</th>
							<th width="10%">Debit</th>
							<th width="10%">Credit</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr class="tdindex">
							<td>
								<select class="form-control " id="journal-entry-accountid" name="journal-entry-accountid-name">
									<option>Account Id</option>
								</select>
							</td>
							<td>
								<input type="text" class="form-control  " id="desciption" name="desciption-name">
							</td>
							<td>
								<input type="text" class="form-control  " id="debit" name="debit-name">
							</td>
							<td>
								<input type="text" class="form-control  " id="credit" name="credit-name">
							</td>
						</tr>
						
						<tr class="tdindex">
							<td>
								<select class="form-control " id="journal-entry-accountid" name="journal-entry-accountid-name">
									<option>Account Id</option>
								</select>
							</td>
							<td>
								<input type="text" class="form-control  " id="desciption" name="desciption-name">
							</td>
							<td>
								<input type="text" class="form-control  " id="debit" name="debit-name">
							</td>
							<td>
								<input type="text" class="form-control  " id="credit" name="credit-name">
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" class="text-right"><b>Total</b></td>
							<td class="text-center"><b>test</b></td>
							<td class="text-center"><b>test</b></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		
		<div class="row row-background">
			<div class="col-md-6 d-flex justify-content-start align-items-center">
					<button type="button" class="btn  btn-success btn_width" id="add-row">Add Row</button>
					<button type="button" class="btn  btn-success ml-2 btn_width" id="remove-row">Remove Row</button>
			</div>
			
			<div class="col-md-6 d-flex justify-content-end align-items-center">
					<button type="button" class="btn  btn-success btn_width" id="">Save</button>
					<button type="button" class="btn  btn-success ml-2 btn_width" id="">Reset</button>
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
		<h5 id="response-text" ></h5>
		</div>
	</div>
	<div class="response-footer">
		<button type="button" class="btn btn-success btn-response" id="response-button">Ok</button>
	</div>
</div>
</div>


	 	<script src="../js/3.4.1-jq.js"></script>
	 		<script src="../js/Validation.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
	
		<script>
		//Jquery code starting here no other separate file to be maintained
		
		
		/***************Add remove row
		*/
		$(document).ready(function(){
			$("#add-row").click(function(){
				$("#tbody tr:last").after(
						'<tr class="tdindex"><td><select class="form-control " id="" name="">	<option>Account Id</option></select>'+
						'</td><td><input type="text" class="form-control " id="" name="">	</td>'+
						'<td><input type="text" class="form-control " id="" name=""></td>'+
						'<td><input type="text" class="form-control " id="" name=""></td></tr>'
						)
			})
		})
		
			$(document).ready(function(){
			$("#remove-row").click(function(){
				if($("#tbody tr").length>2){
					$("#tbody tr:last").remove()
				}else{
					$.fn.checkStatus(1,"Cannot delete rows. chuitua lavade")
				}
			})
		})
		
		/******************Make only one column to take data
		*/
		$.fn.getCellIndex = function(){
		$('.tdindex td').click(function(){
			var td = this.cellIndex;
			$("input[name=debit-name]").eq(td).on("click",function(){
				alert("working");
			})
			})
		}
		
		
		/***********************
			Side bar 
		************************/
	       $(document).ready(function () {
	            $('#sidebarCollapse').on('click', function () {
	                $('#sidebar').toggleClass('active');
	            });
	        });
		
		
		
		</script>
</body>
</html>
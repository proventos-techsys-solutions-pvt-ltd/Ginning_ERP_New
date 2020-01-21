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
									<option value="0">Account Id</option>
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
									<option value="0">Account Id</option>
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
							<td class="text-center" id="debit-total"><b>0.00</b></td>
							<td class="text-center" id="credit-total"><b>0.00</b></td>
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
					<button type="button" class="btn  btn-success btn_width" id="save-data">Save</button>
					<button type="button" class="btn  btn-success ml-2 btn_width" id="reset-data">Reset</button>
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
		
		/********************validations***************************/
		$.fn.validateDataDetails = function(){
			var status = false;
			var totalRow = $("#tbody tr").length;
			for(i=0;i<totalRow;i++){
				if($.fn.validateData($("select[name='journal-entry-accountid-name']").eq(i).val().trim(),/^[0-9]+$/)){
					if($.fn.validateData($("input[name='desciption-name']").eq(i).val().trim(),/^[a-zA-Z0-9]+$/)){
						if($.fn.validateData($("input[name='debit-name']").eq(i).val().trim(),/^[0-9]+$/)){
							if($.fn.validateData($("input[name='credit-name']").eq(i).val().trim(),/^[0-9]+$/)){
								status = true;
							}else{
								$.fn.checkStatus(1,"Only numbers are allowed.")
								$("input[name='credit-name']").eq(i).css("border","1px solid red");
							}
						}else{
							$.fn.checkStatus(1,"Only numbers are allowed.")
							$("input[name='debit-name']").eq(i).css("border","1px solid red");
						}
					}else{
						$.fn.checkStatus(1,"Check description.")
						$("input[name='desciption-name']").eq(i).css("border","1px solid red");
					}
				}else{
					$.fn.checkStatus(1,"Invalid account Id.")
					$("select[name='journal-entry-accountid-name']").eq(i).css("border","1px solid red");
				}
			}
			return status;
		}
		
		/***************Add remove row
		*/
		$(document).ready(function(){
			$("#add-row").click(function(){
				$("#tbody tr:last").after(
						'<tr class="tdindex"><td><select class="form-control " id="journal-entry-accountid" name="journal-entry-accountid-name">	<option value="0">Account Id</option></select>'+
						'</td><td><input type="text" class="form-control " id="desciption" name="desciption-name">	</td>'+
						'<td><input type="text" class="form-control " id="debit" name="debit-name"></td>'+
						'<td><input type="text" class="form-control " id="credit" name="credit-name"></td></tr>'
						)
						$.fn.getGrossTotalOfDebit();
						$.fn.getGrossTotalOfCredit();
			})
		})
		
			$(document).ready(function(){
			$("#remove-row").click(function(){
				if($("#tbody tr").length>2){
					$("#tbody tr:last").remove()
				}else{
					$.fn.checkStatus(1,"Cannot delete rows.")
				}
			})
		})
		
		/******************Grand total of table data
		*/
		$.fn.getGrossTotalOfDebit = function(){
			var $tblrows = $("#tbody tr");
			$tblrows.each(function (index) {
			    var $tblrow = $(this);
			    $tblrow.find("input[name='debit-name']").on('change', function () {
			    var subTotal = $("input[name='debit-name']").val();
			    if (!isNaN(subTotal)) {
			    	$tblrow.find('#debit-total').val(subTotal);
			    	var grandTotal = 0;
			    	  $("input[name='debit-name']").each(function () {
			    	        var stval = parseFloat($(this).val());
			    	        grandTotal += isNaN(stval) ? 0 : stval;
			    	    });
			    	    $('#debit-total').text(grandTotal);
			    }
			    	});
			});
		}
		
		$.fn.getGrossTotalOfCredit = function(){
			var $tblrows = $("#tbody tr");
			$tblrows.each(function (index) {
			    var $tblrow = $(this);
			    $tblrow.find("input[name='credit-name']").on('change', function () {
			    var subTotal = $("input[name='credit-name']").val();
			    if (!isNaN(subTotal)) {
			    	$tblrow.find('#credit-total').val(subTotal);
			    	var grandTotal = 0;
			    	  $("input[name='credit-name']").each(function () {
			    	        var stval = parseFloat($(this).val());
			    	        grandTotal += isNaN(stval) ? 0 : stval;
			    	    });
			    	    $('#credit-total').text(grandTotal);
			    }
			    	});
			});
		}
		
		$.fn.getGrossTotalOfDebit();
		$.fn.getGrossTotalOfCredit();
		
	/*************Get data from table to save in database*/

	$.fn.getTableData = function(){
		var totalRow = $("#tbody tr").length;
		var tableData = [];
		for(i=0; i<totalRow;i++){
			var detailTableData = {
					"accountId":$("input[name='journal-entry-accountid-name']").eq(i).val(),
					"description":$("input[name='desciption-name']").eq(i).val(),
					"debit":$("input[name='debit-name']").eq(i).val(),
					"credit":$("input[name='credit-name']").eq(i).val(),
			}
			tableData.push(detailTableData);
		}
		console.log(tableData);
		return tableData;
	}
	
	$("#save-data").click(function(){
		if($.fn.validateDataDetails() === true){
			$.fn.getTableData();//Ameya this method return the data
		}else{
			$.fn.checkStatus(1,"Something is wrong with data, please check.")
		}
	})
		
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Dashboard</title>
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
        <div class="row row-background">
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
							<input type="text" class="form-control form-control-sm" id="authorizer" name="authorizer" value="NA" >
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
										<th width="10%">Quantity in Kg</th>
										<th width="20%">Grade</th>
										<th>Grade Description</th>
										<th width="7%">Moisture</th>
										<th width="7%">Rate per Quintal</th>
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
					<div class="form-row border-top">
						<div class="col-md-1 offset-md-10 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button " onclick="submitGradingData()">Approve</button>
							</div>
						</div>
						<div class="col-md-1 r-p-all">
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-success btn-sm change-button ">Discard</button>
							</div>
						</div>
					</div>
					
			</div>
        </div>
</div>

<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</body>
</html>

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
      <title>Expenses</title>
    </head>
<body>
	<%@include file="../views/NavBar.html" %>
		<div class="container-fluid">
			<div class="row mt-2 tile-background-row">
			
				<div class="col-md-12">
						<h4>Expenses</h4>
				</div>
			</div>
		<form action="../processing/expenseEntry.jsp" >
			<div class="row tile-background-row">
				<div class="col-md-3">
						<label class="lbl-rm-l ">Select Company</label> 
				<select class="form-control form-control-sm" name="companyId" id="companyId" onchange="setBank(this.value)">
					<option selected="selected" disabled>Select</option>
					<c:Company />
				</select>
			</div>
			</div>
			
			<div class="row tile-background-row">
				<div class="col-md-2">
						<label class="lbl-rm-l">Date</label>
						<input type="date" class="form-control form-control-sm" name="date" id="date">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-it">Voucher No</label>
						<input type="text" class="form-control form-control-sm" name="voucherNo" id="voucherNo" value="" placeholder="V001">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-it">Reference</label>
						<input type="text" class="form-control form-control-sm" name="voucherReference" id="voucherReference">
				</div>
			</div>
			
			<div class="row mt-2 tile-background-row">
				<div class="col-md-2">
						<label class="lbl-rm-l">Expense Account</label>
						<select class="form-control form-control-sm" name="accountId" id="accountId">
							<option selected="selected" disabled>Select</option>
							<c:Account/>
						</select>
				</div>
				<div class="col-md-5">
						<label class="lbl-rm-l">Description</label>
						<input type="text" class="form-control form-control-sm" name="description" id="description">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-l">Amount</label>
						<input type="text" class="form-control form-control-sm" name="amount" id="amount" />
				</div>
				<div class="col-md-3">
						<label class="lbl-rm-l">Payment Mode</label>
						<select class="form-control form-control-sm" name="paymentMode" id="paymentMode">
							<option selected disabled>Select</option>
							<c:Bank />
						</select>
				</div>
			</div>
			</form>
			<div class="row tile-background-row">
				<div class="col-md-2 offset-md-10 text-right">
					<button type="button" class="btn btn-success" onclick="expenseEntry()">Save</button>
					<button type="button" class="btn btn-success">Save & Print</button>
				</div>
			</div>
		</div>
		
	
 	<script src="../js/jquery-3.3.1.slim.min.js" ></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	
		function expenseEntry(){
			
			document.getElementsByTagName('form')[0].submit();
			
		}
	
		function setBank(companyId){
			
			var options = document.getElementById("paymentMode").options;
			
			for(i=0; i<options.length;i++)
				{
					if(options[i].getAttribute('data-company-id') != companyId && options[i].getAttribute('data-company-id') != 0){
						options[i].hidden=true;
					}else if(options[i].getAttribute('data-company-id') === companyId || options[i].getAttribute('data-company-id') === 0){
						options[i].hidden=false;
					}
				}
			
		}
		
	
	</script>
</body>
</html>

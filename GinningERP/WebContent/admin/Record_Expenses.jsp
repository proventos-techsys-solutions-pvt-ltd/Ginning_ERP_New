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
<title>Chart Of Accounts</title>
</head>

<body>

<%@include file="../admin/Top_Nav.jsp" %>
	<div class="container-fluid container-mr-t">
	 <%@include file="../admin/Side_bar.html" %>
	 	<div class="row mt-2 row-background">
				<div class="col-md-12">
						<h4>Expenses</h4>
				</div>
			</div>
		<form action="../processing/addExpense.jsp" >
			<div class="row row-background">
				<div class="col-md-3">
						<label class="lbl-rm-l ">Select Company</label> 
				<select class="form-control form-control-sm" name="companyId" id="companyId" onchange="setPaymentModes(this.value)">
					<option selected="selected" disabled>Select</option>
					<c:Company />
				</select>
			</div>
			</div>
			
			<div class="row row-background">
				<div class="col-md-2">
						<label class="lbl-rm-l">Date</label>
						<input type="date" class="form-control form-control-sm" name="date" id="date">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-it">Voucher No</label>
						<input type="text" class="form-control form-control-sm" name="voucherNo" id="voucherNo" value="" readonly="readonly">
				</div>
				<div class="col-md-2">
						<label class="lbl-rm-it">Reference</label>
						<input type="text" class="form-control form-control-sm" name="voucherReference" id="voucherReference">
				</div>
			</div>
			
			<div class="row mt-2 row-background">
				<div class="col-md-2">
						<label class="lbl-rm-l">Expense Account</label>
						<select class="form-control form-control-sm" name="accountId" id="accountId">
							<option selected="selected" disabled>Select</option>
							<c:ExpenseAccountTag/>
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
							<c:BankLedgerTag/>
							<c:CashLedgerTag/>
						</select>
				</div>
			</div>
			</form>
			<div class="row row-background">
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
	
		function setPaymentModes(companyId){
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
		
		
		
		function fetchVoucherNoSeries(){
			var url="../processing/getVoucherNoSeries.jsp";
			if(window.XMLHttpRequest){  
				fetchVoucherNo=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchVoucherNo=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchVoucherNo.onreadystatechange=getVoucherNo;  
				console.log("AJAX Req sent");
				fetchVoucherNo.open("GET",url,true);  
				fetchVoucherNo.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function getVoucherNo(){
			if(fetchVoucherNo.readyState == 4){
				var voucherNo = this.response.trim();
				console.log("voucher---"+voucherNo);
				document.getElementById("voucherNo").value = voucherNo;
			}
		}
		
	fetchVoucherNoSeries();
	</script>
</body>
</html>
	 
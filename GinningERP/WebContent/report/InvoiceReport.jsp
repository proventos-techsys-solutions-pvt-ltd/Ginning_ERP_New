<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../styles/bootstrap.min.css">
	<link rel="stylesheet" href="../styles/admin/sidenav.css">
<title>Invoice Report</title>
<style>
@media print{@page {size: landscape}}
body{
	font-size:.65rem;
	line-height:1rem;
	padding: 5px;
}
.small-font{
	font-size:.65rem;
}
	.report{
		padding-right: 0px;
		padding-left: 0px;
	}
	.remove-row-margin{
		margin-left: 0px;
		margin-right: 0px;
		padding:5px;
	}

	.form-border{
		border:1px solid black;
	}

</style>
</head>
<body>
<div class="container-fluid report ">
<div class=row>
<div class="col-md-6">
	<div class="form-border">
	<div class="row remove-row-margin row-background">
		<div class="col-md-12">
			<h4 class="text-center">Invoice</h4>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Vendor: </b></label>
			<span id='vendorName'>Alies Williams</span>
			<div>
				<label><b>Company: </b></label>
				<span id='companyName'>Samir Cotton Industries Ltd ST</span>
			</div>
		</div>
		<div class="col-md-6 ">
			<label><b>Invoice No: </b></label>
			<span id='invoiceNo'>ST/19-20/0002</span>
			<div>
				<label><b>Invoice Date: </b></label>
				<span id='invoiceDate'>09/01/2020</span>
			</div>
				<div>
				<label><b>GST/UAN: </b></label>
				<span id='gstNo'>27ABCDE1234F1ZZ</span>
			</div>
			<div>
				<label><b>State Name: </b></label>
				<span id='stateName'>Maharashtra</span>
			</div>
			<div>
				<label><b>Email: </b></label>
				<span id='emailId'>info@samirgroup.co.in</span>
			</div>
		</div>
	</div>
	
	<div class="row remove-row-margin row-background" >
		<div class="col-md-12">
			<table class="table table-sm table-bordered">
				<thead  class="small-font">
					<tr>
						<th>RST No</th>
						<th>Material</th>
						<th>Grade</th>
						<th>Grade Description </th>
						<th>Qty(Kgs.)</th>
						<th>Rate per Qtl.</th>
						<th>Amount</th>
						<th>Moisture</th>
					</tr>
				</thead>
				<tbody id="tableBody" class="small-font">
					<tr>
						<td>2</td>
						<td>Raw Cotton</td>
						<td>Grade B</td>
						<td>Medium Quality</td>
						<td>20</td>
						<td>5250</td>
						<td>1050</td>
						<td>15</td>
					</tr>
				</tbody>
				<tfoot class="small-font">
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Total: </b></td>
						<td id="totalAmount"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Weighing Charges: </b></td>
						<td id="weighingCharges"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Unloading Charges: </b></td>
						<td id="unloadingCharges"></td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td><b>Total Qty: </b></td>
						<td id="netWeight"></td>
						<td><b>Net Amount Payable: </b></td>
						<td id="netAmount"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Amount In Words: </b> </label>
			<span id="netAmountInWords">Rs. One Thousand Only</span>
		</div>
		<div class="col-md-6">
			<label><b>Amanat Qty: </b> </label>
			<span id="amanatQty">1000 Kg</span>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Payment Details </b></label>
			<ul>
				<li><b>Cash: </b><span id="cashPaid">Rs.14500</span></li>
				<li><b>Cheque: </b><span id="chequePaid">Rs.1000</span>&nbsp;<span id="chequeDate">21/02/2019</span></li>
				<li><b>RTGS/NEFT : </b><span id="rtgsPaid">Rs.1000</span>&nbsp;<span id="rtgsDate">21/02/2019</span></li>
				<li><b>PDC Cheque: </b><span id="pdcChequePaid">Rs.1000</span>&nbsp;<span id="pdcChequeDate">21/02/2019</span></li>
				<li><b>RTGS/NEFT : </b><span id="pdcRtgsPaid">Rs.1000</span>&nbsp;<span id="pdcRtgsDate">21/02/2019</span></li>
			</ul>
		</div>
		<div class="col-md-6">
			<label><b>Note :</b></label>
			<p id="noteId">This is a anote and it containes sometio This is a anote and it containes sometio </p>
		</div>
	</div>
	
	<div class="row remove-row-margin row-background">
	<div class="offset-md-6 col-md-3 text-right">
			<h6 class="small-font"> <b>Authorized Signatory</b></h6>
		</div>
		<div class="col-md-3 text-right">
			<h6 class="small-font"><b>Farmer's Signature</b></h6>
		</div>
	</div>
	
	<div class="row remove-row-margin row-background">
		<div class="col-md-12 text-center">
			<h5>Under Katol Jurisdiction</h5>
		</div>
	</div>
	</div>
	</div>
	
	
	<!-- Second Copy -->
	<div class="col-md-6" >
	<div class="form-border">
	<div class="row remove-row-margin row-background">
		<div class="col-md-12">
			<h4 class="text-center">Invoice</h4>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Vendor: </b></label>
			<span id='vendorName'>Alies Williams</span>
			<div>
				<label><b>Company: </b></label>
				<span id='companyName'>Samir Cotton Industries Ltd ST</span>
			</div>
		</div>
		<div class="col-md-6 ">
			<label><b>Invoice No: </b></label>
			<span id='invoiceNo'>ST/19-20/0002</span>
			<div>
				<label><b>Invoice Date: </b></label>
				<span id='invoiceDate'>09/01/2020</span>
			</div>
				<div>
				<label><b>GST/UAN: </b></label>
				<span id='gstNo'>27ABCDE1234F1ZZ</span>
			</div>
			<div>
				<label><b>State Name: </b></label>
				<span id='stateName'>Maharashtra</span>
			</div>
			<div>
				<label><b>Email: </b></label>
				<span id='emailId'>info@samirgroup.co.in</span>
			</div>
		</div>
	</div>
	
	<div class="row remove-row-margin row-background" >
		<div class="col-md-12">
			<table class="table table-sm table-bordered">
				<thead class="small-font">
					<tr>
						<th>RST No</th>
						<th>Material</th>
						<th>Grade</th>
						<th>Grade Description </th>
						<th>Qty(Kgs.)</th>
						<th>Rate per Qtl.</th>
						<th>Amount</th>
						<th>Moisture</th>
					</tr>
				</thead>
				<tbody id="tableBody" class="small-font">
					<tr>
						<td>2</td>
						<td>Raw Cotton</td>
						<td>Grade B</td>
						<td>Medium Quality</td>
						<td>20</td>
						<td>5250</td>
						<td>1050</td>
						<td>15</td>
					</tr>
				</tbody>
							<tfoot class="small-font">
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Total: </b></td>
						<td id="totalAmount"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Weighing Charges: </b></td>
						<td id="weighingCharges"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Unloading Charges: </b></td>
						<td id="unloadingCharges"></td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td><b>Total Qty: </b></td>
						<td id="netWeight"></td>
						<td><b>Net Amount Payable: </b></td>
						<td id="netAmount"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Amount In Words: </b> </label>
			<span id="netAmountInWords">Rs. One Thousand Only</span>
		</div>
		<div class="col-md-6">
			<label><b>Amanat Qty: </b> </label>
			<span id="amanatQty">1000 Kg</span>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Payment Details </b></label>
			<ul>
				<li><b>Cash: </b><span id="cashPaid">Rs.14500</span></li>
				<li><b>Cheque: </b><span id="chequePaid">Rs.1000</span>&nbsp;<span id="chequeDate">21/02/2019</span></li>
				<li><b>RTGS/NEFT : </b><span id="rtgsPaid">Rs.1000</span>&nbsp;<span id="rtgsDate">21/02/2019</span></li>
				<li><b>PDC Cheque: </b><span id="pdcChequePaid">Rs.1000</span>&nbsp;<span id="pdcChequeDate">21/02/2019</span></li>
				<li><b>RTGS/NEFT : </b><span id="pdcRtgsPaid">Rs.1000</span>&nbsp;<span id="pdcRtgsDate">21/02/2019</span></li>
			</ul>
		</div>
		<div class="col-md-6">
			<label><b>Note :</b></label>
			<p id="noteId">This is a anote and it containes sometio This is a anote and it containes sometio </p>
		</div>
	</div>
	
	
	<div class="row remove-row-margin row-background">
	<div class="offset-md-6 col-md-3 text-right ">
			<h6 class="small-font"> <b>Authorized Signatory</b></h6>
		</div>
		<div class="col-md-3 text-right ">
			<h6 class="small-font"><b>Farmer's Signature</b></h6>
		</div>
	</div>
	
	<div class="row remove-row-margin row-background">
		<div class="col-md-12 text-center">
			<h5>Under Katol Jurisdiction</h5>
		</div>
	</div>
	</div>
	</div>
	</div>
</div>
	<script src="../js/3.4.1-jq.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/plugins/jquery.blockUI.js" ></script>
</body>
</html>
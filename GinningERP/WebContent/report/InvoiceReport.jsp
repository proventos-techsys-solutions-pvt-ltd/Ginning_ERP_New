<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	 <meta id="viewport" content="wth=device-wth, initial-scale=1">
	<link rel="stylesheet" href="../styles/bootstrap.min.css">
	<link rel="stylesheet" href="../styles/admin/senav.css">
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
			<span name='vendorName'></span>
			<div>
			<label><b>Vendor Mobile: </b></label>
			<span name='vendorMobile'></span>
			</div>
			<div>
			<label><b>Vendor Address: </b></label>
			<span name='vendorAddress'></span>
			</div>
			<div>
			<label><b>Vehicle No: </b></label>
			<span name='vehicleNo'></span>
			</div>
			<div>
				<label><b>Company: </b></label>
				<span name='companyName'></span>
			</div>
		</div>
		<div class="col-md-6 ">
			<label><b>Invoice No: </b></label>
			<span name='invoiceNo'></span>
			<div>
				<label><b>Invoice Date: </b></label>
				<span name='invoiceDate'></span>
			</div>
				<div>
				<label><b>GST/UAN: </b></label>
				<span name='gstNo'></span>
			</div>
			<div>
				<label><b>State Name: </b></label>
				<span name='stateName'></span>
			</div>
			<div>
				<label><b>Email: </b></label>
				<span name='emailId'></span>
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
				<tbody name="tableBody" class="small-font">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
				<tfoot class="small-font">
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Total: </b></td>
						<td name="totalAmount"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Weighing Charges: </b></td>
						<td name="weighingCharges"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Unloading Charges: </b></td>
						<td name="unloadingCharges"></td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td><b>Total Qty: </b></td>
						<td name="netWeight"></td>
						<td><b>Net Amount Payable: </b></td>
						<td name="netAmount"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Amount In Words: </b> </label>
			<span name="netAmountInWords"></span>
		</div>
		<div class="col-md-6">
			<label><b>Amanat Qty: </b> </label>
			<span name="amanatQty"></span>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Payment Details </b></label>
			<ul>
				<li><b>Cash: </b><span name="cashPaid"></span></li>
				<li><b>Cheque: </b><span name="chequePaid"></span>&nbsp;<span name="chequeDate"></span></li>
				<li><b>Cheque No.: </b><span name="chequeNo"></span></li>
				<li><b>RTGS/NEFT : </b><span name="rtgsPaid"></span>&nbsp;<span name="rtgsDate"></span></li>
				<li><b>Post dated Amount: </b><span name="pdcAmount"></span></li>
				<li><b>Post dated Payment Mode : </b><span name="pdcMode"></span></li>
				<li><b>Post dated Payment Date : </b><span name="pdcDate"></span></li>
				<li><b>Post dated Cheque No.: </b><span name="pdcNo"></span></li>
				<li><b>Bonus: </b><span name="bonus"></span></li>
				<li><b>advance: </b><span name="advance"></span></li>
			</ul>
		</div>
		<div class="col-md-6">
			<label><b>Note :</b></label>
			<p name="noteId"></p>
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
			Under Katol Jurisdiction
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
			<span name='vendorName'></span>
			<div>
			<label><b>Vendor Mobile: </b></label>
			<span name='vendorMobile'></span>
			</div>
			<div>
			<label><b>Vendor Address: </b></label>
			<span name='vendorAddress'></span>
			</div>
			<div>
			<label><b>Vehicle No: </b></label>
			<span name='vehicleNo'></span>
			</div>
			<div>
				<label><b>Company: </b></label>
				<span name='companyName'></span>
			</div>
		</div>
		<div class="col-md-6 ">
			<label><b>Invoice No: </b></label>
			<span name='invoiceNo'></span>
			<div>
				<label><b>Invoice Date: </b></label>
				<span name='invoiceDate'></span>
			</div>
				<div>
				<label><b>GST/UAN: </b></label>
				<span name='gstNo'></span>
			</div>
			<div>
				<label><b>State Name: </b></label>
				<span name='stateName'></span>
			</div>
			<div>
				<label><b>Email: </b></label>
				<span name='emailId'></span>
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
				<tbody name="tableBody" class="small-font">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
							<tfoot class="small-font">
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Total: </b></td>
						<td name="totalAmount"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Weighing Charges: </b></td>
						<td name="weighingCharges"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
						<td colspan="2"><b>Unloading Charges: </b></td>
						<td name="unloadingCharges"></td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td><b>Total Qty: </b></td>
						<td name="netWeight"></td>
						<td><b>Net Amount Payable: </b></td>
						<td name="netAmount"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Amount In Words: </b> </label>
			<span name="netAmountInWords"></span>
		</div>
		<div class="col-md-6">
			<label><b>Amanat Qty: </b> </label>
			<span name="amanatQty"></span>
		</div>
	</div>
	<div class="row remove-row-margin row-background">
		<div class="col-md-6">
			<label><b>Payment Details </b></label>
			<ul>
				<li><b>Cash: </b><span name="cashPaid">.</span></li>
				<li><b>Cheque: </b><span name="chequePaid"></span>&nbsp;<span name="chequeDate"></span></li>
				<li><b>Cheque No.: </b><span name="chequeNo"></span></li>
				<li><b>RTGS/NEFT : </b><span name="rtgsPaid"></span>&nbsp;<span name="rtgsDate"></span></li>
				<li><b>Post dated Amount: </b><span name="pdcAmount"></li>
				<li><b>Post dated Payment Mode : </b><span name="pdcMode"></span></li>
				<li><b>Post dated Payment Date : </b><span name="pdcDate"></span></li>
				<li><b>Post dated Cheque No.: </b><span name="pdcNo"></span></li>
				<li><b>Bonus: </b><span name="bonus"></span></li>
				<li><b>advance: </b><span name="advance"></span></li>
			</ul>
		</div>
		<div class="col-md-6">
			<label><b>Note :</b></label>
			<p name="noteId"></p>
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
			Under Katol Jurisdiction
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
	<script>
	window.onload = function(){
		var params = parseURLParams(window.location.href);
		sendReqToGetData(params.invoiceId[0]);
	}
	
	function parseURLParams(url) {
	    var queryStart = url.indexOf("?") + 1,
	        queryEnd   = url.indexOf("#") + 1 || url.length + 1,
	        query = url.slice(queryStart, queryEnd - 1),
	        pairs = query.replace(/\+/g, " ").split("&"),
	        parms = {}, i, n, v, nv;
	
	    if (query === url || query === "") return;
	
	    for (i = 0; i < pairs.length; i++) {
	        nv = pairs[i].split("=", 2);
	        n = decodeURIComponent(nv[0]);
	        v = decodeURIComponent(nv[1]);
	
	        if (!parms.hasOwnProperty(n)) parms[n] = [];
	        parms[n].push(nv.length === 2 ? v : null);
	    }
	    return parms;
	}
	

	function sendReqToGetData(invoiceId){
		$.blockUI();
		var url = "../processing/invoicePrinting.jsp?invoiceId="+invoiceId;
		if(window.XMLHttpRequest){  
			fetchReq=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			fetchReq=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			fetchReq.onreadystatechange=getAmanatData;  
			console.log("AJAX Req sent");
			fetchReq.open("GET",url,true);  
			fetchReq.send();  
		}catch(e){alert("Unable to connect to server");}
	}
	
	function getAmanatData(){
		if(fetchReq.readyState == 4){
			$.unblockUI();
			var response = this.response.trim();
			setData(response);
		}
	}
	
	function setData(response){
		var obj = JSON.parse(response);
		console.log(obj);
		var invItems = obj.invoiceItems;
		
		for(k=0; k< 2; k++)	{
			document.getElementsByName('vendorName')[k].innerHTML = obj.vendorName;
			document.getElementsByName('companyName')[k].innerHTML = obj.companyName;
			document.getElementsByName('invoiceNo')[k].innerHTML = obj.invoiceNo;
			document.getElementsByName('invoiceDate')[k].innerHTML = obj.invoiceDate;
			document.getElementsByName('gstNo')[k].innerHTML = obj.companyGst;
			document.getElementsByName('stateName')[k].innerHTML = obj.companyState;
			document.getElementsByName('emailId')[k].innerHTML = obj.companyEmail;
			document.getElementsByName('totalAmount')[k].innerHTML = obj.totalAmount;
			document.getElementsByName('vendorMobile')[k].innerHTML = obj.vendorMobile;
			document.getElementsByName('vendorAddress')[k].innerHTML = obj.vendorAddress;
			document.getElementsByName('vehicleNo')[k].innerHTML = obj.vehicleNo;
			if(Number(obj.unloadingCharges) === 0){
				document.getElementsByName('weighingCharges')[k].innerHTML = "Rs. "+0;
			}else{
				document.getElementsByName('weighingCharges')[k].innerHTML = "Rs. "+obj.weighRate;
			}
			document.getElementsByName('unloadingCharges')[k].innerHTML = "Rs. "+obj.unloadingCharges;
			document.getElementsByName('netWeight')[k].innerHTML = obj.totalQuantity+" Kgs.";
			document.getElementsByName('netAmount')[k].innerHTML = obj.netAmount;
			document.getElementsByName('netAmountInWords')[k].innerHTML = obj.totalInWords;
			document.getElementsByName('noteId')[k].innerHTML = obj.note;
			
			if(obj.amanatQty === "" || obj.amanatQty === "0" || obj.amanatQty === 0){
				document.getElementsByName('amanatQty')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('amanatQty')[k].innerHTML = obj.amanatQty;
			}
			
			
			if(obj.cashAmount === "" || obj.cashAmount === "0" || obj.cashAmount === 0){
				document.getElementsByName('cashPaid')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('cashPaid')[k].innerHTML = "Rs. "+obj.cashAmount;
			}
			
			
			if(obj.chequeAmount === "" || obj.chequeAmount === "0" || obj.chequeAmount === 0){
				document.getElementsByName('chequePaid')[k].parentNode.hidden=true;
				document.getElementsByName('chequeNo')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('chequePaid')[k].innerHTML = "Rs. "+obj.chequeAmount;
				document.getElementsByName('chequeNo')[k].innerHTML= obj.chequeNo;
			}
			
			
			
			if(obj.chequeDate === "" || obj.chequeDate === "0" || obj.chequeDate === 0){
				document.getElementsByName('chequeDate')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('chequeDate')[k].innerHTML = obj.chequeDate;
			}
			
			
			if(obj.rtgsAmount === "" || obj.rtgsAmount === "0" || obj.rtgsAmount === 0){
				document.getElementsByName('rtgsPaid')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('rtgsPaid')[k].innerHTML = "Rs. "+obj.rtgsAmount;
			}
			
			
			if(obj.rtgsDate === "" || obj.rtgsDate === "0" || obj.rtgsDate === 0){
				document.getElementsByName('rtgsDate')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('rtgsDate')[k].innerHTML = obj.rtgsDate;
			}
			
			
			if(obj.pdcMode === "NA" || obj.pdcMode === "NA" || obj.pdcMode === "0" || obj.pdcMode === 0){
				document.getElementsByName('pdcMode')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('pdcMode')[k].innerHTML = obj.pdcMode;
			}
			
			
			
			if(obj.pdcDate === "NA" || obj.pdcDate === "" || obj.pdcDate === "0" || obj.pdcDate === 0){
				document.getElementsByName('pdcDate')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('pdcDate')[k].innerHTML = obj.pdcDate;
			}
			
			
			if(obj.pdcNo === "" || obj.pdcNo === "0" || obj.pdcNo === 0){
				document.getElementsByName('pdcNo')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('pdcNo')[k].innerHTML = obj.pdcNo;
			}
			
			
			if(obj.bonusAmount === "" || obj.bonusAmount === "0" || obj.bonusAmount === 0){
				document.getElementsByName('bonus')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('bonus')[k].innerHTML = "Rs. "+obj.bonusAmount;
			}
			
			
			if(obj.pdcAmount === "" || obj.pdcAmount === "0" || obj.pdcAmount === 0){
				document.getElementsByName('pdcAmount')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('pdcAmount')[k].innerHTML = "Rs. "+obj.pdcAmount;
			}
			
			if(obj.advance === "" || obj.advance === "0" || obj.advance === 0){
				document.getElementsByName('advance')[k].parentNode.hidden=true;
			}else{
				document.getElementsByName('advance')[k].innerHTML = "Rs. "+obj.advance;
			}
			
			
		}
		
		var table = document.getElementsByName('tableBody');
		for(j=0; j< table.length; j++)	{
			for(i=0; i< invItems.length; i++){
				noOfRows = table[j].rows.length;
				var row = table[j].insertRow(noOfRows);
				
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				var cell6 = row.insertCell(5);
				var cell7 = row.insertCell(6);
				var cell8 = row.insertCell(7);
				
				cell1.innerHTML = invItems[i].rst;
				cell2.innerHTML = invItems[i].material;
				cell3.innerHTML = invItems[i].grade;
				cell4.innerHTML = invItems[i].gradeDescription;
				cell5.innerHTML = invItems[i].quantity;
				cell6.innerHTML = invItems[i].rate;
				cell7.innerHTML = invItems[i].amount.toFixed(2);
				cell8.innerHTML = invItems[i].moisture;
				
			}
		}
		
	}
	
	
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
<link rel="stylesheet" href="../styles/admin/sidenav.css">
<title>Bank Reconciliation Report</title>
</head>
<body>
<div class="container">
	<div class="row row-background">
		<div class="col-md-12 text-center">
			<h4 id="companyName">Company Name</h4>
			<h4 id="bankName">Bank Reconciliation Report</h4>
			<h4 id="date">As on date <span></span></h4>
		</div>
	</div>
	<div class="row row-background">
		<div class="col-md-12">
			<table class="table table-bordered table-sm">
				<thead>
					<tr>
						<th>Particulars</th>
						<th>Debit</th>
						<th>Credit</th>
					</tr>
				<thead>
				<tbody>
					<tr>
						<td><b>Balance as per ledger</b></td>
						<td id="ledgerClosingBal"></td>
						<td><b>0</b></td>
					</tr>
					<tr>
						<td><b>Pending Transaction at Bankers End</b></td>
					</tr>
					<tr>
						<td>
							<table class="table">
								<thead>
								<tr>
									<th width="10%">Date</th>
									<th>Description</th>
									<th width="10%">Voucher No</th>
									<th width="10%">Cheque No</th>
									<th>Debit</th>
									<th>Credit</th>
								</tr>
								</thead>
								<tbody id="tBody">
								</tbody>
							</table>
						</td>
					</tr>
				
				</tbody>
				<tfoot>
					<tr>
						<td><b>Balance As per Bank Statement</b></td>
						<td id="bankClosingBal"></td>
						<td></td>
					</tr>
				<tfoot>
			</table>
		</div>
	</div>
	
</div>
</body>
<script src="../js/3.4.1-jq.js"></script>
<script src="../js/plugins/jquery.blockUI.js" ></script>
<script type="text/javascript">


window.onload = function(){
	var params = parseURLParams(window.location.href);
	sendReqToGetData(params.companyId[0],params.bankId[0],params.date[0]);
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


function sendReqToGetData(companyId,bankId,date){
	$.blockUI();
	var url = "../processing/getBankRecoForPrinting.jsp?companyId="+companyId+"&bankId="+bankId+"&date="+date;
	if(window.XMLHttpRequest){  
		fetchReq=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		fetchReq=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	try{  
		fetchReq.onreadystatechange=getRecoData;  
		console.log("AJAX Req sent");
		fetchReq.open("GET",url,true);  
		fetchReq.send();  
	}catch(e){alert("Unable to connect to server");}
}

function getRecoData(){
	if(fetchReq.readyState == 4){
		$.unblockUI();
		var response = this.response.trim();
		setData(response);
	}
}

function setData(data){
	var parentObj = JSON.parse(data);
	
	document.getElementById("date").innerHTML = parentObj.date;
	document.getElementById("ledgerClosingBal").innerHTML = parentObj.closingBalance;
	document.getElementById("bankClosingBal").innerHTML = parentObj.closingBalanceBank;
	
	var recoDetails = parentObj.array;
	var table = document.getElementById("tBody");
	table.innerHTML = "";
	document.getElementById("companyName").innerHTML = recoDetails[0].companyName;
	document.getElementById("bankName").innerHTML = recoDetails[0].bankName + " RECONCILIATION REPORT";
	
	for(i=0; i<recoDetails.length; i++){
		var noOfRows = table.rows.length;
		var rows = table.insertRow(noOfRows);
		var cell1 = rows.insertCell(0);
		var cell2 = rows.insertCell(1);
		var cell3 = rows.insertCell(2);
		var cell4 = rows.insertCell(3);
		var cell5 = rows.insertCell(4);
		var cell6 = rows.insertCell(5);
		
		cell1.innerHTML = recoDetails[i].transactionDate;
		cell2.innerHTML = recoDetails[i].narration;
		cell3.innerHTML = recoDetails[i].voucherNo;
		if(typeof recoDetails[i].chequeNo != 'undefined'){
			cell4.innerHTML = recoDetails[i].chequeNo;
		}else{
			cell4.innerHTML = "NA";
		}
		
		cell5.innerHTML = recoDetails[i].debit;
		cell6.innerHTML = recoDetails[i].credit;
	}
	
}

</script>

</html>
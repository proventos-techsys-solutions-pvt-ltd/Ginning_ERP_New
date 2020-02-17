<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../styles/bootstrap.min.css">
 <link rel="stylesheet" href="../styles/WBStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Payment Voucher</title>
<style>
	.row{
		margin-right:0px;
		margin-left:0px;
	}
	span {
    vertical-align: middle;
    font-size: 1.1rem;
    margin: .5rem;
	}
</style>
</head>
<body>
<div class="container row-background">
<div style="padding:5px;" class="border">
	<div class="row ">
		<div class="col-md-12 text-center">
			<h4>Payment Voucher</h4>
		</div>
	</div>
	<div class="row ">
		<div class="col-md-12 text-center">
			<h4 id="companyName">Company Name</h4>
		</div>
	</div>
	<div class="row border-bottom">
		<div class="col-md-6 text-left">
			<label>Date: <span id="date"></span></label>
		</div>
		<div class="col-md-6 text-right">
			<label>Voucher No: <span id="vchno"></span></label>
		</div>
	</div>
	<div class="row border-bottom">
		<div class="col-md-12">
			<label>Payee: <span id="payee"></span></label>
		</div>
		<div class="col-md-12">
			<label>Description: <span id="description"></span></label>
		</div>
		<div class="col-md-4">
			<label>Cheque No:  <span id="chequeNo"></span></label>
		</div>
		<div class="col-md-4">
			<label>Amount(In Words): <span id="amtinwords"></span></label>
		</div>
		<div class="col-md-4">
			<label>Amount(In figures): <span id="amtinfgrs"></span></label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 border" style="height:150px;">
			<label>Approved By:</label>
		</div>
		<div class="col-md-4 border" style="height:150px;">
			<label>Paid By:</label>
		</div>
		<div class="col-md-4 border" style="height:150px;">
			<label>Payee:</label>
		</div>
		</div>
	</div>
</div>


 	<script src="../js/3.4.1-jq.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/plugins/jquery.blockUI.js" ></script>
	<script type="text/javascript">
	window.onload = function(){
		var params = parseURLParams(window.location.href);
		sendReqToGetData(params.transactionId[0]);
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
	

	function sendReqToGetData(transactionId){
		$.blockUI();
		var url = "../processing/trVoucherPrinting.jsp?transactionId="+transactionId;
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
		document.getElementById("date").innerHTML = obj.transactionDate;
		
		document.getElementById("description").innerHTML = obj.narration;
		if(typeof obj.chequeNo != "undefined"){
			document.getElementById("chequeNo").innerHTML = obj.chequeNo;
		}else{
			document.getElementById("chequeNo").innerHTML = "NA";
		}
		
		if(typeof obj.contactId != "undefined" && isNaN(obj.contactId)){
			document.getElementById("payee").innerHTML = obj.contactId;
		}else{
			document.getElementById("payee").innerHTML = "NA";
		}
		
		document.getElementById("amtinwords").innerHTML = obj.amountInWords;
		if(Number(obj.credit)>0){
			document.getElementById("amtinfgrs").innerHTML = "Rs. "+obj.credit;
		}else if(Number(obj.debit)>0){
			document.getElementById("amtinfgrs").innerHTML = "Rs. "+	obj.debit;
		}
		document.getElementById("vchno").innerHTML = obj.voucherNo;
		document.getElementById("companyName").innerHTML = obj.companyName;
	}
	
	</script>
</body>
</html>
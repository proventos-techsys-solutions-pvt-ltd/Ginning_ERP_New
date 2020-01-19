<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	 <meta id="viewport" content="wth=device-wth, initial-scale=1">
	<link rel="stylesheet" href="../styles/bootstrap.min.css">
	<script src="../js/3.4.1-jq.js"></script>
	<script src="../js/export/export2excel.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table id="table" class="table table-sm table-bordered">
		<thead >
			<tr>
				<th>Sr. no.</th>
				<th>Amanat Date</th>
				<th>Company</th>
				<th>Amanat No.</th>
				<th>Invoice No.</th>
				<th>RST</th>
				<th>Name</th>
				<th>Address</th>
				<th>Mobile</th>
				<th>Vehicle No.</th>
				<th>Vehicle Type</th>
				<th>Cotton Wt. (Qtl.)</th>
				<th>Rate/Qtl.</th>
				<th>Amanat Wt. (Qtl.)</th>
				<th>Invoiced Wt (Qtl.)</th>
				<th>Balance Wt. (Qtl.)</th>
				<th>Gross Amount</th>
				<th>Net Amount</th>
				<th>Invoice Date</th>
				<th>Rate Difference</th>
				<th>Invoice date Super rate</th>
				<th>Amanat Settled rate</th>
				<th>Gross(Invoice Date rate)</th>
				<th>Gross(Settled rate)</th>
				<th>Settled Net Amount</th>
				<th>Actual Interest Amount</th>
				<th>Actual Interest Percent</th>
				<th>Cash Amount</th>
				<th>Cheque Amount</th>
				<th>RTGS Amount</th>
				<th>Cheque No.</th>
				<th>Cheque Dt</th>
				<th>Cheque Bank</th>
				<th>PDP Amount</th>
				<th>PDP Dt</th>
				<th>PDP Mode</th>
				<th>PDC No.</th>
				<th>PDC Bank</th>
				<th>Remark</th>
			</tr>
		</thead>
		<tbody id="tableBody">
		</tbody>
	</table>
</body>
<script>

window.onload = function(){
	var params = parseURLParams(window.location.href);
	console.log(params.startDate[0]);
	console.log(params.endDate[0]);
	sendReqToGetData(params.startDate[0], params.endDate[0]);
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

	function sendReqToGetData(startDate, endDate){
		
		var url="${pageContext.request.contextPath}/processing/getAmanatReportExcel.jsp?startDate="+startDate+"&endDate="+endDate;
		if(window.XMLHttpRequest){  
			request=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try{  
			request.onreadystatechange=getData;  
			console.log("AJAX Req sent");
			request.open("GET",url,true);  
			request.send();  
		}catch(e){alert("Unable to connect to server");}
		
	}
	
	function getData(){
		if(request.readyState == 4){
			var response = this.response.trim();
			console.log(response);
			var data = JSON.parse(response);
			setData(data);
		}
	}
	
	function setData(data){
		console.log(data)
		var table = document.getElementById("tableBody");
		table.innerHTML = "";
		for(i=0; i<data.length;i++){
	
			var rowIndex = table.rows.length;
			
			var row = table.insertRow(rowIndex);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);
			var cell6 = row.insertCell(5);
			var cell7 = row.insertCell(6);
			var cell8 = row.insertCell(7);
			var cell9 = row.insertCell(8);
			var cell10 = row.insertCell(9);
			var cell11 = row.insertCell(10);
			var cell12 = row.insertCell(11);
			var cell13 = row.insertCell(12);
			var cell14 = row.insertCell(13);
			var cell15 = row.insertCell(14);
			var cell16 = row.insertCell(15);
			var cell17 = row.insertCell(16);
			var cell18 = row.insertCell(17);
			var cell19 = row.insertCell(18);
			var cell20 = row.insertCell(19);
			var cell21 = row.insertCell(20);
			var cell22 = row.insertCell(21);
			var cell23 = row.insertCell(22);
			var cell24 = row.insertCell(23);
			var cell25 = row.insertCell(24);
			var cell26 = row.insertCell(25);
			var cell27 = row.insertCell(26);
			var cell28 = row.insertCell(27);
			var cell29 = row.insertCell(28);
			var cell30 = row.insertCell(29);
			var cell31 = row.insertCell(30);
			var cell32 = row.insertCell(31);
			var cell33 = row.insertCell(32);
			var cell34 = row.insertCell(33);
			var cell35 = row.insertCell(34);
			var cell36 = row.insertCell(35);
			var cell37 = row.insertCell(36);
			var cell38 = row.insertCell(37);
			var cell39 = row.insertCell(38);
			var cell40 = row.insertCell(39);
			
			cell1.innerHTML = (i+1);
			cell2.innerHTML = data[i].amanatDate;
			cell3.innerHTML = data[i].companyName;
			cell4.innerHTML = data[i].amanatNo;
			cell5.innerHTML = data[i].invoiceNo;
			cell6.innerHTML = data[i].rst;
			cell7.innerHTML = data[i].customerName;
			cell8.innerHTML = data[i].customerAddress;
			cell9.innerHTML = data[i].customerMobile;
			cell10.innerHTML = data[i].vehicleNo;
			cell11.innerHTML = data[i].vehicleName;
			cell12.innerHTML = data[i].totalQty/100;
			cell13.innerHTML = data[i].rate;
			cell14.innerHTML = data[i].quantity;
			cell15.innerHTML = data[i].invoicedQty;
			cell16.innerHTML = data[i].quantity - data[i].invoicedQty;
			cell17.innerHTML = (data[i].invoicedQty/100) * data[i].rate;
			cell18.innerHTML = (data[i].invoicedQty/100) * data[i].rate;
			cell19.innerHTML = data[i].invoiceDate;
			cell20.innerHTML = data[i].differenceFromSuper;
			
			var invoiceDateSuperRate = data[i].finalRate + data[i].differenceFromSuper;
			
			cell21.innerHTML = data[i].finalRate + data[i].differenceFromSuper;
			cell22.innerHTML = data[i].finalRate;
			
			var finalNetAmount = (data[i].invoicedQty/100) * (data[i].finalRate);
			
			cell23.innerHTML = (data[i].invoicedQty/100) * (invoiceDateSuperRate);
			
			cell24.innerHTML = finalNetAmount;
			cell25.innerHTML = finalNetAmount;
			
			var interest = ((finalNetAmount) -  ((data[i].invoicedQty/100) * data[i].rate));
				
			cell26.innerHTML = interest;
			
			cell27.innerHTML = (((interest)*100)/(finalNetAmount)).toFixed(2);
			
			if(data[i].hasOwnProperty('cashAmount')){
				cell28.innerHTML = data[i].cashAmount;
			}else{
				cell28.innerHTML = 0;
			}
			
			if(data[i].hasOwnProperty('chequeAmount')){
				cell29.innerHTML = data[i].chequeAmount;
			}else{
				cell29.innerHTML = 0;
			}
			
			if(data[i].hasOwnProperty('rtgsAmount')){
				cell30.innerHTML = data[i].rtgsAmount;
			}else{
				cell30.innerHTML = 0;
			}
			
			
			if(data[i].hasOwnProperty('chequeNo')){
				cell31.innerHTML = data[i].chequeNo;
			}else{
				cell31.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('chequeBank')){
				cell32.innerHTML = data[i].chequeBank;
			}else{
				cell32.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('chequeDate')){
				cell33.innerHTML = data[i].chequeDate;
			}else{
				cell33.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('pdcAmount')){
				cell34.innerHTML = data[i].pdcAmount;
			}else{
				cell34.innerHTML = 0;
			}
			
			if(data[i].hasOwnProperty('pdcDate')){
				cell35.innerHTML = data[i].pdcDate;
			}else{
				cell35.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('PDPayMode')){
				if(Number(data[i].PDPayMode) == 1){
					cell36.innerHTML = 'Cash';
				}else if(Number(data[i].PDPayMode) == 2){
					cell36.innerHTML = 'Cheque';
				}else if(Number(data[i].PDPayMode) == 3){
					cell36.innerHTML = 'RTGS';
				}
			}else{
				cell36.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('pdcNo')){
				cell37.innerHTML = data[i].pdcNo;
			}else{
				cell37.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('pdcchequeBank')){
				cell38.innerHTML = data[i].pdcchequeBank;
			}else{
				cell38.innerHTML = "NA";
			}
		}
		Export();
		window.close();
	}
	
	function getCurrentDate(){
		var today = new Date();
		var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		var time = today.getHours()+ "_" + today.getMinutes()+ "_" + today.getSeconds();
		var dateTime = date+'_'+time;
		return dateTime;
	}
	
	 function Export() {
         $("#table").export2excel({
         	filename: "Simple_Invoice_Report_"+getCurrentDate()+".xls"
         });
     }
     
     
     </script>
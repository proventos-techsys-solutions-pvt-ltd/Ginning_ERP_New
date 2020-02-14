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
				<th>Date</th>
				<th>Company</th>
				<th>Invoice No.</th>
				<th>RST</th>
				<th>Name</th>
				<th>Address</th>
				<th>Mobile</th>
				<th>Vehicle No.</th>
				<th>Vehicle Type</th>
				<th>Cotton Wt. (Qtl.)</th>
				<th>Rate/Qtl.</th>
				<th>Gross Amount</th>
				<th>Unloading charges</th>
				<th>Weighing charges</th>
				<th>Net Amount</th>
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
		
		var url="${pageContext.request.contextPath}/processing/getInvoiceReportExcel.jsp?startDate="+startDate+"&endDate="+endDate;
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
			
			cell1.innerHTML = (i+1);
			cell2.innerHTML = data[i].invoiceDate;
			cell3.innerHTML = data[i].companyName;
			cell4.innerHTML = data[i].invoiceNo;
			cell5.innerHTML = data[i].rst;
			cell6.innerHTML = data[i].customerName;
			cell7.innerHTML = data[i].customerAddress;
			cell8.innerHTML = data[i].customerMobile;
			cell9.innerHTML = data[i].vehicleNo;
			cell10.innerHTML = data[i].vehicleName;
			cell11.innerHTML = data[i].invoicedQty/100;
			cell12.innerHTML = data[i].invoiceRate;
			cell13.innerHTML = data[i].totalAmount;
			cell14.innerHTML = data[i].unloadingCharges;
			if(Number(data[i].unloadingCharges) === 0){
				cell15.innerHTML = 0;
			}else{
				cell15.innerHTML = data[i].weighRate;
			}
			
			cell16.innerHTML = data[i].totalAmount - (Number(data[i].unloadingCharges) + Number(data[i].weighRate));
			if(data[i].hasOwnProperty('cashAmount')){
				cell17.innerHTML = data[i].cashAmount;
			}else{
				cell17.innerHTML = 0;
			}
			
			if(data[i].hasOwnProperty('chequeAmount')){
				cell18.innerHTML = data[i].chequeAmount;
			}else{
				cell18.innerHTML = 0;
			}
			
			if(data[i].hasOwnProperty('rtgsAmount')){
				cell19.innerHTML = data[i].rtgsAmount;
			}else{
				cell19.innerHTML = 0;
			}
			
			
			if(data[i].hasOwnProperty('chequeNo')){
				cell20.innerHTML = data[i].chequeNo;
			}else{
				cell20.innerHTML = "NA";
			}
			
			
			if(data[i].hasOwnProperty('chequeDate')){
				cell21.innerHTML = data[i].chequeDate;
			}else{
				cell21.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('chequeBank')){
				cell22.innerHTML = data[i].chequeBank;
			}else{
				cell22.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('pdcAmount')){
				cell23.innerHTML = data[i].pdcAmount;
			}else{
				cell23.innerHTML = 0;
			}
			
			if(data[i].hasOwnProperty('pdcDate')){
				cell24.innerHTML = data[i].pdcDate;
			}else{
				cell24.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('PDPayMode')){
				if(Number(data[i].PDPayMode) == 1){
					cell25.innerHTML = 'Cash';
				}else if(Number(data[i].PDPayMode) == 2){
					cell25.innerHTML = 'Cheque';
				}else if(Number(data[i].PDPayMode) == 3){
					cell25.innerHTML = 'RTGS';
				}
			}else{
				cell25.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('pdcNo')){
				cell26.innerHTML = data[i].pdcNo;
			}else{
				cell26.innerHTML = "NA";
			}
			
			if(data[i].hasOwnProperty('pdcchequeBank')){
				cell27.innerHTML = data[i].pdcchequeBank;
			}else{
				cell27.innerHTML = "NA";
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
</html>
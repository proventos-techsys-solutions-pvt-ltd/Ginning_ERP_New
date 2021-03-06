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
<link id="load-css-0" rel="stylesheet" type="text/css" href="../js/Gcharts/ToolTip.css">
<link id="load-css-1" rel="stylesheet" type="text/css" href="../js/Gcharts/Util.css">
<link id="load-css-2" rel="stylesheet" type="text/css" href="../js/Gcharts/OrgChart.css">
<title>Dashboard</title>
</head>
<body>
<%@include file="../admin/Top_Nav.jsp" %>
<div class="wrapper">
  <%@include file="../admin/Side_bar.html" %>
  <div id="content">
<div class="container-fluid ">
	  <div class="row row-background">
	  <div class="d-flex justify-content-start align-items-center">
						<h4 class="lbl-rm-all">Dashboard</h4>
					</div>
	  </div>
	  <div class="row row-background">
	  	<div class="col-md-3">
	  			<div class="d-flex justify-content-between align-items-center inner border">
	  				<div>
	  					Today's Rate
	  				</div>
	  				<div>
	  					<i class="fa fa-inr" aria-hidden="true"></i>
	  					<span aria-hidden="true" id="tRate">0</span>
	  				</div>
	  			</div>
	  	</div>
	  	<div class="col-md-3">
	  			<div class="d-flex justify-content-between align-items-center inner1 border">
	  				<div>
	  					Average Rate
	  				</div>
	  				<div>
	  					<i class="fa fa-inr" aria-hidden="true" ></i>
	  					<span aria-hidden="true" id="aRate">0</span>
	  				</div>
	  			</div>
	  	</div>
	  	<div class="col-md-3">
	  				<div class="inner2 border">
	  					<div class="text-center">
	  					<label>Total Purchase </label>
	  					</div>
	  					<div class="d-flex justify-content-between align-items-center">
	  					<select class="cselect" name="paymentType" id="paymentType">
	  						<option value="cash">Cash</option>
	  						<option value="cheque">Cheque</option>
	  						<option value="rtgs">RTGS</option>
	  						<option value="pdc">PDC</option>
	  						<option value="all" selected>All</option>
	  					</select>
		  				<div>
		  					<i class="fa fa-inr" aria-hidden="true" ></i>
		  					<span aria-hidden="true" id="totalPurchase">0</span>
		  				</div>
		  				</div>
	  			</div>
	  	</div>
	  	<div class="col-md-3">
	  		<div class="inner3 border">
	  					<div class="text-center">
	  					<label>Raw Cotton </label>
	  					</div>
	  					<div class="d-flex justify-content-between align-items-center" style="font-size:.65rem;">
	  				<div>
	  					<span aria-hidden="true">Total: </span>
	  					<span aria-hidden="true" id="totalRawCotton">&nbsp;&nbsp;</span>
	  				</div>
	  				<div>
	  					<span aria-hidden="true">Amanat: </span>
	  					<span aria-hidden="true" id="amanatRawCotton">&nbsp;&nbsp;</span>
	  				</div>
	  				<div>
	  					<span aria-hidden="true">Normal Bought: </span>
	  					<span aria-hidden="true" id="NormalRawCotton">&nbsp;&nbsp;</span>
	  				</div>
	  				</div>
	  			</div>
	  	</div>
	  </div>
	  
           <div class="row row-background border-top">
             	<div class="col-md-4">
             		<label class="lbl-rm-l">Company</label>
             		<select class="form-control form-control-sm" id="companyId">
             			<option value="0" selected>All</option>
             			<c:Company />
             		</select>
             	</div>
             	<div class="col-md-2">
             		<label class="lbl-rm-l">From</label>
             		<input class="form-control form-control-sm" type="date"  name="startDate" id="startDate"  />
             	</div>
             	<div class="col-md-2">
             		<label class="lbl-rm-l">To</label>
             		<input class="form-control form-control-sm" type="date"  name="endDate" id="endDate"  />
             	</div>
	             <div class="col-md-2">
		             <button type="button" class="btn btn-success btn-sm" id="filter" style="margin-top:32px;">Filter</button>
		             <button type="button" class="btn btn-success btn-sm ml-1" id="reset" style="margin-top:32px;">Reset</button>
	             </div>
            </div>
             <div class="row row-background">
             	<div class="col-md-8">
             		<canvas id="myChart"></canvas>
             	</div>
             	<div class="col-md-4">
             		<div class="notification-frame border">
             			<div class="notification border">Active Users</div>
             			<div class="notification-panel border">
             				<table class="table">
             					<thead>
             						<tr>
             							<th>Username</th>
             							<th class="text-center">Status</th>
             						</tr>
             					</thead>
             					<tbody id="usersTable">
             					</tbody>
             				</table>
             			</div>
             		</div>
             		<div></div>
             	</div>
             </div>
             <div class="row row-background border-top">
             	<div class="col-md-12">
             		<h4>Purchase Payment Chart</h4>
             	</div>
             	<div class="col-md-12 mt-2">
             		<div id="chart_div">
			        <table class="google-visualization-orgchart-table" dir="ltr" cellspacing="0" cellpadding="0" align="center">
			            <tbody>
			                <tr>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                    <td class="google-visualization-orgchart-space-medium"></td>
			                </tr>
			                <tr class="google-visualization-orgchart-noderow-medium">
			                    <td colspan="16" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">Total Purchase Made
			                        <div style="color:red; font-style:italic"><span id="totalPurchaseTable">Amount</span></div>
			                    </td>
			                    <td colspan="24" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                </tr>
			                <tr class="google-visualization-orgchart-connrow-medium">
			                    <td colspan="3" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineleft google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td colspan="11" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                </tr>
			                <tr class="google-visualization-orgchart-connrow-medium">
			                    <td colspan="3" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineleft">&nbsp;</td>
			                    <td colspan="7" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineleft">&nbsp;</td>
			                    <td colspan="7" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineleft">&nbsp;</td>
			                    <td colspan="14" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineright">&nbsp;</td>
			                    <td colspan="11" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                </tr>
			                <tr class="google-visualization-orgchart-noderow-medium">
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">Cash Payments
			                        <div style="color:red; font-style:italic"><span id="cashPayment">Amount</span></div>
			                    </td>
			                    <td colspan="2" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">Cheque Payments
			                        <div style="color:red; font-style:italic"><span id="chequePayment">Amount</span></div>
			                    </td>
			                    <td colspan="2" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">RTGS/NEFT Payments
			                        <div style="color:red; font-style:italic"><span id="rtgsPayment">Amount</span></div>
			                    </td>
			                    <td colspan="10" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">Post Dated Payments
			                        <div style="color:red; font-style:italic"><span id="pdPayment">Amount</span></div>
			                    </td>
			                    <td colspan="8" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                </tr>
			                <tr class="google-visualization-orgchart-connrow-medium">
			                    <td colspan="27" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineleft google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-linebottom">&nbsp;</td>
			                    <td colspan="3" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                </tr>
			                <tr class="google-visualization-orgchart-connrow-medium">
			                    <td colspan="27" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineleft">&nbsp;</td>
			                    <td colspan="7" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineleft">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td class="google-visualization-orgchart-linenode google-visualization-orgchart-lineright">&nbsp;</td>
			                    <td colspan="3" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                </tr>
			                <tr class="google-visualization-orgchart-noderow-medium">
			                    <td colspan="24" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">Cash Payments
			                        <div style="color:red; font-style:italic"><span id="pdpCashPayment">Amount</span></div>
			                    </td>
			                    <td colspan="2" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">Cheque Payments
			                        <div style="color:red; font-style:italic"><span id="pdpChequePayment">Amount</span></div>
			                    </td>
			                    <td colspan="2" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                    <td colspan="6" class="google-visualization-orgchart-node google-visualization-orgchart-node-medium" title="Amount">RTGS/NEFT Payments
			                        <div style="color:red; font-style:italic"><span id="pdpRtgsPayment">Amount</span></div>
			                    </td>
			                </tr>
			                <tr class="google-visualization-orgchart-connrow-medium">
			                    <td colspan="46" class="google-visualization-orgchart-linenode">&nbsp;</td>
			                </tr>
			            </tbody>
			        </table>
			    </div>
             		
             	</div>
             </div>
         
         <!-- Invoice report code -->
         <div class="row row-background border-top">
         <div class="col-md-12 mb-2">
         		<h4>Excel Report of Amanat and Invoice</h4>
         		</div>
             	<div class="col-md-2">
             		<label class="lbl-rm-l">From</label>
             		<input class="form-control form-control-sm" type="date"  name="startDate" id="startDate1"  />
             	</div>
             	<div class="col-md-2">
             		<label class="lbl-rm-l">To</label>
             		<input class="form-control form-control-sm" type="date"  name="endDate" id="endDate1"  />
             	</div>
	             <div class="col-md-4">
		             <button type="button" class="btn btn-success btn-sm" id="InvoiceExcelReport" style="margin-top:32px;" onclick="openInvoiceInNewTab()">Get Invoice Excel Report</button>
	             </div>
            </div>    
         
         <!-- Amanat report code -->
         <div class="row row-background border-top">
         
             	<div class="col-md-2">
             		<label class="lbl-rm-l">From</label>
             		<input class="form-control form-control-sm" type="date"  name="startDate" id="startDate2"  />
             	</div>
             	<div class="col-md-2">
             		<label class="lbl-rm-l">To</label>
             		<input class="form-control form-control-sm" type="date"  name="endDate" id="endDate2"  />
             	</div>
	             <div class="col-md-4">
		             <button type="button" class="btn btn-success btn-sm" id="AmanatExcelReport" style="margin-top:32px;" onclick="openAmanatInNewTab()">Get Amanat Excel Report</button>
	             </div>
            </div>        
             
 </div>        
</div>
</div>

<script src="../js/jquery-3.3.1.slim.min.js" ></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/3.4.1-jq.js"></script>
<script src="../js/Validation.js"></script>
<script src="../chart/package/dist/Chart.js" ></script>
<script src="../chart/package/dist/Chart.bundle.js" ></script>
<script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUILoading.js" ></script>
<script type="text/javascript" charset="UTF-8" src="../js/Gcharts/FormatModule.js"></script>
<script type="text/javascript" charset="UTF-8" src="../js/Gcharts/DefaultModule.js"></script>
<script type="text/javascript" charset="UTF-8" src="../js/Gcharts/UiModule.js"></script>
<script type="text/javascript" charset="UTF-8" src="../js/Gcharts/OrgChartModule.js"></script>

<script>
function openInvoiceInNewTab() {
		var startDate = document.getElementById("startDate1").value;
    	var endDate = document.getElementById("endDate1").value;
  	  var win = window.open("../admin/InvoiceReportExcel.jsp?startDate="+startDate+"&endDate="+endDate, '_blank');
   	 win.focus();
}

function openAmanatInNewTab() {
	var startDate = document.getElementById("startDate2").value;
	var endDate = document.getElementById("endDate2").value;
	  var win = window.open("../admin/AmanatReportExcel.jsp?startDate="+startDate+"&endDate="+endDate, '_blank');
	 win.focus();
}

	 var myBarChart;
		document.getElementById("filter").addEventListener('click', function(e){
			var startDate = document.getElementById("startDate").value;
	        var endDate = document.getElementById("endDate").value;
	        var companyId = document.getElementById("companyId").value;
	        var CurrentDate = new Date();
			startDateProp = new Date(startDate);
			endDateProp = new Date(endDate);
			if(startDateProp > CurrentDate){
			    alert('Start date is greater than the current date.');
			}else if(endDateProp > CurrentDate){
			    alert('End date is greater than the current date.');
			}else if(endDateProp < startDateProp){
			    alert('Start date is greater than End date.');
			}else{
		        myBarChart.destroy();
				getStockReport(companyId, startDate, endDate);
			}
		});
		
		function getStockReport(companyId, startDate, endDate){
			$.blockUILoad();
			var url="../processing/getTodaysStockReport.jsp?companyId="+companyId+"&startDate="+startDate+"&endDate="+endDate;
				if(window.XMLHttpRequest){  
					fetchStock=new XMLHttpRequest();  
				}  
				else if(window.ActiveXObject){  
					fetchStock=new ActiveXObject("Microsoft.XMLHTTP");  
				}  
			  
				try{  
					fetchStock.onreadystatechange=fetchData;  
					console.log("AJAX Req sent");
					fetchStock.open("GET",url,true);  
					fetchStock.send();  
				}catch(e){alert("Unable to connect to server");}
			
		}

		 function fetchData(){
			 if(fetchStock.readyState == 4){
					var response = this.response.trim();
					var data = JSON.parse(response);
					console.log(data);
					if(data.hasOwnProperty("purchaseReport")){
						var data1 = data.purchaseReport;
						document.getElementById('totalPurchaseTable').innerHTML = data1.totalPurchase ;
						document.getElementById('cashPayment').innerHTML = data1.cashAmount ;
						document.getElementById('chequePayment').innerHTML = data1.chequeAmount ;
						document.getElementById('rtgsPayment').innerHTML = data1.rtgsAmount ;
						document.getElementById('pdPayment').innerHTML = data1.totalPdpPurchase ;
						document.getElementById('pdpCashPayment').innerHTML = data1.cashPdp ;
						document.getElementById('pdpChequePayment').innerHTML = data1.chequePdp ;
						document.getElementById('pdpRtgsPayment').innerHTML = data1.rtgsPdp ;
						
						if(data.hasOwnProperty("averageRate")){
							document.getElementById('aRate').innerHTML = data['averageRate'].toFixed(2);
						}
						
					}
				 setData(response);
				 $.unblockUILoad();
			 }
		 }

		 
		 function setData(data1){
			 
			 var obj = JSON.parse(data1);
			 console.log(obj);
			 if(obj.filtered==="yes"){
				 document.getElementById("totalRawCotton").innerHTML = obj.stockAddition.rawCotton+" Kgs.";
				 document.getElementById("amanatRawCotton").innerHTML = obj.amanatQty+" Kgs.";
				 if((Number(obj.stockAddition.rawCotton) - Number(obj.amanatQty)) < 0){
					 document.getElementById("NormalRawCotton").innerHTML = 0+" Kgs.";
				 }else{
					 document.getElementById("NormalRawCotton").innerHTML = (Number(obj.stockAddition.rawCotton) - Number(obj.amanatQty))+" Kgs.";
				 }
				
				 var canvas = document.getElementById("myChart");
				 var ctx = canvas.getContext('2d');
	
				 // Global Options:
				  Chart.defaults.global.defaultFontColor = 'black';
				  Chart.defaults.global.defaultFontSize = 16;
	
				 var data2 = {
				     labels: ["Cotton Bales", "Cotton Seeds", "Oil", "Cotton Cake"],
				       datasets: [
				         {
				             fill: true,
				             backgroundColor: [
				                 'black',
				                 'white',
				                 'green',
				                 'orange'],
				             data: [obj.stockAddition.cottonBales,obj.stockAddition.cottonSeed,obj.stockAddition.cottonSeedOil,obj.stockAddition.cottonCakes],
				 // Notice the borderColor 
				             borderColor: ['black', 'black','black','black'],
				             borderWidth: [2,2,2,2]
				         }
				     ]
				 };
			
				 // Notice the rotation from the documentation.
				 var options = {
				         title: {
				                   display: true,
				                   text: 'Stock Details',
				                   position: 'bottom'
				               },
				         rotation: -0.7 * Math.PI
				 };
	
	
				 // Chart declaration:
				myBarChart = new Chart(ctx, {
				     type: 'doughnut',
				     data: data2,
				     options: options
				 });
			 }else if(obj.filtered==="no"){
				 document.getElementById("totalRawCotton").innerHTML = obj.closingStock.rawCotton+" Kgs.";
				 document.getElementById("amanatRawCotton").innerHTML = obj.amanatQty+" Kgs.";
				 if((Number(obj.closingStock.rawCotton) - Number(obj.amanatQty)) < 0){
					 document.getElementById("NormalRawCotton").innerHTML = 0+" Kgs.";
				 }else{
					 document.getElementById("NormalRawCotton").innerHTML = (Number(obj.closingStock.rawCotton) - Number(obj.amanatQty))+" Kgs.";
				 }
				
				 var canvas = document.getElementById("myChart");
				 var ctx = canvas.getContext('2d');
	
				 // Global Options:
				  Chart.defaults.global.defaultFontColor = 'black';
				  Chart.defaults.global.defaultFontSize = 16;
	
				 var data2 = {
				     labels: ["Cotton Bales", "Cotton Seeds", "Oil", "Cotton Cake"],
				       datasets: [
				         {
				             fill: true,
				             backgroundColor: [
				                 'black',
				                 'white',
				                 'green',
				                 'orange'],
				             data: [obj.closingStock.cottonBales,obj.closingStock.cottonSeed,obj.closingStock.cottonSeedOil,obj.closingStock.cottonCakes],
				 // Notice the borderColor 
				             borderColor: ['black', 'black','black','black'],
				             borderWidth: [2,2,2,2]
				         }
				     ]
				 };
			
				 // Notice the rotation from the documentation.
				 var options = {
				         title: {
				                   display: true,
				                   text: 'Stock Details',
				                   position: 'bottom'
				               },
				         rotation: -0.7 * Math.PI
				 };
	
	
				 // Chart declaration:
				myBarChart = new Chart(ctx, {
				     type: 'doughnut',
				     data: data2,
				     options: options
				 });
			 }
		 }
		
		
		/* function getAverageRate(){
			var tRate = document.getElementById("tRate").innerHTML.trim();
			var aRate = document.getElementById("aRate").innerHTML.trim();
			console.log(tRate+"----------"+aRate);
			if(Number(tRate) > Number(aRate)){
				document.getElementById("aRate").style.background = "green";
				document.getElementById("aRate").style.color = "#fff";
			}else{
				document.getElementById("aRate").style.background = "red";	
				document.getElementById("aRate").style.color = "#fff";
			}
		} */
		
		function getTodayCottonRate(){
			$.blockUILoad();
			var url="../processing/getTodaysSuperRate.jsp";
			if(window.XMLHttpRequest){  
				fetchCottonRate=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchCottonRate=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchCottonRate.onreadystatechange=fetchRate;  
				console.log("AJAX Req sent");
				fetchCottonRate.open("GET",url,true);  
				fetchCottonRate.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function fetchRate(){
			 if(fetchCottonRate.readyState == 4){
				var response = this.response.trim();
				console.log(response);
				var data = JSON.parse(response);
				document.getElementById('tRate').innerHTML = data['superRate'];
				document.getElementById('aRate').innerHTML = data['averageRate'].toFixed(2);
				$.unblockUILoad();
				//getAverageRate();
			 }
		 }
		
		function getPurchaseReport(companyId, paymentType){
			$.blockUILoad();
			var url="../processing/purchaseReport.jsp?companyId="+companyId+"&paymentType="+paymentType;
			if(window.XMLHttpRequest){  
				fetchPurchase=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				fetchPurchase=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				fetchPurchase.onreadystatechange=fetchPurchaseAmount;  
				console.log("AJAX Req sent");
				fetchPurchase.open("GET",url,true);  
				fetchPurchase.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function fetchPurchaseAmount(){
			if(fetchPurchase.readyState == 4){
				document.getElementById('totalPurchase').innerHTML = this.response.trim();
				$.unblockUILoad();
			}
		}
		
		
		document.getElementById('paymentType').addEventListener('change',function(e){
		 	 var companyId = document.getElementById('companyId').value;
			getPurchaseReport(companyId, e.srcElement.value);
		});
		
		document.getElementById('companyId').addEventListener('change',function(e){
		 	 var paymentType = document.getElementById('paymentType').value;
			getPurchaseReport(e.srcElement.value, paymentType);
		});
		
		
		function getUserStatus(){
			$.blockUILoad();
				var url="../processing/userStatusData.jsp";
				if(window.XMLHttpRequest){  
					fetchStatus=new XMLHttpRequest();  
				}  
				else if(window.ActiveXObject){  
					fetchStatus=new ActiveXObject("Microsoft.XMLHTTP");  
				}  
			  
				try{  
					fetchStatus.onreadystatechange=fetchUserStatus;  
					console.log("AJAX Req sent");
					fetchStatus.open("GET",url,true);  
					fetchStatus.send();  
				}catch(e){alert("Unable to connect to server");}
		}
		
		function fetchUserStatus(){
			if(fetchStatus.readyState == 4){
				var response = this.response.trim();
				var data = JSON.parse(response);
				setUserData(data);
				$.unblockUILoad();
			}
		}
		
		function setUserData(data){
			
			var table = document.getElementById("usersTable");
			for(i=0; i<data.length; i++){
				var noOfRows = table.rows.length;
				var row = table.insertRow(noOfRows);
				
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				cell2.className = "d-flex justify-content-center align-items-center";
				cell1.innerHTML = data[i].name;
				
				if(Number(data[i].status) === 1){
					cell2.innerHTML = '<tr><td><div class="online"></div></td></tr>';
				}if(Number(data[i].status) === 0){
					cell2.innerHTML = '<tr><td><div class="offline"></div></td></tr>';
				}
			}
		}
		$(document).ready(function(){
			$(".c-nav-collapse").click(function(){
					$(".sidebar").toggle(); 
					if($(".sidebar").css("display")==="none"){
						$(".row").css("margin-left","10px"); 
					}else{
						$(".row").css("margin-left","225px"); 
					}
			})
		})
		
		
		function getTodaysPurchaseReport(){
			$.blockUILoad();
			var url="../processing/purchasePaymentReport.jsp";
			if(window.XMLHttpRequest){  
				paymentFetch=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				paymentFetch=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
		  
			try{  
				paymentFetch.onreadystatechange=fetchTodaysPurchase;  
				console.log("AJAX Req sent");
				paymentFetch.open("GET",url,true);  
				paymentFetch.send();  
			}catch(e){alert("Unable to connect to server");}
		}
		
		function fetchTodaysPurchase(){
			if(paymentFetch.readyState == 4){
				var response = this.response.trim();
				var data = JSON.parse(response);
				console.log(response);
				
				document.getElementById('totalPurchaseTable').innerHTML = data.totalPurchase ;
				document.getElementById('cashPayment').innerHTML = data.cashAmount ;
				document.getElementById('chequePayment').innerHTML = data.chequeAmount ;
				document.getElementById('rtgsPayment').innerHTML = data.rtgsAmount ;
				document.getElementById('pdPayment').innerHTML = data.totalPdpPurchase ;
				document.getElementById('pdpCashPayment').innerHTML = data.cashPdp ;
				document.getElementById('pdpChequePayment').innerHTML = data.chequePdp ;
				document.getElementById('pdpRtgsPayment').innerHTML = data.rtgsPdp ;
				$.unblockUILoad();
			}
		}
		
		//var interval = setInterval(getTodaysPurchaseReport, 10000);
		getStockReport(0,"","");
		getTodayCottonRate();
		getPurchaseReport("0","all");
		getUserStatus();
		getTodaysPurchaseReport();
		
		/***********************
			Side bar 
		************************/
	       $(document).ready(function () {
	            $('#sidebarCollapse').on('click', function () {
	                $('#sidebar').toggleClass('active');
	                
	            });
	        });
		document.getElementById("reset").addEventListener('click',function(e){
			location.reload();
		})
		
		</script>

<script type="text/javascript" src="../Js/Gcharts/Loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {
            packages: ["orgchart"]
        });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            //Extra column can be added here
            data.addColumn('string', 'Name');
            data.addColumn('string', 'Manager');
            data.addColumn('string', 'ToolTip');

            // For each orgchart box, provide the name, manager, and tooltip to show.
            data.addRows([
                [{
                        'v': 'Total Purchase Made',
                        'f': 'Total Purchase Made<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    '', 'Amount'
                ],

                [{
                        'v': 'Cash Payments',
                        'f': 'Cash Payments<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    'Total Purchase Made', 'Amount'
                ],
                [{
                        'v': 'Cheque Payments',
                        'f': 'Cheque Payments<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    'Total Purchase Made', 'Amount'
                ],
                [{
                        'v': 'RTGS/NEFT Payments',
                        'f': 'RTGS/NEFT Payments<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    'Total Purchase Made', 'Amount'
                ],
                [{
                        'v': 'Post Dated Payments',
                        'f': 'Post Dated Payments<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    'Total Purchase Made', 'Amount'
                ],

                [{
                        'v': 'Post Cash Payments',
                        'f': 'Cash Payments<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    'Post Dated Payments', 'Amount'
                ],
                [{
                        'v': 'Post Cheque Payments',
                        'f': 'Cheque Payments<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    'Post Dated Payments', 'Amount'
                ],
                [{
                        'v': 'Post RTGS/NEFT Payments',
                        'f': 'RTGS/NEFT Payments<div style="color:red; font-style:italic"><span>Amount</span></div>'
                    },
                    'Post Dated Payments', 'Amount'
                ],
            ]);

            // Create the chart.
            var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
            // Draw the chart, setting the allowHtml option to true for the tooltips.
            chart.draw(data, {
                'allowHtml': true
            });
        }
    </script>	
	
	
</body>
</html>

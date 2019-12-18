<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<%@ taglib uri="/WEB-INF/CustomTags.tld" prefix="c"%>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="../styles/bootstrap.min.css">
      <link rel="stylesheet" href="../styles/WBStyle.css">
      <script src="${pageContext.request.contextPath}/js/3.4.1-jq.js"></script>
      <script src="${pageContext.request.contextPath}/js/3.2.1-jq.js"></script>
      <script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
      <title>Vendor Payment</title>
   </head>
   <body>
      <%@include file="../accounts_operation_view/NavBar.jsp" %>
      <div class="container-fluid">
         <div class="row mt-2 tile-background-row border-bottom">
            <div class="col-md-5">
               <label class="lbl-rm-all">Search</label>
               <div class="d-flex justify-content-start align-items-center">
                  <input type="text" class="form-control" id="searchInvoiceNo" name="searchInvoiceNo" placeholder="Invoice No">
                  <button type="button" class="btn btn-success btn-no-radius" onclick="fetchInvoiceData(document.getElementById('searchInvoiceNo').value)">Fetch</button>
                  <button type="button" class="btn btn-success btn-no-radius lbl-rm-l btn_width-for-justify ml-1" onclick="openInNewTab(document.getElementById('invoiceId').value)">Print Invoice</button>
               </div>
            </div>
            <div class="col-md-4 offset-md-3">
               <div class="d-flex justify-content-end align-items-center">
                  <!--<div class="log">
                     <div class="heading">Balance Cash</div>
                     <div class="amt">100000</div>
                     </div>  -->	
                  <div class="log">
                     <div class="heading">Cheque Leaf</div>
                     <div class="amt" id="chequeLeaves">0</div>
                  </div>
                  <div class="log">
                     <div class="heading">Total RTGS/NEFT</div>
                     <div class="amt" id="rtgsCount">11</div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row mt-2 tile-background-row border-bottom">
            <div class="col-md-12">
               <input type="hidden" id="invoiceId" name="invoiceId" />
               <input type="hidden" id="customerId" name="customerId" />
               <input type="hidden" id="customerName" name="customerName" />
               <input type="hidden" id="companyId" name="companyId" />
               <input type="hidden" id="accountPayableId" name="accountPayableId" />
               <input type="hidden" id="dsBankId" name="dsBankId" />
               <input type="hidden" id="pdcId" name="pdcId" />
               <input type="hidden" id="chequePaymentStatus" value="0" />
               <input type="hidden" id="rtgsPaymentStatus" value="0" />
               <input type="hidden" id="cashPaymentStatus" value="0" />
               <input type="hidden" id="pdcChequePaymentStatus" value="0" />
               <input type="hidden" id="pdcRtgsPaymentStatus" value="0" />
               <input type="hidden" id="pdcCashPaymentStatus" value="0" />
               <div class="form-row">
                  <div class="col-md-4">
                     <label class="lbl-rm-all">Customer Information</label>
                     <textarea id="customerInfo" name="customerInfo" class="form-control " rows="4" readonly></textarea>
                  </div>
                  <div class="col-md-4">
                     <label class="lbl-rm-all">Invoice No</label>
                     <input type="text" class="form-control " id="invoiceNo" name="invoiceNo" readonly>
                     <label class="lbl-rm-all">Date</label>
                     <input type="text" class="form-control " id="invoiceDate" name="invoiceDate" readonly>
                  </div>
                  <div class="col-md-4">
                     <label class="lbl-rm-all">Total Amount to Pay</label>
                     <input type="text" class="form-control " id="totalAmount" name="totalAmount" readonly>
                     <label class="lbl-rm-all">Status</label>
                     <input type="text" class="form-control " id="invoiceStatus" name="invoiceStatus" value="Paid" readonly>
                  </div>
               </div>
            </div>
         </div>
         
         <div class="row mt-2 tile-background-row">
         	<div class="col-md-12" style="height:200px;overflow:auto;">
               <div class="tile-background-row">
                  <table class="table table-bordered">
                     <thead class="table-back">
                        <tr>
                           <th>Invoice No</th>
                           <th>Customer Name</th>
                           <th>RST</th>
                           <th>Amount</th>
                        </tr>
                     </thead>
                     <tbody id="tableBody">
                     </tbody>
                  </table>
               </div>
         	</div>
         </div>
         
         <div class="row mt-2 tile-background-row border-bottom">
            <div class="col-md-12">
               <table class="table table-sm table-bordered">
                  <thead>
                     <tr style="background:#212529;color:#fff;">
                        <th>Sr No</th>
                        <th>Mode</th>
                        <th>Account Type</th>
                        <th>Amount</th>
                        <th>Bank</th>
                        <th>Account No/Cheque No</th>
                        <th>IFSC</th>
                        <th>Date</th>
                        <th>Name</th>
                        <th>Print</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>1</td>
                        <td>Cash</td>
                        <td>
                           <select class="form-control" id="cashAccountId" name="cashAccountId">
                              <c:CashLedgerTag/>
                           </select>
                        </td>
                        <td>
                           <input type="text" class="form-control input-cash" id="cashAmount" name="cashAmount" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="date" class="form-control" id="cashDate" name="cashDate" value="" readonly="readonly">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <button type="button" class="btn btn-success" style="width:100%;" id="payCash">Pay</button>
                        </td>
                     </tr>
                     <tr>
                        <td>2</td>
                        <td>Cheque <input type="hidden" id="chequeId" name="chequeId" value="0" /></td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control input-cash" id="chequeAmount" value="0" name="" readonly>
                        </td>
                        <td>
                           <select type="text" class="form-control" id="chequeBank" name="chequeBank">
                              <c:Bank />
                           </select>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="chequeNo" name="chequeNo" placeholder="Cheque No.">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="date" class="form-control" id="chequeDate" name="chequeDate" value="" readonly="readonly">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="nameOnCheque" name="nameOnCheque" placeholder="Name on Cheque">
                        </td>
                        <td>
                           <button type="button" class="btn btn-success btn-no-radius" style="width:100%;" onclick="PrintChequeData(document.getElementById('chequeId').value)" id="payCheque">Print</button>
                        </td>
                     </tr>
                     <tr>
                        <td>3</td>
                        <td>RTGS/NEFT</td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control input-cash" id="rtgsAmount" name="rtgsAmount" value="0" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="rtgsBank" name="rtgsBank" placeholder="RTGS Bank Name">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="rtgsAccountNo" name="rtgsAccountNo" placeholder="Account No.">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="rtgsIfsc" name="rtgsIfsc" placeholder="IFSC Code">
                        </td>
                        <td >
                           <input type="date" class="form-control " id="rtgsAmountDate" name="rtgsAmountDate" readonly="readonly">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                     </tr>
                     <tr>
                        <td>4</td>
                        <td>PDP Cash <input type="hidden" id="pdcChequeId" name="pdcChequeId" value="0" /></td>
                        <td>
                           <select class="form-control" id="pdcCashAccountId" name="pdcCashAccountId">
                              <c:CashLedgerTag/>
                           </select>
                        </td>
                        <td>
                           <input type="text" class="form-control input-cash" id="pdcCashAmount" name="pdcCashAmount" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td >
                           <input type="date" class="form-control " id="pdcCashAmountDate" name="cashAmountDate" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <button type="button" class="btn btn-success" style="width:100%;" id="payPdcCash">Pay</button>
                        </td>
                     </tr>
                     <tr>
                        <td>5</td>
                        <td>PDP Cheque</td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control input-cash" id="pdcChequeAmount" value="0" name="" readonly>
                        </td>
                        <td>
                           <select class="form-control" id="pdcChequeBank" name="pdcChequeBank">
                              <c:Bank />
                           </select>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="pdcChequeNo" name="pdcChequeNo" placeholder="Cheque No.">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="date" class="form-control" id="pdcChequeDate" name="pdcChequeDate" value="" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="pdcNameOnCheque" name="pdcNameOnCheque" placeholder="Name on Cheque">
                        </td>
                        <td>
                           <button type="button" class="btn btn-success btn-no-radius" style="width:100%;" onclick="PrintChequeData(document.getElementById('pdcChequeId').value)" id="payCheque">Print</button>
                        </td>
                     </tr>
                     <tr>
                        <td>6</td>
                        <td>PDP RTGS/NEFT</td>
                       <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control input-cash" id="pdcRtgsAmount" name="pdcRtgsAmount" value="0" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="pdcRtgsBank" name="pdcRtgsBank" placeholder="RTGS Bank Name">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="pdcRtgsAccountNo" name="pdcRtgsAccountNo" placeholder="Account No.">
                        </td>
                        <td>
                           <input type="text" class="form-control" id="pdcRtgsIfsc" name="pdcRtgsIfsc" placeholder="IFSC Code">
                        </td>
                        <td>
                           <input type="date" class="form-control" id="pdcRtgsDate" name="pdcRtgsDate" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                        <td>
                           <input type="text" class="form-control" id="" name="" value="Not Applicable" readonly>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <div class="form-row border-top" style="width:100%;" >
                  <div class="col-md-12">
                     <div class="d-flex justify-content-end align-items-center">
                        <button type="button" class="btn btn-success  btn-no-radius" id="submitButton" disabled>Submit Payment</button>
                        <button type="button" class="btn btn-success  btn-no-radius ml-1" id="" onclick="location.reload()">Reset</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Response modal pop up -->
      <div class="response-back-display"></div>
      <div class="response-body">
         <div class="response-header">
            <h5>Information</h5>
         </div>
         <div class="response-content">
            <div class="d-flex justify-content-center align-items-center">
               <h5 id="response-text" class="ml-4"></h5>
            </div>
         </div>
         <div class="response-footer">
            <button type="button" class="btn btn-success btn-response" id="response-button">Ok</button>
         </div>
      </div>
      <script src="../js/popper.min.js"></script>
      <script src="../js/bootstrap.min.js"></script>
      <script src="../js/Validation.js"></script>
      <script src="../js/commonjs.js"></script>
      <script>
         /**************************************
         *Validation
         ***************************************/
         var cashStatus = false;
         var chequeStatus = false;
         var rtgsNeftStatus = false;
         var pdpCashStatus = false;
         var pdpChequeStatus = false;
         var pdpRtgsNeftStatus = false;
         
         var paymentData = {
         		"cashData":[],
         		"chequeData":[],
         		"rtgsNeftData":[],
         		"pdcCashData":[],
         		"pdcChequeData":[],
         		"pdcRtgsNeftData":[]
         		
         }
         
         
         $.fn.validateCash = function(){//validating cash data
         	if($("#cashAccountId").val()!=""){
         		paymentData.cashData.push($("#cashAccountId").val());
         		if($("#cashAmount").val()!=""){
         			paymentData.cashData.push($("#cashAmount").val());
         			paymentData.cashData.push($("#customerId").val());
         			return true;
         		}else{
         			$.fn.checkStatus(1,"Please check amount");
           				$("#cashAmount").css("border","1px solid red");
           				return false;
         		}
         	}else{
         		$.fn.checkStatus(1,"Please setup cash account");
         		$("#cashAccountId").css("border","1px solid red");
         		return false;
         	}
         }
         
         
         $.fn.validateCheque = function(){
         	if($("#chequeAmount").val()!=""){
         		paymentData.chequeData.push($("#chequeAmount").val());
         		if($("#chequeBank").val()!=""){
         			paymentData.chequeData.push($("#chequeBank").val());
         			if($("#chequeNo").val()!=""){
         				paymentData.chequeData.push($("#chequeNo").val());
         				if($("#chequeDate").val()!=""){
         					paymentData.chequeData.push($("#chequeDate").val());
         					if($("#nameOnCheque").val()!=""){
         						paymentData.chequeData.push($("#nameOnCheque").val());
         						return true;
         					}else{
         						$.fn.checkStatus(1,"Please enter name.");
                       				$("#nameOnCheque").css("border","1px solid red");
                       				return false;
         					}
         				}else{
         					$.fn.checkStatus(1,"Please enter date.");
                   				$("#chequeDate").css("border","1px solid red");
                   				return false;
         				}
         			}else{
         				$.fn.checkStatus(1,"Please enter cheque number.");
               				$("#chequeNo").css("border","1px solid red");
               				return false;
         			}
         		}else{
         			$.fn.checkStatus(1,"Please enter bank name.");
           				$("#chequeAmount").css("border","1px solid red");
           				return false;
         		}
         	}else{
         		$.fn.checkStatus(1,"Please check amount.");
         		$("#chequeAmount").css("border","1px solid red");
         		return false;
         	}
         }
         
         $.fn.validateRtgsNeft = function(){
         if($("#rtgsAmount").val()!=""){
         paymentData.rtgsNeftData.push($("#rtgsAmount").val());
         if($("#rtgsBank").val()!=""){
         paymentData.rtgsNeftData.push($("#rtgsBank").val());
         if($("#rtgsAccountNo").val()!=""){
         paymentData.rtgsNeftData.push($("#rtgsAccountNo").val());
         if($("#rtgsIfsc").val()!=""){
         paymentData.rtgsNeftData.push($("#rtgsIfsc").val());
         return true;
         }else{
         $.fn.checkStatus(1,"Please check Ifsc.");
          				$("#rtgsIfsc").css("border","1px solid red");
          				return false;
         }
         }else{
         $.fn.checkStatus(1,"Please check account number.");
         				$("#rtgsAccountNo").css("border","1px solid red");
         				return false;
         }
         }else{
         $.fn.checkStatus(1,"Please check bank name.");
         			$("#rtgsBank").css("border","1px solid red");
         			return false;
         }
         }else{
         $.fn.checkStatus(1,"Please check amount.");
         		$("#rtgsAmount").css("border","1px solid red");
         		return false;
         }	
         }
         
         $.fn.validatePdcCash = function(){
         if($("#pdcCashAccountId").val()!=""){
         		paymentData.pdcCashData.push($("#pdcCashAccountId").val());
         		if($("#pdcCashAmount").val()!=""){
         			paymentData.pdcCashData.push($("#pdcCashAmount").val());
         			return true;
         		}else{
         			$.fn.checkStatus(1,"Please check amount");
           				$("#pdcCashAmount").css("border","1px solid red");
           				return false;
         		}
         	}else{
         		$.fn.checkStatus(1,"Please setup cash account");
         		$("#pdcCashAccountId").css("border","1px solid red");
         		return false;
         	}
         }
         
         $.fn.validatePdcCheque = function(){
         if($("#pdcChequeAmount").val()!=""){
         		paymentData.pdcChequeData.push($("#pdcChequeAmount").val());
         		if($("#pdcChequeBank").val()!=""){
         			paymentData.pdcChequeData.push($("#pdcChequeBank").val());
         			if($("#pdcChequeNo").val()!=""){
         				paymentData.pdcChequeData.push($("#pdcChequeNo").val());
         				if($("#pdcChequeDate").val()!=""){
         					paymentData.pdcChequeData.push($("#pdcChequeDate").val());
         					if($("#pdcNameOnCheque").val()!=""){
         						paymentData.pdcChequeData.push($("#pdcNameOnCheque").val());
         						return true;
         					}else{
         						$.fn.checkStatus(1,"Please enter name.");
                       				$("#pdcNameOnCheque").css("border","1px solid red");
                       				return false;
         					}
         				}else{
         					$.fn.checkStatus(1,"Please enter date.");
                   				$("#pdcChequeDate").css("border","1px solid red");
                   				return false;
         				}
         			}else{
         				$.fn.checkStatus(1,"Please enter cheque number.");
               				$("#pdcChequeNo").css("border","1px solid red");
               				return false;
         			}
         		}else{
         			$.fn.checkStatus(1,"Please enter bank name.");
           				$("#pdcChequeBank").css("border","1px solid red");
           				return false;
         		}
         	}else{
         		$.fn.checkStatus(1,"Please check amount.");
         		$("#pdcChequeAmount").css("border","1px solid red");
         		return false;
         	}
         }
         
         $.fn.validatePdcRtgsNeft = function(){
         if($("#pdcRtgsAmount").val()!=""){
         paymentData.pdcRtgsNeftData.push($("#pdcRtgsAmount").val());
         if($("#pdcRtgsBank").val()!=""){
         paymentData.pdcRtgsNeftData.push($("#pdcRtgsBank").val());
         if($("#pdcRtgsAccountNo").val()!=""){
         paymentData.pdcRtgsNeftData.push($("#pdcRtgsAccountNo").val());
         if($("#pdcRtgsIfsc").val()!=""){
         paymentData.pdcRtgsNeftData.push($("#pdcRtgsIfsc").val());
         if($("#pdcRtgsDate").val()!=""){
         	paymentData.pdcRtgsNeftData.push($("#pdcRtgsDate").val());
         	return true;
         }else{
         	$.fn.checkStatus(1,"Please check date.");
           				$("#pdcRtgsDate").css("border","1px solid red");
           				return false;
         }
         }else{
         $.fn.checkStatus(1,"Please check Ifsc.");
          				$("#pdcRtgsIfsc").css("border","1px solid red");
          				return false;
         }
         }else{
         $.fn.checkStatus(1,"Please check account number.");
         				$("#pdcRtgsAccountNo").css("border","1px solid red");
         				return false;
         }
         }else{
         $.fn.checkStatus(1,"Please check bank name.");
         			$("#pdcRtgsBank").css("border","1px solid red");
         			return false;
         }
         }else{
         $.fn.checkStatus(1,"Please check amount.");
         		$("#pdcRtgsAmount").css("border","1px solid red");
         		return false;
         }	
         }
         
         
         
         $(document).ready(function(){
         	$("#submitButton").click(function(){
         		var globalStatus = []
         		
         		if(cashStatus===true){
         			globalStatus.push($.fn.validateCash());
         		}
         		
         		if(chequeStatus===true){
         			globalStatus.push($.fn.validateCheque());
         		}
         		
         		if(rtgsNeftStatus===true){
         			globalStatus.push($.fn.validateRtgsNeft());
         		}
         		
         		if(pdpCashStatus===true){
         			globalStatus.push($.fn.validatePdcCash());
         		}
         		
         		
         		if(pdpChequeStatus===true){
         			globalStatus.push($.fn.validatePdcCheque());
         		}
         		
         		
         		if(pdpRtgsNeftStatus===true){
         			globalStatus.push($.fn.validatePdcRtgsNeft());
         		}
         		
         		
         		//Cheking values in global status
         		$.fn.checkGlobalStatus = function(validity){
         			if(validity===true){
         				return true
         			}else{
         				return false
         			}
         		}
         		var globalStatusLength = globalStatus.length;
         	
         		if(globalStatus.every($.fn.checkGlobalStatus)===true){
         		//Sendig data from here for JSP
         			//console.log(paymentData);
         			submitPayment();
         		}else{
         			$.fn.checkStatus(1,"Details are empty");
         			console.log(globalStatus);
         		}
         	})
         });
         
         
         /********************************************************************/
         //Set Current Date & Time in todays cheque date
         function setCurrentDate(){
         var today = new Date();
         var dd = today.getDate();
         var mm = today.getMonth()+1; //January is 0!
         var yyyy = today.getFullYear();
         
         if(dd<10){
           dd='0'+dd;
         } 
         if(mm<10){
           mm='0'+mm;
         } 
         
         todayDate = yyyy+'-'+mm+'-'+dd; 
         formattedDate = dd+'-'+mm+'-'+yyyy;
         var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
         var dateTime = formattedDate+' '+time;
         
         document.getElementById("chequeDate").value = todayDate;
         
         }
         
         
         /********************************************************************/
         //Get Pending Invoice Report
         function getPendingInvReport(){
         var url="${pageContext.request.contextPath}/processing/pendingInvoiceReport.jsp";
         if(window.XMLHttpRequest){  
         invReport=new XMLHttpRequest();  
         }  
         else if(window.ActiveXObject){  
         invReport=new ActiveXObject("Microsoft.XMLHTTP");  
         }  
         try{  
         invReport.onreadystatechange=getInvReport;  
         console.log("AJAX Req sent");
         invReport.open("GET",url,true);  
         invReport.send();  
         }catch(e){alert("Unable to connect to server");}
         }
         
         
         //Get response of Pending Invoices requested by AJAX
         function getInvReport(){
         if(invReport.readyState == 4){
         var response = this.response.trim();
         var data = JSON.parse(response);
         setPendingTable(data);
         } 
         }
         
         //Set pending Invoice Report data in table
         function setPendingTable(data){
        	console.log(data);
         var table = document.getElementById("tableBody");
         table.innerHTML = "";
         for(i=0;i<data.length;i++){
         var noOfRows = table.rows.length;
         var row = table.insertRow(noOfRows);
         
         var cell1 = row.insertCell(0);
         var cell2 = row.insertCell(1);
         var cell3 = row.insertCell(2);
         var cell4 = row.insertCell(3);
         
         cell1.innerHTML = data[i].invoiceNo;
         cell2.innerHTML = data[i].customerName;
         cell3.innerHTML = data[i].rst;
         cell4.innerHTML = data[i].pendingAmount;
         }
         }
         
         /********************************************************************/
         //Send AJAX request to get Daily Setup data
         function getDailySetupData(){
         url = "../processing/setDailyInvSetup.jsp";
         if(window.XMLHttpRequest){  
         fetchDailySetupRequest=new XMLHttpRequest();  
         }  
         else if(window.ActiveXObject){  
         fetchDailySetupRequest=new ActiveXObject("Microsoft.XMLHTTP");  
         }  
         try{  
         fetchDailySetupRequest.onreadystatechange=fetchDailySetupData;  
         console.log("AJAX Req sent");
         fetchDailySetupRequest.open("GET",url,true);  
         fetchDailySetupRequest.send();  
         }catch(e){alert("Unable to connect to server");}
         }
         
         //Get response of Daily setup request 
         function  fetchDailySetupData(){
         	if(fetchDailySetupRequest.readyState == 4){
         		var response = this.response.trim();
         		var data = JSON.parse(response);
        	 	console.log(data);
         		setDailySetupData(data);
        	 }
         }
         
         //Set Daily Setup data in Input Fields
         function setDailySetupData(data){
	         var chequeBank =  document.getElementById('chequeBank');
	         for(i=0; i<chequeBank.options.length; i++){
		         if(data.bankId != Number(chequeBank.options[i].value)){
		         	chequeBank.options[i].disabled = true;
		         }
		         else if(data.bankId === Number(chequeBank.options[i].value)){
		         	chequeBank.options[i].selected = true;
		         }
		       }
		         
	         var pdcBank =  document.getElementById('pdcChequeBank');
	         for(i=0; i<pdcBank.options.length; i++){
		         if(data.bankId != Number(pdcBank.options[i].value)){
		         pdcBank.options[i].disabled = true;
		         }
		         else if(data.bankId === Number(pdcBank.options[i].value)){
		         pdcBank.options[i].selected = true;
		         }
		      }
		         
	         var cashAccounts = document.getElementById('cashAccountId');
	         for(i=0;i<cashAccounts.options.length;i++){
		         if(data.companyId != Number(cashAccounts.options[i].getAttribute('data-company-id'))){
		         	cashAccounts.options[i].disabled = true;
		         }
		         else if(data.companyId === Number(cashAccounts.options[i].getAttribute('data-company-id'))){
		         	cashAccounts.options[i].selected = true;
		         }
	         }
	         
	         var pdcCashAccounts = document.getElementById('pdcCashAccountId');
	         for(i=0;i<pdcCashAccounts.options.length;i++){
	         	if(data.companyId != Number(pdcCashAccounts.options[i].getAttribute('data-company-id'))){
	         	pdcCashAccounts.options[i].disabled = true;
	         	}
	         	else if(data.companyId === Number(pdcCashAccounts.options[i].getAttribute('data-company-id'))){
	         		pdcCashAccounts.options[i].selected = true;
	        	 }
	         }
	         
	         document.getElementById('companyId').value = data.companyId;
	         document.getElementById('chequeLeaves').innerHTML = data.totalCheques;
	         document.getElementById('accountPayableId').value = data.accPayableId;
	         document.getElementById('dsBankId').value = data.bankId;
	         getRtgsCount(document.getElementById('companyId').value);
         }
         
         
         
         /****************************************************************************/
         //Send AJAX request to get RTGS transaction count for today 
         function getRtgsCount(companyId){
	         console.log(companyId);
	         url = "../processing/getTodaysRtgsCount.jsp?companyId="+companyId;
	         if(window.XMLHttpRequest){  
	         	fetchRtgsCount=new XMLHttpRequest();  
	         }  
	         else if(window.ActiveXObject){  
	         	fetchDailySetupRequest=new ActiveXObject("Microsoft.XMLHTTP");  
	         }  
	         try{  
	         	fetchRtgsCount.onreadystatechange=fetchRtgsCountData;  
	         	console.log("AJAX Req sent");
	         	fetchRtgsCount.open("GET",url,true);  
	         	fetchRtgsCount.send();  
	         	}catch(e){alert("Unable to connect to server");}
         }
         
         //Get response of RTGS count from AJAX request
         function fetchRtgsCountData(){
       		if(fetchRtgsCount.readyState == 4){
         		var response = this.response.trim();
        		document.getElementById('rtgsCount').innerHTML = response;	
        	 }
         }
         
         
         /****************************************************************************/
         //Send AJAX Request to fetch invoice data
         function fetchInvoiceData(invoiceNo){
	         url = "../processing/getDataForOperator.jsp?invoiceNo="+invoiceNo;
	         if(window.XMLHttpRequest){  
	         	fetchInvoiceReq=new XMLHttpRequest();  
	         }  
	         else if(window.ActiveXObject){  
	         	fetchInvoiceReq=new ActiveXObject("Microsoft.XMLHTTP");  
	         }  
	         try{  
		         fetchInvoiceReq.onreadystatechange=getInvoiceData;  
		         console.log("AJAX Req sent");
		         fetchInvoiceReq.open("GET",url,true);  
		         fetchInvoiceReq.send();  
	         }catch(e){alert("Unable to connect to server");}
         }
         
         
         //Get data from AJAX request
         function getInvoiceData(){
	         if(fetchInvoiceReq.readyState == 4){
		         var response = this.response.trim();
		         if(Number(response) === 0){
		        	 window.alert('Invalid Invoice Number entered. Please check the Invoice No. and search again.');
		         }else{
			         var data = JSON.parse(response);
			         console.log(data);
			         setData(data);
		         }
	         }
         }
         
         var cashPayStatus = 1;
         var chequePayStatus = 1;
         var rtgsPayStatus = 1;
         var pdcPayStatus = 1;
         
         
         function setData(data){
	         setCurrentDate();
	         getDailySetupData();
	         var invoiceBasicJson = data.invoiceBasic;
	         
	         document.getElementById('invoiceNo').value = invoiceBasicJson.invoiceNo ;
	         document.getElementById('invoiceId').value = invoiceBasicJson.id;
	         document.getElementById('customerId').value = invoiceBasicJson.customerId;
	         document.getElementById('customerInfo').value = invoiceBasicJson.customerName +'\n' + invoiceBasicJson.customerAddress + '\n' + invoiceBasicJson.customerMobile  ;
	         document.getElementById('customerName').value = invoiceBasicJson.customerName;
	         document.getElementById('invoiceDate').value = invoiceBasicJson.invoiceDate ;
	         document.getElementById('totalAmount').value = invoiceBasicJson.totalAmount ;
	         document.getElementById('accountPayableId').value = invoiceBasicJson.accountPayableId ;
	         document.getElementById('companyId').value = invoiceBasicJson.companyId ;
	         
	         
	         var paymentDetails = data.paymentDetails;
	         
	         if(paymentDetails.hasOwnProperty("cashJson")){
		         var cashJson = paymentDetails.cashJson;
		         document.getElementById('cashAmount').value = cashJson.amount ;
		         document.getElementById('cashPaymentStatus').value = cashJson.paymentStatus ;
		         document.getElementById('cashDate').value = cashJson.date;
		         if(Number(cashJson.paymentStatus) === 1){
			         document.getElementById("cashAccountId").value = cashJson.accountId;
			         document.getElementById('cashDate').value = cashJson.date;
			         document.getElementById('payCash').disabled = true;
			         cashPayStatus = 1;
			         cashStatus = false;
		         }else{
			         cashPayStatus = 0;
			         cashStatus = true;
		         }
	         }
	         if(paymentDetails.hasOwnProperty("chequeJson")){
		         var chequeJson = paymentDetails.chequeJson;
		         document.getElementById('chequeAmount').value = chequeJson.amount ;
		         document.getElementById('chequePaymentStatus').value = chequeJson.paymentStatus ;
		         document.getElementById('chequeDate').value = chequeJson.date ;
		         
		         if(Number(chequeJson.paymentStatus) === 1){
			         document.getElementById('chequeBank').value = chequeJson.bankId;
			         document.getElementById('chequeNo').value = chequeJson.chequeNo ;
			         document.getElementById('chequeDate').value = chequeJson.chequeDate ;
			         document.getElementById('nameOnCheque').value = chequeJson.customerName ;
			         document.getElementById('chequeId').value = chequeJson.id ;
			         document.getElementById('chequeDate').value = chequeJson.date ;
			         chequePayStatus = 1;
			         chequeStatus = false;
		         }else{
			         document.getElementById('chequeNo').value = "" ;
			         document.getElementById('nameOnCheque').value = invoiceBasicJson.customerName;
			         chequePayStatus = 0;
			         chequeStatus = true;
		         }
	         }
	         if(paymentDetails.hasOwnProperty("rtgsJson")){
		         var rtgsJson = paymentDetails.rtgsJson;
		         document.getElementById('rtgsAmount').value = rtgsJson.amount ;
		         document.getElementById('rtgsPaymentStatus').value = rtgsJson.paymentStatus ;
		         document.getElementById('rtgsAmountDate').value = rtgsJson.date ;
		         if(Number(rtgsJson.paymentStatus) === 1){
			         document.getElementById('rtgsBank').value = rtgsJson.bankName ;
			         document.getElementById('rtgsAccountNo').value = rtgsJson.accountNo ;
			         document.getElementById('rtgsIfsc').value = rtgsJson.ifscCode ;
			         document.getElementById('rtgsAmountDate').value = rtgsJson.date ;
			         rtgsPayStatus = 1;
			         rtgsNeftStatus = false;
		         }else{
			         document.getElementById('rtgsBank').value = "" ;
			         document.getElementById('rtgsAccountNo').value = "" ;
			         document.getElementById('rtgsIfsc').value = "" ;
			         rtgsPayStatus = 0;
			         rtgsNeftStatus = true;
		         }
	         }
	         
	         if(Object.entries(data.pdcData).length != 0){
	         	var pdcJson = data.pdcData;
		         if(Number(pdcJson.modeOfPayment) === 2){
			         document.getElementById('pdcChequeAmount').value = pdcJson.pdcAmount ;
			         document.getElementById('pdcChequePaymentStatus').value = pdcJson.pdcPayStatus ;
			         document.getElementById('pdcId').value = pdcJson.pdcId ;
			         if(Number(pdcJson.pdcPayStatus) === 1){
				         document.getElementById('pdcChequeId').value = pdcJson.chequeId;
				         document.getElementById('pdcChequeDate').value = pdcJson.payDate;
				         document.getElementById('pdcNameOnCheque').value = pdcJson.customerName;
				         document.getElementById('pdcChequeNo').value = pdcJson.chequeNo ;
				         pdcPayStatus = 1;
				         pdpChequeStatus  = false;
			         }else{
				         document.getElementById('pdcChequeId').value = "";
				         document.getElementById('pdcChequeDate').value = pdcJson.payDate ;
				         document.getElementById('pdcNameOnCheque').value = invoiceBasicJson.customerName;
				         document.getElementById('pdcChequeNo').value = "";
				         pdcPayStatus = 0;
				         pdpChequeStatus  = true;
			         }
		         }else if(Number(pdcJson.modeOfPayment) === 3){
			         document.getElementById('pdcId').value = pdcJson.pdcId ;
			         document.getElementById('pdcRtgsAmount').value = pdcJson.pdcAmount;
			         document.getElementById('pdcRtgsPaymentStatus').value = pdcJson.pdcPayStatus;
			         if(Number(pdcJson.pdcPayStatus) === 1){
				         document.getElementById('pdcRtgsBank').value = pdcJson.bankName ;
				         document.getElementById('pdcRtgsAccountNo').value = pdcJson.accountNo ;
				         document.getElementById('pdcRtgsIfsc').value = pdcJson.ifscCode ;
				         document.getElementById('pdcRtgsDate').value = pdcJson.payDate ;
				         pdcPayStatus = 1;
				         pdpRtgsNeftStatus = false;
			         }else{
				         document.getElementById('pdcRtgsBank').value = '' ;
				         document.getElementById('pdcRtgsAccountNo').value = '' ;
				         document.getElementById('pdcRtgsIfsc').value = '' ;
				         document.getElementById('pdcRtgsDate').value = pdcJson.payDate ;
				         pdcPayStatus = 0;
				         pdpRtgsNeftStatus = true;
			         }
		         }else if(Number(pdcJson.modeOfPayment) === 1){
			         document.getElementById('pdcId').value = pdcJson.pdcId ;
			         document.getElementById('pdcCashAmount').value = pdcJson.pdcAmount;
			         document.getElementById('pdcCashPaymentStatus').value = pdcJson.pdcPayStatus;
			         if(Number(pdcJson.pdcPayStatus) === 1){
				         document.getElementById('pdcCashAccountId').value = pdcJson.accountId  ;
				         document.getElementById('payPdcCash').disabled = true;
				         pdcPayStatus = 1;
				         pdpCashStatus = false;
			         }else{
				         pdcPayStatus = 0;
				         pdpCashStatus  = true;
			         }
		         }
	         }else if(Object.entries(data.pdcData).length === 0){
	         }
	         if(pdcPayStatus === 1 && rtgsPayStatus === 1 && chequePayStatus === 1){
	         	document.getElementById('invoiceStatus').value = "Paid by Operator";
	         	var submitButton = document.getElementById('submitButton');
	         	submitButton.disabled = true;
	         }else{
	         	document.getElementById('invoiceStatus').value = "Payment Pending";
	         	$("#submitButton").prop('disabled',false);
	         } 
	        	 
         }
         
         
         /***************************************************************************/
         //Print Invoice
         function openInNewTab(invoiceId) {
	         if(Number(invoiceId) === 0 || invoiceId===""){
	      	   alert("Invalid Invoice No.");
	         }
	         else{
	       	  var win = window.open("../report/InvoicePDFPrintOnly.jsp?invoiceId="+invoiceId, '_blank');
	        	 win.focus();
	         }
         }
         
         
         
         /******************************************************************************/
         //Click on table to fetch data
         document.addEventListener('click',function(e){
         	if(e.srcElement.tagName === 'TR' && e.srcElement.parentNode.id === 'tableBody'){
         		resetInputFields();
         		var invoiceNo = e.srcElement.children[0].innerHTML.trim();
         		fetchInvoiceData(invoiceNo);
         	}
         	if(e.srcElement.tagName === 'TD' && e.srcElement.parentNode.parentNode.id === 'tableBody'){
        		resetInputFields();
         		var row = e.srcElement.parentNode;
         		var invoiceNo = row.children[0].innerHTML.trim();
         		fetchInvoiceData(invoiceNo);
         	}
         })		
         
         
         /**************************************************************************/
         //Reset input fields
         function resetInputFields(){
	        var inputs = document.getElementsByTagName("input");
	        for(i=0; i< inputs.length; i++){
	        	 inputs[i].value= "";
	         }
         }
         
         
         
         /***************************************************************************/
         //Submit form data
         function submitPayment(){//submit form data
	         var parentJson = {};
	         parentJson['invoiceId'] = document.getElementById('invoiceId').value;
	         
	         /*if(cashStatus === true){
		         var cashJson = submitCash();
		         parentJson['cashJson'] = cashJson;
	         }*/
	         if(chequeStatus === true){
		         var chequeJson = submitChequeData();
		         parentJson['chequeJson'] = chequeJson;
	         }
	         if(rtgsNeftStatus === true){
		         var rtgsJson = submitRtgsData();
		         parentJson['rtgsJson'] = rtgsJson;
	         }
	         /*if(pdpCashStatus === true){
		         var pdcCashJson = submitPdcCash();
		         parentJson['pdcCashJson'] = pdcCashJson;
	         }*/
	         if(pdpChequeStatus === true){
		         var pdcChequeJson = submitPdc();
		         parentJson['pdcChequeJson'] = pdcChequeJson;
	         }
	         if(pdpRtgsNeftStatus === true){
		         var pdcRtgsJson = submitPdcRtgs();
		         parentJson['pdcRtgsJson'] = pdcRtgsJson;
         	}
        	 
	         console.log(parentJson);
	         var jsonData = JSON.stringify(parentJson);
	         
	         document.getElementById("submitButton").disabled = true;
	         
	         submitDataAjax(jsonData);
         }
         
         
         function submitChequeData(){
         
	         var chequeJson = {};
	         chequeJson['dataType'] = 'cheque';
	         chequeJson['chequeAmount']= document.getElementById('chequeAmount').value;
	         var bank = document.getElementById('chequeBank');
	         chequeJson['chequeBankId'] = bank.value;
	         chequeJson['chequeBankName'] = bank.options[bank.selectedIndex].text.split('-')[0].trim();
	         chequeJson['chequeNo'] = document.getElementById('chequeNo').value;
	         chequeJson['chequeDate'] = document.getElementById('chequeDate').value;
	         chequeJson['chequeName'] = document.getElementById('nameOnCheque').value;
	         chequeJson['invoiceId'] = document.getElementById('invoiceId').value;
	         chequeJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	         chequeJson['customerId'] = document.getElementById('customerId').value;
	         chequeJson['customerName'] = document.getElementById('customerName').value;
	         chequeJson['bankAccountId'] = bank.options[bank.selectedIndex].getAttribute('data-account-id');
	         chequeJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	         chequeJson['paymentStatus'] = document.getElementById('chequePaymentStatus').value;
	         
	         return chequeJson;
         }
         
         function submitRtgsData(){
	         
	         var rtgsJson = {};
	         rtgsJson['dataType'] = 'rtgs';
	         rtgsJson['rtgsAmount']= document.getElementById('rtgsAmount').value;
	         rtgsJson['rtgsBank'] = document.getElementById('rtgsBank').value;
	         rtgsJson['rtgsAccountNo'] = document.getElementById('rtgsAccountNo').value;
	         rtgsJson['rtgsIfsc'] = document.getElementById('rtgsIfsc').value;
	         rtgsJson['rtgsDate'] = document.getElementById('invoiceDate').value;
	         rtgsJson['invoiceId'] = document.getElementById('invoiceId').value;
	         rtgsJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	         rtgsJson['customerId'] = document.getElementById('customerId').value;
	         rtgsJson['customerName'] = document.getElementById('customerName').value;
	         rtgsJson['dsBankId'] = document.getElementById('dsBankId').value;
	         rtgsJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	         rtgsJson['companyId'] = document.getElementById('companyId').value;
	         rtgsJson['paymentStatus'] = document.getElementById('rtgsPaymentStatus').value;
	         
	         return rtgsJson;
         }
         
         function submitCash(){
	         var cashJson = {};
	         
	         cashJson['dataType'] = 'cash';	
	         cashJson['cashAmount'] = document.getElementById('cashAmount').value;
	         cashJson['invoiceId'] = document.getElementById('invoiceId').value;
	         cashJson['customerName'] = document.getElementById('customerName').value;
	         cashJson['customerId'] = document.getElementById('customerId').value;
	         cashJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	         cashJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	         cashJson['cashAccountId'] = document.getElementById('cashAccountId').value;
	         cashJson['paymentStatus'] = document.getElementById('cashPaymentStatus').value;
	         cashJson['cashDate'] = document.getElementById('cashDate').value;
	         
	         return cashJson;
         }
         
         function submitPdc(){
	         
	         var pdcJson = {};
	         
	         pdcJson['dataType'] = 'pdc';
	         pdcJson['pdcId'] =  document.getElementById('pdcId').value;
	         pdcJson['invoiceId'] = document.getElementById('invoiceId').value;
	         pdcJson['pdcAmount'] =  document.getElementById('pdcChequeAmount').value;
	         pdcJson['pdcNo'] = document.getElementById('pdcChequeNo').value;
	         pdcJson['pdcDate'] = document.getElementById('pdcChequeDate').value;
	         pdcJson['pdcPayeeName'] = document.getElementById('pdcNameOnCheque').value;
	         pdcJson['pdcBank'] = document.getElementById('pdcChequeBank').value;
	         var bank = document.getElementById('pdcChequeBank');
	         pdcJson['pdcBankName'] = bank.options[bank.selectedIndex].text.split('-')[0].trim();
	         pdcJson['customerId'] = document.getElementById('customerId').value;
	         pdcJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	         pdcJson['bankAccountId'] = bank.options[bank.selectedIndex].getAttribute('data-account-id');
	         pdcJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	         pdcJson['bankAccountId'] = bank.options[bank.selectedIndex].getAttribute('data-account-id');
	         pdcJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	         pdcJson['paymentStatus'] = document.getElementById('pdcChequePaymentStatus').value;
	         
	         return pdcJson;
         
         }
         
         function submitPdcRtgs(){
	         
	         var pdcRtgsJson = {};
	         
	         pdcRtgsJson['dataType'] = 'pdcRtgs';
	         pdcRtgsJson['pdcId'] = document.getElementById('pdcId').value;
	         pdcRtgsJson['invoiceId'] = document.getElementById('invoiceId').value;
	         pdcRtgsJson['pdcRtgsAmount'] =  document.getElementById('pdcRtgsAmount').value;
	         pdcRtgsJson['pdcRtgsBank'] = document.getElementById('pdcRtgsBank').value;
	         pdcRtgsJson['pdcRtgsAccountNo'] = document.getElementById('pdcRtgsAccountNo').value;
	         pdcRtgsJson['pdcRtgsIfsc'] = document.getElementById('pdcRtgsIfsc').value;
	         pdcRtgsJson['pdcRtgsDate'] = document.getElementById('pdcRtgsDate').value;
	         pdcRtgsJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	         pdcRtgsJson['customerId'] = document.getElementById('customerId').value;
	         pdcRtgsJson['customerName'] = document.getElementById('customerName').value;
	         pdcRtgsJson['dsBankId'] = document.getElementById('dsBankId').value;
	         pdcRtgsJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	         pdcRtgsJson['companyId'] = document.getElementById('companyId').value;
	         pdcRtgsJson['paymentStatus'] = document.getElementById('pdcRtgsPaymentStatus').value;
	         
	         return pdcRtgsJson;
         
         }
         
         function submitPdcCash(){
	         var pdcCashJson = {};
	         
	         pdcCashJson['dataType'] = 'cash';	
	         pdcCashJson['pdcCashAmount'] = document.getElementById('pdcCashAmount').value;
	         pdcCashJson['invoiceId'] = document.getElementById('invoiceId').value;
	         pdcCashJson['customerName'] = document.getElementById('customerName').value;
	         pdcCashJson['customerId'] = document.getElementById('customerId').value;
	         pdcCashJson['invoiceNo'] = document.getElementById('invoiceNo').value;
	         pdcCashJson['accountPayableId'] = document.getElementById('accountPayableId').value;
	         pdcCashJson['cashAccountId'] = document.getElementById('pdcCashAccountId').value;
	         pdcCashJson['paymentStatus'] = document.getElementById('pdcCashPaymentStatus').value;
	         pdcCashJson['pdcCashDate'] = document.getElementById('pdcCashAmountDate').value;
	         
	         return pdcCashJson;
         }
         
         
         function submitDataAjax(data){
	         console.log(data);
	         url = "../processing/submitPayment.jsp?data="+data;
	         if(window.XMLHttpRequest){  
	         	submitData=new XMLHttpRequest();  
	         }  
	         else if(window.ActiveXObject){  
	        	 submitData=new ActiveXObject("Microsoft.XMLHTTP");  
	         }  
	         try{  
		         submitData.onreadystatechange=getResponse;  
		         console.log("AJAX Req sent");
		         submitData.open("GET",url,true);  
		         submitData.send();  
	         	}catch(e){alert("Unable to connect to server");}
	      }
	         
	      function getResponse(){
		    if(submitData.readyState == 4){
		         var response = this.response.trim();
		         var ids = response.split(',');
		         document.getElementById("chequeId").value = ids[1];
		         document.getElementById("pdcChequeId").value = ids[2];
		         console.log(response);
		         getPendingInvReport();
		         $.fn.checkStatus(ids[0],"Payment Information has been saved successfully!")
	         }
         }
         
         /****************************************************************************/
         //Print cheque details
         function PrintChequeData(chequeId){
	         if(Number(chequeId) === 0){
	         	alert('Enter correct cheque details and submit the payment first.');
	         }else{
	       	 	var win = window.open("../report/Cheque.jsp?chequeId="+chequeId, '_blank');
	         	win.focus();
	         }
         }
         
         
         /**************************************************************************/
         function submitCashPayment(){//submit form data
	         var parentJson = {};
	         parentJson['invoiceId'] = document.getElementById('invoiceId').value;
	         
	         if(cashStatus === true){
		         var cashJson = submitCash();
		         parentJson['cashJson'] = cashJson;
	         }
	         	 
	         console.log(parentJson);
	         var jsonData = JSON.stringify(parentJson);
	         
	         document.getElementById("payCash").disabled = true;
	         
	         submitDataAjax(jsonData);
         }
         
         
         /*************************************************************************/
         function submitPdpCashPayment(){//submit form data
	         var parentJson = {};
	         parentJson['invoiceId'] = document.getElementById('invoiceId').value;
	         
	         if(pdpCashStatus === true){
		         var pdcCashJson = submitPdcCash();
		         parentJson['pdcCashJson'] = pdcCashJson;
         	 }
	         	 
	         console.log(parentJson);
	         var jsonData = JSON.stringify(parentJson);
	         
	         document.getElementById('payPdcCash').disabled = true;
	         
	         submitDataAjax(jsonData);
         }
         
         
         
         /**************************************************************************/
         document.getElementById('payCash').addEventListener('click', function(e){
        	 submitCashPayment();
        	 document.getElementById('payCash').disabled = true;
         });
         
         
         /**************************************************************************/
         document.getElementById('payPdcCash').addEventListener('click', function(e){
        	 submitPdpCashPayment();
        	document.getElementById('payPdcCash').disabled = true;
         });
         
         
         /***************************************************************************/
         //Function calls on page load
         
         getDailySetupData();
         getPendingInvReport();
         setCurrentDate();
         
         
      </script>
   </body>
</html>


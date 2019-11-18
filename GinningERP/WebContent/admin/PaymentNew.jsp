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
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/plugins/jquery.blockUI.js" ></script>
      <script type="text/javascript" >
         function preventBack(){window.history.forward();}
         setTimeout("preventBack()", 0);
         window.onunload=function(){null};
      </script>
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
	      	<div class="col-md-8">
 	 			<input type="hidden" id="invoiceId" name="invoiceId" />
                <input type="hidden" id="customerId" name="customerId" />
                <input type="hidden" id="customerName" name="customerName" />
                <input type="hidden" id="companyId" name="companyId" />
                <input type="hidden" id="accountPayableId" name="accountPayableId" />
                <input type="hidden" id="dsBankId" name="dsBankId" />
	      		
	      		 <div class="form-row">
                     <div class="col-md-3">
                        <label class="lbl-rm-all">Customer Information</label>
                        <textarea id="customerInfo" name="customerInfo" class="form-control " rows="4" readonly></textarea>
                     </div>
                     <div class="col-md-auto">
                        <label class="lbl-rm-all">Invoice No</label>
                        <input type="text" class="form-control " id="invoiceNo" name="invoiceNo" readonly>
                        <label class="lbl-rm-all">Date</label>
                        <input type="text" class="form-control " id="invoiceDate" name="invoiceDate" readonly>
                     </div>
                     <div class="col-md-auto">
                        <label class="lbl-rm-all">Total Amount to Pay</label>
                        <input type="text" class="form-control " id="totalAmount" name="totalAmount" readonly>
                        <label class="lbl-rm-all">Status</label>
                        <input type="text" class="form-control " id="invoiceStatus" name="invoiceStatus" value="Paid" readonly>
                     </div>
                  </div>
        	</div>
        	
        	    <div class="col-md-4 border-left">
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
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 			</tr>
	      	 			
	      	 			<tr>
	      	 				<td>2</td>
	      	 				<td>Cheque</td>
	      	 				<td style="background:#bebebe; color:#fff;">
	      	 					Not Applicable
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
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td>
	      	 					<input type="date" class="form-control" id="chequeDate" name="chequeDate" value="">
	      	 				</td>
	      	 				
	      	 				<td>
	      	 					<input type="text" class="form-control" id="nameOnCheque" name="nameOnCheque" placeholder="Name on Cheque">
	      	 				</td>
	      	 				<td>
	      	 					<button type="button" class="btn btn-success btn-no-radius" onclick="PrintChequeData(document.getElementById('chequeId').value)" id="payCheque">Print</button>
	      	 				</td>
	      	 			</tr>
	      	 			
	      	 				<tr>
	      	 				<td>3</td>
	      	 				<td>RTGS/NEFT</td>
	      	 				<td style="background:#bebebe; color:#fff;">
	      	 					Not Applicable
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
	      	 				<td>
	      	 					<input type="date" class="form-control" id="rtgsDate" name="rtgsDate" value="">
	      	 				</td>
	      	 				<td>
	      	 					<input type="text" class="form-control" id="rtgsName" name="rtgsName" placeholder="Name">
	      	 				</td>
	      	 				<td>
	      	 					<button type="button" class="btn btn-success btn-no-radius" onclick="PrintChequeData(document.getElementById('chequeId').value)" id="payCheque">Print</button>
	      	 				</td>
	      	 			</tr>
	      	 			
	      	 				<tr>
	      	 				<td>4</td>
	      	 				<td>PDP Cash</td>
	      	 				<td>
	      	 					<select class="form-control" id="pdcCashAccountId" name="pdcCashAccountId">
									<c:CashLedgerTag/>
								</select>
	      	 				</td>
	      	 				<td>
	      	 					<input type="text" class="form-control input-cash" id="pdcCashAmount" name="pdcCashAmount" readonly>
	      	 				</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 			</tr>
	      	 			
	      	 			<tr>
	      	 				<td>5</td>
	      	 				<td>PDP Cheque</td>
	      	 				<td style="background:#bebebe; color:#fff;">
	      	 					Not Applicable
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
	      	 				<td style="background:#bebebe; color:#fff;">Not Applicable</td>
	      	 				<td>
	      	 					<input type="date" class="form-control" id="pdcChequeDate" name="pdcChequeDate" value="">
	      	 				</td>
	      	 				
	      	 				<td>
	      	 					<input type="text" class="form-control" id="pdcNameOnCheque" name="pdcNameOnCheque" placeholder="Name on Cheque">
	      	 				</td>
	      	 				<td>
	      	 					<button type="button" class="btn btn-success btn-no-radius" onclick="PrintChequeData(document.getElementById('chequeId').value)" id="payCheque">Print</button>
	      	 				</td>
	      	 			</tr>
	      	 			
	      	 				<tr>
	      	 				<td>6</td>
	      	 				<td>PDP RTGS/NEFT</td>
	      	 				<td style="background:#bebebe; color:#fff;">
	      	 					Not Applicable
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
	      	 					<input type="date" class="form-control" id="pdcChequeDate" name="pdcChequeDate" value="">
	      	 				</td>
	      	 				<td>
	      	 					<input type="text" class="form-control" id="pdcNameOnCheque" name="pdcNameOnCheque" placeholder="Name on Cheque">
	      	 				</td>
	      	 				<td>
	      	 					<button type="button" class="btn btn-success btn-no-radius" onclick="PrintChequeData(document.getElementById('pdcChequeId').value)" id="payCheque">Print</button>
	      	 				</td>
	      	 			</tr>
	      	 		</tbody>
	      	 	</table>
	      	 		<div class="form-row border-top" style="width:100%;" >
					<div class="col-md-12">
						<div class="d-flex justify-content-end align-items-center">
							<button type="button" class="btn btn-success  btn-no-radius" id="submitButton" >Submit Payment</button>
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
								if($("#rtgsDate").val()!=""){
									paymentData.rtgsNeftData.push($("#rtgsDate").val());
									if($("#rtgsName").val()!=""){
										paymentData.rtgsNeftData.push($("#rtgsName").val());
										return true;
									}else{
										$.fn.checkStatus(1,"Please check name.");
					      				$("#rtgsName").css("border","1px solid red");
					      				return false;
									}
								}else{
									$.fn.checkStatus(1,"Please check date.");
				      				$("#rtgsDate").css("border","1px solid red");
				      				return false;
								}
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
								if($("#pdcChequeDate").val()!=""){
									paymentData.pdcRtgsNeftData.push($("#pdcChequeDate").val());
									if($("#pdcNameOnCheque").val()!=""){
										paymentData.pdcRtgsNeftData.push($("#pdcNameOnCheque").val());
										return true;
									}else{
										$.fn.checkStatus(1,"Please check name.");
					      				$("#pdcNameOnCheque").css("border","1px solid red");
					      				return false;
									}
								}else{
									$.fn.checkStatus(1,"Please check date.");
				      				$("#pdcChequeDate").css("border","1px solid red");
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
      					console.log(paymentData);
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
			console.log(data);
			setPendingTable(data);
		} 
	}
	
	//Set pending Invoice Report data in table
	function setPendingTable(data){
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
			setDailySetupData(data);
		}
	}
	
	//Set Daily Setup data in Input Fields
	function setDailySetupData(data){
			var chequeBank =  document.getElementById('chequeBank');
			for(i=0;i<chequeBank.options.length;i++){
				if(chequeBank.bankId != Number(chequeBank.options[i].value)){
					chequeBank.options[i].disabled = true;
				}
				else if(chequeBank.bankId === Number(chequeBank.options[i].value)){
					chequeBank.options[i].selected = true;
			}
			
			var pdcBank =  document.getElementById('pdcChequeBank');
			for(i=0;i<pdcBank.options.length;i++){
				if(pdcBank.bankId != Number(pdcBank.options[i].value)){
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
				console.log(response);
				if(Number(response) === 0){
					window.alert('Invalid Invoice Number entered. Please check the Invoice No. and search again.');
				}else{
					var data = JSON.parse(response);
					//setData(data);
					console.log(data);
				}
			}
		}
 
      </script>
      </body>
      </html>
      
      
      
      
      
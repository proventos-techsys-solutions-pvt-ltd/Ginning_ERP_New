<%-- page errorPage="../admin/Error.jsp" --%>  
<%@page import="com.prov.bean.PaymentDetails"%>
<%@page import="com.prov.dbupdation.UpdatePaymentDetails"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.prov.report.AccountNameReport"%>
<%@page import="com.prov.dbinsertion.AddTransactions"%>
<%@page import="com.prov.dbops.VoucherSeries"%>
<%@page import="com.prov.bean.Transactions"%>
<%@page import="com.prov.bean.PDC"%>
<%@page import="com.prov.dbupdation.UpdatePDC"%>
<%@page import="com.prov.dbupdation.UpdateInvoice"%>
<%@page import="com.prov.dbinsertion.AddRtgs"%>
<%@page import="com.prov.dbinsertion.AddCheque"%>
<%@page import="com.prov.bean.Rtgs"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.bean.Cheque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	
	String data = request.getParameter("data");
    System.out.print(data);
	
	JSONParser parse = new JSONParser();
	JSONObject parent = (JSONObject)parse.parse(data);
	
	int paymentInvoiceId = Integer.parseInt((String)parent.get("invoiceId"));
	
	InvoiceReport invReport = new InvoiceReport();
	UpdatePaymentDetails updatePayment = new UpdatePaymentDetails();
	
	int invStatus = invReport.getInvoicePaymentStatus(paymentInvoiceId);
	int chequeId = 0;
	int pdcChequeId = 0;
	
	if(invStatus == 0){
	
		UpdateInvoice updateInvoice = new UpdateInvoice();
		UpdatePDC updatePdc = new UpdatePDC();
		
	
		
		int[] id = new int[6];
		
		if(parent.containsKey("chequeJson")){
			JSONObject chequeJson = (JSONObject)parent.get("chequeJson");
			if(Integer.parseInt((String)chequeJson.get("paymentStatus")) == 0){
			
				VoucherSeries vs = new VoucherSeries();
				
				int voucherNo = vs.getVoucherNo();
		
				String invoiceNo = (String)chequeJson.get("invoiceNo");
				
				Cheque cheque = new Cheque();
			
				cheque.setBankId(Integer.parseInt((String)chequeJson.get("chequeBankId")));
				cheque.setBankName(((String)chequeJson.get("chequeBankName")).toUpperCase());
				cheque.setChequeAmount(Long.parseLong((String)chequeJson.get("chequeAmount")));
				cheque.setChequeDate((String)chequeJson.get("chequeDate"));
				cheque.setChequeNo((String)chequeJson.get("chequeNo"));
				cheque.setCustomerId(Integer.parseInt((String)chequeJson.get("customerId")));
				cheque.setCustomerName(((String)chequeJson.get("chequeName")).toUpperCase());
				cheque.setInvoiceNo(((String)chequeJson.get("invoiceNo")).toUpperCase());
				cheque.setInvoiceId(Integer.parseInt((String)chequeJson.get("invoiceId")));
				cheque.setStatus(0);
				cheque.setPaymentStatus(1);
				cheque.setVoucherNo(voucherNo);
				
				AddCheque addCheque = new AddCheque();
				
				chequeId = addCheque.addCheque(cheque);
				
				id[0] = chequeId;
				
				PaymentDetails chequePayment = new PaymentDetails();
				
				chequePayment.setInvoiceId(paymentInvoiceId);
				chequePayment.setModeId(2);
				chequePayment.setChequeId(chequeId);
				chequePayment.setCashVouhNo(0);
				chequePayment.setRtgsId(0);
				
				if(chequeId>0){
					updatePayment.updatePaymentStatus(chequePayment);
				}
				
				Transactions chequeTrDb = new Transactions();
				
				chequeTrDb.setAccountId(Integer.parseInt((String)chequeJson.get("accountPayableId")));
				chequeTrDb.setContactId((String)chequeJson.get("customerId"));
				chequeTrDb.setDebit(cheque.getChequeAmount());
				chequeTrDb.setCredit(0);
				chequeTrDb.setTransactionDate(cheque.getChequeDate());
				chequeTrDb.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				chequeTrDb.setVouchRef("RAW COTTON - "+invoiceNo);
				chequeTrDb.setVouchNo(voucherNo);
				
				Transactions chequeTrCr = new Transactions();
				
				chequeTrCr.setAccountId(Integer.parseInt((String)chequeJson.get("bankAccountId")));
				chequeTrCr.setContactId((String)chequeJson.get("customerId"));
				chequeTrCr.setDebit(0);
				chequeTrCr.setCredit(cheque.getChequeAmount());
				chequeTrCr.setTransactionDate(cheque.getChequeDate());
				chequeTrCr.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				chequeTrCr.setVouchRef("RAW COTTON - "+invoiceNo);
				chequeTrCr.setVouchNo(voucherNo);
				
				AddTransactions addTr = new AddTransactions();
				
				addTr.addTransactions(chequeTrDb);
				addTr.addTransactions(chequeTrCr);
				
				
				updateInvoice.updatePendingAmount(cheque.getChequeAmount(), cheque.getInvoiceId());
				
				//session.setAttribute("chequeId", Integer.toString(id));
				//response.sendRedirect("../report/Cheque.jsp");
				
				//out.print(id);
				//out.flush();
			}
			
			
		} if(parent.containsKey("rtgsJson")){
			
			JSONObject rtgsJson = (JSONObject)parent.get("rtgsJson");
			if(Integer.parseInt((String)rtgsJson.get("paymentStatus")) == 0){
				
				VoucherSeries vs = new VoucherSeries();
				
				int voucherNo = vs.getVoucherNo();
				
				String invoiceNo = (String)rtgsJson.get("invoiceNo");
				Rtgs rtgs = new Rtgs();
			
				rtgs.setBankName(((String)rtgsJson.get("rtgsBank")).toUpperCase());
				rtgs.setRtgsAmount(Long.parseLong((String)rtgsJson.get("rtgsAmount")));
				rtgs.setAccountNo((String)rtgsJson.get("rtgsAccountNo"));
				rtgs.setRtgsDate((String)rtgsJson.get("rtgsDate"));
				rtgs.setIfsc(((String)rtgsJson.get("rtgsIfsc")).toUpperCase());
				rtgs.setCustomerId(Integer.parseInt((String)rtgsJson.get("customerId")));
				rtgs.setCustomerName(((String)rtgsJson.get("customerName")).toUpperCase());
				rtgs.setInvoiceNo(((String)rtgsJson.get("invoiceNo")).toUpperCase());
				rtgs.setInvoiceId(Integer.parseInt((String)rtgsJson.get("invoiceId")));
				rtgs.setVoucherNo(voucherNo);
				
				AddRtgs addRtgs = new AddRtgs();
				
				int rtgsId = addRtgs.addRtgsEntry(rtgs);
				
				id[1] = rtgsId;
				
				PaymentDetails rtgsPayment = new PaymentDetails();
				
				rtgsPayment.setInvoiceId(paymentInvoiceId);
				rtgsPayment.setModeId(3);
				rtgsPayment.setChequeId(0);
				rtgsPayment.setCashVouhNo(0);
				rtgsPayment.setRtgsId(rtgsId);
				
				if(rtgsId>0){
					updatePayment.updatePaymentStatus(rtgsPayment);
				}
		
				updateInvoice.updatePendingAmount(rtgs.getRtgsAmount(), rtgs.getInvoiceId());
				
				Transactions rtgsTrDb = new Transactions();
				
				rtgsTrDb.setAccountId(Integer.parseInt((String)rtgsJson.get("accountPayableId")));
				rtgsTrDb.setContactId((String)rtgsJson.get("customerId"));
				rtgsTrDb.setDebit(rtgs.getRtgsAmount());
				rtgsTrDb.setCredit(0);
				rtgsTrDb.setTransactionDate(rtgs.getRtgsDate());
				rtgsTrDb.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				rtgsTrDb.setVouchRef("RAW COTTON - "+invoiceNo);
				rtgsTrDb.setVouchNo(voucherNo);
				
				Transactions rtgsTrCr = new Transactions();
				
				AccountNameReport anr = new AccountNameReport();
				
				int bankAccountId = anr.getAccountId(Integer.parseInt((String)rtgsJson.get("companyId")), Integer.parseInt((String)rtgsJson.get("dsBankId")));
				
				rtgsTrCr.setAccountId(bankAccountId);
				rtgsTrCr.setContactId((String)rtgsJson.get("customerId"));
				rtgsTrCr.setDebit(0);
				rtgsTrCr.setCredit(rtgs.getRtgsAmount());
				rtgsTrCr.setTransactionDate(rtgs.getRtgsDate());
				rtgsTrCr.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				rtgsTrCr.setVouchRef("RAW COTTON - "+invoiceNo);
				rtgsTrCr.setVouchNo(voucherNo);
				
				AddTransactions addTr = new AddTransactions();
				
				addTr.addTransactions(rtgsTrDb);
				addTr.addTransactions(rtgsTrCr);
				
				//session.setAttribute("id", Integer.toString(id));
				//response.sendRedirect("../accounts_operation_view/Payment.jsp");
				//out.print(id);
				//out.flush();
			}
				
		} if(parent.containsKey("cashJson")){
			JSONObject cashJson = (JSONObject)parent.get("cashJson");
			if(Integer.parseInt((String)cashJson.get("paymentStatus")) == 0){
				VoucherSeries vs = new VoucherSeries();
				
				int voucherNo = vs.getVoucherNo();
				
				String invoiceNo = (String)cashJson.get("invoiceNo");
				int invoiceId = Integer.parseInt((String)cashJson.get("invoiceId"));
				
				int rowCountCash = updateInvoice.updatePendingCashAmount(Long.parseLong((String)cashJson.get("cashAmount")),invoiceId, voucherNo);
				
				id[2] = rowCountCash;
					 
				PaymentDetails cashPayment = new PaymentDetails();
				
				cashPayment.setInvoiceId(paymentInvoiceId);
				cashPayment.setModeId(1);
				cashPayment.setChequeId(0);
				cashPayment.setCashVouhNo(voucherNo);
				cashPayment.setRtgsId(0);
				
				if(rowCountCash>0){
					updatePayment.updatePaymentStatus(cashPayment);
				}
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
				Date date = new Date(); 
				String todaysDate = formatter.format(date);
				
				Transactions cashTrDb = new Transactions();
				
				cashTrDb.setAccountId(Integer.parseInt((String)cashJson.get("accountPayableId")));
				cashTrDb.setContactId((String)cashJson.get("customerId"));
				cashTrDb.setDebit(Long.parseLong((String)cashJson.get("cashAmount")));
				cashTrDb.setCredit(0);
				cashTrDb.setTransactionDate(todaysDate);
				cashTrDb.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				cashTrDb.setVouchRef("RAW COTTON - "+invoiceNo);
				cashTrDb.setVouchNo(voucherNo);
				
				Transactions cashTrCr = new Transactions();
				
				AccountNameReport anr = new AccountNameReport();
				
				cashTrCr.setAccountId(Integer.parseInt((String)cashJson.get("cashAccountId")));
				cashTrCr.setContactId((String)cashJson.get("customerId"));
				cashTrCr.setDebit(0);
				cashTrCr.setCredit(Long.parseLong((String)cashJson.get("cashAmount")));
				cashTrCr.setTransactionDate(todaysDate);
				cashTrCr.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				cashTrCr.setVouchRef("RAW COTTON - "+invoiceNo);
				cashTrCr.setVouchNo(voucherNo);
				
				AddTransactions addTr = new AddTransactions();
				
				addTr.addTransactions(cashTrDb);
				addTr.addTransactions(cashTrCr);
				
				
				//session.setAttribute("id", Integer.toString(invoiceId));
				//response.sendRedirect("../accounts_operation_view/Payment.jsp");
				//out.print(invoiceId);
				//out.flush();
			}
			
		} if(parent.containsKey("pdcChequeJson")){
			JSONObject pdcChequeJson = (JSONObject)parent.get("pdcChequeJson");
			if(Integer.parseInt((String)pdcChequeJson.get("paymentStatus")) == 0){
				
				VoucherSeries vs = new VoucherSeries();
				
				int voucherNo = vs.getVoucherNo();
				
				String invoiceNo = (String)pdcChequeJson.get("invoiceNo");
				
				PDC pdc = new PDC();
				Cheque cheque = new Cheque();
				AddCheque addCheque = new AddCheque();
				
				pdc.setId(Integer.parseInt((String)pdcChequeJson.get("pdcId")));
				
				int invoiceId = Integer.parseInt((String)pdcChequeJson.get("invoiceId"));
				
				cheque.setBankId(Integer.parseInt((String)pdcChequeJson.get("pdcBank")));
				cheque.setBankName((String)pdcChequeJson.get("pdcBankName"));
				cheque.setChequeAmount(Long.parseLong((String)pdcChequeJson.get("pdcAmount")));
				cheque.setChequeDate((String)pdcChequeJson.get("pdcDate"));
				cheque.setChequeNo((String)pdcChequeJson.get("pdcNo"));
				cheque.setCustomerId(Integer.parseInt((String)pdcChequeJson.get("customerId")));
				cheque.setCustomerName((String)pdcChequeJson.get("pdcPayeeName"));
				cheque.setInvoiceId(invoiceId);
				cheque.setInvoiceNo((String)pdcChequeJson.get("invoiceNo"));
				cheque.setStatus(0);
				cheque.setPaymentStatus(0);
				cheque.setVoucherNo(voucherNo);
				
				pdcChequeId = addCheque.addCheque(cheque);
				
				id[3] = pdcChequeId;
				
				updateInvoice.updatePendingAmount(cheque.getChequeAmount(), invoiceId);
				
				updatePdc.addChequeId(pdcChequeId, invoiceId);
				
				
				Transactions chequeTrDb = new Transactions();
				
				chequeTrDb.setAccountId(Integer.parseInt((String)pdcChequeJson.get("accountPayableId")));
				chequeTrDb.setContactId((String)pdcChequeJson.get("customerId"));
				chequeTrDb.setDebit(cheque.getChequeAmount());
				chequeTrDb.setCredit(0);
				chequeTrDb.setTransactionDate(cheque.getChequeDate());
				chequeTrDb.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				chequeTrDb.setVouchRef("RAW COTTON - "+invoiceNo);
				chequeTrDb.setVouchNo(voucherNo);
				
				Transactions chequeTrCr = new Transactions();
				
				chequeTrCr.setAccountId(Integer.parseInt((String)pdcChequeJson.get("bankAccountId")));
				chequeTrCr.setContactId((String)pdcChequeJson.get("customerId"));
				chequeTrCr.setDebit(0);
				chequeTrCr.setCredit(cheque.getChequeAmount());
				chequeTrCr.setTransactionDate(cheque.getChequeDate());
				chequeTrCr.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				chequeTrCr.setVouchRef("RAW COTTON - "+invoiceNo);
				chequeTrCr.setVouchNo(voucherNo);
				
				AddTransactions addTr = new AddTransactions();
				
				addTr.addTransactions(chequeTrDb);
				addTr.addTransactions(chequeTrCr);
				
				//session.setAttribute("chequeId", Integer.toString(pdc.getId()));
				//response.sendRedirect("../report/Cheque.jsp");
				//out.print(chequeId);
				//out.flush();
			}
			
		} if(parent.containsKey("pdcRtgsJson")){
			JSONObject pdcRtgsJson = (JSONObject)parent.get("pdcRtgsJson");
			if(Integer.parseInt((String)pdcRtgsJson.get("paymentStatus")) == 0){
				VoucherSeries vs = new VoucherSeries();
				
				int voucherNo = vs.getVoucherNo();
				
				String invoiceNo = (String)pdcRtgsJson.get("invoiceNo");
				Rtgs rtgs = new Rtgs();
			
				rtgs.setBankName(((String)pdcRtgsJson.get("pdcRtgsBank")).toUpperCase());
				rtgs.setRtgsAmount(Long.parseLong((String)pdcRtgsJson.get("pdcRtgsAmount")));
				rtgs.setAccountNo((String)pdcRtgsJson.get("pdcRtgsAccountNo"));
				rtgs.setRtgsDate((String)pdcRtgsJson.get("pdcRtgsDate"));
				rtgs.setIfsc(((String)pdcRtgsJson.get("pdcRtgsIfsc")).toUpperCase());
				rtgs.setCustomerId(Integer.parseInt((String)pdcRtgsJson.get("customerId")));
				rtgs.setCustomerName(((String)pdcRtgsJson.get("customerName")).toUpperCase());
				rtgs.setInvoiceNo(((String)pdcRtgsJson.get("invoiceNo")).toUpperCase());
				rtgs.setInvoiceId(Integer.parseInt((String)pdcRtgsJson.get("invoiceId")));
				rtgs.setVoucherNo(voucherNo);
				
				AddRtgs addRtgs = new AddRtgs();
				
				int rtgsId = addRtgs.addRtgsEntry(rtgs);
				
				id[4] = rtgsId;
		
				
				updateInvoice.updatePendingAmount(rtgs.getRtgsAmount(), rtgs.getInvoiceId());
				
				updatePdc.addRtgsIdId(rtgsId, rtgs.getInvoiceId());
				
				
				Transactions rtgsPdcTrDb = new Transactions();
				
				rtgsPdcTrDb.setAccountId(Integer.parseInt((String)pdcRtgsJson.get("accountPayableId")));
				rtgsPdcTrDb.setContactId((String)pdcRtgsJson.get("customerId"));
				rtgsPdcTrDb.setDebit(rtgs.getRtgsAmount());
				rtgsPdcTrDb.setCredit(0);
				rtgsPdcTrDb.setTransactionDate(rtgs.getRtgsDate());
				rtgsPdcTrDb.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				rtgsPdcTrDb.setVouchRef("RAW COTTON - "+invoiceNo);
				rtgsPdcTrDb.setVouchNo(voucherNo);
				
				Transactions rtgsPdcTrCr = new Transactions();
				
				AccountNameReport anr = new AccountNameReport();
				
				int bankAccountId = anr.getAccountId(Integer.parseInt((String)pdcRtgsJson.get("companyId")), Integer.parseInt((String)pdcRtgsJson.get("dsBankId")));
				
				rtgsPdcTrCr.setAccountId(bankAccountId);
				rtgsPdcTrCr.setContactId((String)pdcRtgsJson.get("customerId"));
				rtgsPdcTrCr.setDebit(0);
				rtgsPdcTrCr.setCredit(rtgs.getRtgsAmount());
				rtgsPdcTrCr.setTransactionDate(rtgs.getRtgsDate());
				rtgsPdcTrCr.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				rtgsPdcTrCr.setVouchRef("RAW COTTON - "+invoiceNo);
				rtgsPdcTrCr.setVouchNo(voucherNo);
				
				AddTransactions addTr = new AddTransactions();
				
				addTr.addTransactions(rtgsPdcTrDb);
				addTr.addTransactions(rtgsPdcTrCr);
				
				//session.setAttribute("id", Integer.toString(id));
				//response.sendRedirect("../accounts_operation_view/Payment.jsp");
				
				//out.print(id);
				//out.flush();
			}
				
		} if(parent.containsKey("pdcCashJson")){
			JSONObject pdcCashJson = (JSONObject)parent.get("pdcCashJson");
			if(Integer.parseInt((String)pdcCashJson.get("paymentStatus")) == 0){
				VoucherSeries vs = new VoucherSeries();
				
				int voucherNo = vs.getVoucherNo();
				
				
				String invoiceNo = (String)pdcCashJson.get("invoiceNo");
				int invoiceId = Integer.parseInt((String)pdcCashJson.get("invoiceId"));
				
				id[5] = updateInvoice.updatePendingAmount(Long.parseLong((String)pdcCashJson.get("pdcCashAmount")),invoiceId);
				int glId = 0;
				
				updatePdc.addGlId(voucherNo, invoiceId);
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
				Date date = new Date(); 
				String todaysDate = formatter.format(date);
				
				Transactions cashTrDb = new Transactions();
				
				cashTrDb.setAccountId(Integer.parseInt((String)pdcCashJson.get("accountPayableId")));
				cashTrDb.setContactId((String)pdcCashJson.get("customerId"));
				cashTrDb.setDebit(Long.parseLong((String)pdcCashJson.get("pdcCashAmount")));
				cashTrDb.setCredit(0);
				cashTrDb.setTransactionDate(todaysDate);
				cashTrDb.setNarration("RAW COTTON PURCHASE - "+invoiceNo);
				cashTrDb.setVouchRef("RAW COTTON - "+invoiceNo);
				cashTrDb.setVouchNo(voucherNo);
				
				Transactions cashTrCr = new Transactions();
				
				AccountNameReport anr = new AccountNameReport();
				
				cashTrCr.setAccountId(Integer.parseInt((String)pdcCashJson.get("cashAccountId")));
				cashTrCr.setContactId((String)pdcCashJson.get("customerId"));
				cashTrCr.setDebit(0);
				cashTrCr.setCredit(Long.parseLong((String)pdcCashJson.get("pdcCashAmount")));
				cashTrCr.setTransactionDate(todaysDate);
				cashTrCr.setNarration("RAW COTTON PURCHASE");
				cashTrCr.setVouchRef("RAW COTTON");
				cashTrCr.setVouchNo(voucherNo);
				
				AddTransactions addTr = new AddTransactions();
				
				addTr.addTransactions(cashTrDb);
				addTr.addTransactions(cashTrCr);
				
				//session.setAttribute("id", Integer.toString(invoiceId));
				//response.sendRedirect("../accounts_operation_view/Payment.jsp");
				
				//out.print(glId);
				//out.flush();
			}
			
		}
	
		String ids = id.toString();
		
		if(ids.matches("0")){
			out.print(0);
			out.flush();
		}else{
			updateInvoice.updateInvoicePaidStatus(paymentInvoiceId);
			out.print("1,"+chequeId+","+pdcChequeId);
			out.flush();
		}
	}else{
		out.print(2);
		out.flush();
	}
	
%>
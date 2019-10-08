<%-- page errorPage="../admin/Error.jsp" --%>  
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
	
	JSONObject obj = (JSONObject)parse.parse(data);
	UpdatePDC updatePdc = new UpdatePDC();
	
	int id = 0;
	
	if(((String)obj.get("dataType")).equals("cheque")){

		Cheque cheque = new Cheque();
	
		cheque.setBankId(Integer.parseInt((String)obj.get("chequeBankId")));
		cheque.setBankName(((String)obj.get("chequeBankName")).toUpperCase());
		cheque.setChequeAmount(Long.parseLong((String)obj.get("chequeAmount")));
		cheque.setChequeDate((String)obj.get("chequeDate"));
		cheque.setChequeNo((String)obj.get("chequeNo"));
		cheque.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		cheque.setCustomerName(((String)obj.get("chequeName")).toUpperCase());
		cheque.setInvoiceNo(((String)obj.get("invoiceNo")).toUpperCase());
		cheque.setInvoiceId(Integer.parseInt((String)obj.get("invoiceId")));
		
		AddCheque addCheque = new AddCheque();
		
		id = addCheque.addCheque(cheque);
		
		VoucherSeries vs = new VoucherSeries();
		
		int voucherNo = vs.getVoucherNo();
		
		Transactions chequeTrDb = new Transactions();
		
		chequeTrDb.setAccountId(Integer.parseInt((String)obj.get("accountPayableId")));
		chequeTrDb.setContactId((String)obj.get("customerId"));
		chequeTrDb.setDebit(cheque.getChequeAmount());
		chequeTrDb.setCredit(0);
		chequeTrDb.setTransactionDate(cheque.getChequeDate());
		chequeTrDb.setNarration("RAW COTTON PURCHASE");
		chequeTrDb.setVouchRef("RAW COTTON");
		chequeTrDb.setVouchNo(voucherNo);
		
		Transactions chequeTrCr = new Transactions();
		
		chequeTrCr.setAccountId(Integer.parseInt((String)obj.get("bankAccountId")));
		chequeTrCr.setContactId((String)obj.get("customerId"));
		chequeTrCr.setDebit(0);
		chequeTrCr.setCredit(cheque.getChequeAmount());
		chequeTrCr.setTransactionDate(cheque.getChequeDate());
		chequeTrCr.setNarration("RAW COTTON PURCHASE");
		chequeTrCr.setVouchRef("RAW COTTON");
		chequeTrCr.setVouchNo(voucherNo);
		
		AddTransactions addTr = new AddTransactions();
		
		addTr.addTransactions(chequeTrDb);
		addTr.addTransactions(chequeTrCr);
		
		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(cheque.getChequeAmount(), cheque.getInvoiceId());
		
		session.setAttribute("chequeId", Integer.toString(id));
		response.sendRedirect("../report/Cheque.jsp");
		
		//out.print(id);
		//out.flush();
		
		
	}else if(((String)obj.get("dataType")).equals("rtgs")){

		Rtgs rtgs = new Rtgs();
	
		rtgs.setBankName(((String)obj.get("rtgsBank")).toUpperCase());
		rtgs.setRtgsAmount(Long.parseLong((String)obj.get("rtgsAmount")));
		rtgs.setAccountNo((String)obj.get("rtgsAccountNo"));
		rtgs.setRtgsDate((String)obj.get("rtgsDate"));
		rtgs.setIfsc(((String)obj.get("rtgsIfsc")).toUpperCase());
		rtgs.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		rtgs.setCustomerName(((String)obj.get("customerName")).toUpperCase());
		rtgs.setInvoiceNo(((String)obj.get("invoiceNo")).toUpperCase());
		rtgs.setInvoiceId(Integer.parseInt((String)obj.get("invoiceId")));
		
		AddRtgs addRtgs = new AddRtgs();
		
		id = addRtgs.addRtgsEntry(rtgs);

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(rtgs.getRtgsAmount(), rtgs.getInvoiceId());
		
		VoucherSeries vs = new VoucherSeries();
		
		int voucherNo = vs.getVoucherNo();
		
		Transactions rtgsTrDb = new Transactions();
		
		rtgsTrDb.setAccountId(Integer.parseInt((String)obj.get("accountPayableId")));
		rtgsTrDb.setContactId((String)obj.get("customerId"));
		rtgsTrDb.setDebit(rtgs.getRtgsAmount());
		rtgsTrDb.setCredit(0);
		rtgsTrDb.setTransactionDate(rtgs.getRtgsDate());
		rtgsTrDb.setNarration("RAW COTTON PURCHASE");
		rtgsTrDb.setVouchRef("RAW COTTON");
		rtgsTrDb.setVouchNo(voucherNo);
		
		Transactions rtgsTrCr = new Transactions();
		
		AccountNameReport anr = new AccountNameReport();
		
		int bankAccountId = anr.getAccountId(Integer.parseInt((String)obj.get("companyId")), Integer.parseInt((String)obj.get("dsBankId")));
		
		rtgsTrCr.setAccountId(bankAccountId);
		rtgsTrCr.setContactId((String)obj.get("customerId"));
		rtgsTrCr.setDebit(0);
		rtgsTrCr.setCredit(rtgs.getRtgsAmount());
		rtgsTrCr.setTransactionDate(rtgs.getRtgsDate());
		rtgsTrCr.setNarration("RAW COTTON PURCHASE");
		rtgsTrCr.setVouchRef("RAW COTTON");
		rtgsTrCr.setVouchNo(voucherNo);
		
		AddTransactions addTr = new AddTransactions();
		
		addTr.addTransactions(rtgsTrDb);
		addTr.addTransactions(rtgsTrCr);
		
		//session.setAttribute("id", Integer.toString(id));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		out.print(id);
		out.flush();
		
			
	}else if(((String)obj.get("dataType")).equals("cash")){

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		int invoiceId = Integer.parseInt((String)obj.get("invoiceId"));
		
		updateInvoice.updatePendingAmount(Long.parseLong((String)obj.get("cashAmount")),invoiceId);
		
		VoucherSeries vs = new VoucherSeries();
		
		int voucherNo = vs.getVoucherNo();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		Date date = new Date(); 
		String todaysDate = formatter.format(date);
		
		Transactions cashTrDb = new Transactions();
		
		cashTrDb.setAccountId(Integer.parseInt((String)obj.get("accountPayableId")));
		cashTrDb.setContactId((String)obj.get("customerId"));
		cashTrDb.setDebit(Long.parseLong((String)obj.get("cashAmount")));
		cashTrDb.setCredit(0);
		cashTrDb.setTransactionDate(todaysDate);
		cashTrDb.setNarration("RAW COTTON PURCHASE");
		cashTrDb.setVouchRef("RAW COTTON");
		cashTrDb.setVouchNo(voucherNo);
		
		Transactions cashTrCr = new Transactions();
		
		AccountNameReport anr = new AccountNameReport();
		
		cashTrCr.setAccountId(Integer.parseInt((String)obj.get("cashAccountId")));
		cashTrCr.setContactId((String)obj.get("customerId"));
		cashTrCr.setDebit(0);
		cashTrCr.setCredit(Long.parseLong((String)obj.get("cashAmount")));
		cashTrCr.setTransactionDate(todaysDate);
		cashTrCr.setNarration("RAW COTTON PURCHASE");
		cashTrCr.setVouchRef("RAW COTTON");
		cashTrCr.setVouchNo(voucherNo);
		
		AddTransactions addTr = new AddTransactions();
		
		addTr.addTransactions(cashTrDb);
		addTr.addTransactions(cashTrCr);
		
		
		//session.setAttribute("id", Integer.toString(invoiceId));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		out.print(invoiceId);
		out.flush();
		
	}else if(((String)obj.get("dataType")).equals("pdc")){
		
		PDC pdc = new PDC();
		Cheque cheque = new Cheque();
		AddCheque addCheque = new AddCheque();
		
		pdc.setId(Integer.parseInt((String)obj.get("pdcId")));
		
		int invoiceId = Integer.parseInt((String)obj.get("invoiceId"));
		
		cheque.setBankId(Integer.parseInt((String)obj.get("pdcBank")));
		cheque.setBankName((String)obj.get("invoiceId"));
		cheque.setChequeAmount(Long.parseLong((String)obj.get("pdcAmount")));
		cheque.setChequeDate((String)obj.get("pdcDate"));
		cheque.setChequeNo((String)obj.get("pdcNo"));
		cheque.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		cheque.setCustomerName((String)obj.get("pdcPayeeName"));
		cheque.setInvoiceId(invoiceId);
		cheque.setInvoiceNo((String)obj.get("invoiceNo"));
		
		int chequeId = addCheque.addCheque(cheque);
		
		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(cheque.getChequeAmount(), invoiceId);
		
		updatePdc.addChequeId(chequeId, invoiceId);
		
		VoucherSeries vs = new VoucherSeries();
		
		int voucherNo = vs.getVoucherNo();
		
		Transactions chequeTrDb = new Transactions();
		
		chequeTrDb.setAccountId(Integer.parseInt((String)obj.get("accountPayableId")));
		chequeTrDb.setContactId((String)obj.get("customerId"));
		chequeTrDb.setDebit(cheque.getChequeAmount());
		chequeTrDb.setCredit(0);
		chequeTrDb.setTransactionDate(cheque.getChequeDate());
		chequeTrDb.setNarration("RAW COTTON PURCHASE");
		chequeTrDb.setVouchRef("RAW COTTON");
		chequeTrDb.setVouchNo(voucherNo);
		
		Transactions chequeTrCr = new Transactions();
		
		chequeTrCr.setAccountId(Integer.parseInt((String)obj.get("bankAccountId")));
		chequeTrCr.setContactId((String)obj.get("customerId"));
		chequeTrCr.setDebit(0);
		chequeTrCr.setCredit(cheque.getChequeAmount());
		chequeTrCr.setTransactionDate(cheque.getChequeDate());
		chequeTrCr.setNarration("RAW COTTON PURCHASE");
		chequeTrCr.setVouchRef("RAW COTTON");
		chequeTrCr.setVouchNo(voucherNo);
		
		AddTransactions addTr = new AddTransactions();
		
		addTr.addTransactions(chequeTrDb);
		addTr.addTransactions(chequeTrCr);
		
		session.setAttribute("chequeId", Integer.toString(pdc.getId()));
		response.sendRedirect("../report/Cheque.jsp");
		//out.print(chequeId);
		//out.flush();
		
	}else if(((String)obj.get("dataType")).equals("pdcRtgs")){

		Rtgs rtgs = new Rtgs();
	
		rtgs.setBankName(((String)obj.get("pdcRtgsBank")).toUpperCase());
		rtgs.setRtgsAmount(Long.parseLong((String)obj.get("pdcRtgsAmount")));
		rtgs.setAccountNo((String)obj.get("pdcRtgsAccountNo"));
		rtgs.setRtgsDate((String)obj.get("pdcRtgsDate"));
		rtgs.setIfsc(((String)obj.get("pdcRtgsIfsc")).toUpperCase());
		rtgs.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
		rtgs.setCustomerName(((String)obj.get("customerName")).toUpperCase());
		rtgs.setInvoiceNo(((String)obj.get("invoiceNo")).toUpperCase());
		rtgs.setInvoiceId(Integer.parseInt((String)obj.get("invoiceId")));
		
		AddRtgs addRtgs = new AddRtgs();
		
		id = addRtgs.addRtgsEntry(rtgs);

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		updateInvoice.updatePendingAmount(rtgs.getRtgsAmount(), rtgs.getInvoiceId());
		
		updatePdc.addRtgsIdId(id, rtgs.getInvoiceId());
		
		VoucherSeries vs = new VoucherSeries();
		
		int voucherNo = vs.getVoucherNo();
		
		Transactions rtgsPdcTrDb = new Transactions();
		
		rtgsPdcTrDb.setAccountId(Integer.parseInt((String)obj.get("accountPayableId")));
		rtgsPdcTrDb.setContactId((String)obj.get("customerId"));
		rtgsPdcTrDb.setDebit(rtgs.getRtgsAmount());
		rtgsPdcTrDb.setCredit(0);
		rtgsPdcTrDb.setTransactionDate(rtgs.getRtgsDate());
		rtgsPdcTrDb.setNarration("RAW COTTON PURCHASE");
		rtgsPdcTrDb.setVouchRef("RAW COTTON");
		rtgsPdcTrDb.setVouchNo(voucherNo);
		
		Transactions rtgsPdcTrCr = new Transactions();
		
		AccountNameReport anr = new AccountNameReport();
		
		int bankAccountId = anr.getAccountId(Integer.parseInt((String)obj.get("companyId")), Integer.parseInt((String)obj.get("dsBankId")));
		
		rtgsPdcTrCr.setAccountId(bankAccountId);
		rtgsPdcTrCr.setContactId((String)obj.get("customerId"));
		rtgsPdcTrCr.setDebit(0);
		rtgsPdcTrCr.setCredit(rtgs.getRtgsAmount());
		rtgsPdcTrCr.setTransactionDate(rtgs.getRtgsDate());
		rtgsPdcTrCr.setNarration("RAW COTTON PURCHASE");
		rtgsPdcTrCr.setVouchRef("RAW COTTON");
		rtgsPdcTrCr.setVouchNo(voucherNo);
		
		AddTransactions addTr = new AddTransactions();
		
		addTr.addTransactions(rtgsPdcTrDb);
		addTr.addTransactions(rtgsPdcTrCr);
		
		//session.setAttribute("id", Integer.toString(id));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		
		out.print(id);
		out.flush();
			
	}else if(((String)obj.get("dataType")).equals("pdcCash")){

		UpdateInvoice updateInvoice = new UpdateInvoice();
		
		int invoiceId = Integer.parseInt((String)obj.get("invoiceId"));
		
		updateInvoice.updatePendingAmount(Long.parseLong((String)obj.get("pdcCashAmount")),invoiceId);
		int glId = 0;
		
		updatePdc.addGlId(glId, invoiceId);
		
		VoucherSeries vs = new VoucherSeries();
		
		int voucherNo = vs.getVoucherNo();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		Date date = new Date(); 
		String todaysDate = formatter.format(date);
		
		Transactions cashTrDb = new Transactions();
		
		cashTrDb.setAccountId(Integer.parseInt((String)obj.get("accountPayableId")));
		cashTrDb.setContactId((String)obj.get("customerId"));
		cashTrDb.setDebit(Long.parseLong((String)obj.get("pdcCashAmount")));
		cashTrDb.setCredit(0);
		cashTrDb.setTransactionDate(todaysDate);
		cashTrDb.setNarration("RAW COTTON PURCHASE");
		cashTrDb.setVouchRef("RAW COTTON");
		cashTrDb.setVouchNo(voucherNo);
		
		Transactions cashTrCr = new Transactions();
		
		AccountNameReport anr = new AccountNameReport();
		
		cashTrCr.setAccountId(Integer.parseInt((String)obj.get("cashAccountId")));
		cashTrCr.setContactId((String)obj.get("customerId"));
		cashTrCr.setDebit(0);
		cashTrCr.setCredit(Long.parseLong((String)obj.get("pdcCashAmount")));
		cashTrCr.setTransactionDate(todaysDate);
		cashTrCr.setNarration("RAW COTTON PURCHASE");
		cashTrCr.setVouchRef("RAW COTTON");
		cashTrCr.setVouchNo(voucherNo);
		
		AddTransactions addTr = new AddTransactions();
		
		addTr.addTransactions(cashTrDb);
		addTr.addTransactions(cashTrCr);
		
		//session.setAttribute("id", Integer.toString(invoiceId));
		//response.sendRedirect("../accounts_operation_view/Payment.jsp");
		
		out.print(glId);
		out.flush();
		
	}
	
%>
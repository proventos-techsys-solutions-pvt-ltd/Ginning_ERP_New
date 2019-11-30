<%-- <%@ page errorPage="../admin/Error.jsp" %>  --%>
<%@page import="com.prov.report.GradeRateReport"%>
<%@page import="com.prov.dbinsertion.AddTransactions"%>
<%@page import="com.prov.bean.Transactions"%>
<%@page import="com.prov.dbinsertion.AddPDC"%>
<%@page import="com.prov.bean.PDC"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperPrintManager"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@page import="com.prov.jasper.JasperReports"%>
<%@page import="com.prov.dbupdation.UpdateStockMast"%>
<%@page import="com.prov.report.StockMasterReport"%>
<%@page import="com.prov.dbinsertion.AddStockDetails"%>
<%@page import="com.prov.bean.StockDetails"%>
<%@page import="com.prov.dbinsertion.AddAmanatEntry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.omg.CORBA.INV_POLICY"%>
<%@page import="com.prov.dbinsertion.AddInvoiceItems"%>
<%@page import="com.prov.bean.InvoiceItems"%>
<%@page import="com.prov.dbinsertion.AddInvoice"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.dbinsertion.AddStockMast"%>
<%@page import="com.prov.bean.StockMast"%>
<%@page import="com.prov.dbupdation.UpdateInvoice"%>
<%@page import="com.prov.bean.Invoice"%>
<%@page import="com.prov.bean.Amanat"%>
<%@page import="com.prov.dbupdation.UpdateAmanat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	String invoiceData = request.getParameter("output");

	JSONParser parser = new JSONParser();
	
	JSONObject json = (JSONObject) parser.parse(invoiceData);
	
	JSONArray jsonArray = (JSONArray)json.get("items");
	
	JSONObject paymentModes = (JSONObject)json.get("paymentModes");
	
	GradeRateReport gr = new GradeRateReport();
	
	double superRate = gr.getTodaysSuperRate().getRate();
	
	Invoice invoice = new Invoice();
	int invoiceId = 0;
		
	ArrayList<InvoiceItems> invoiceItemList = new ArrayList<InvoiceItems>();	
	ArrayList<Amanat> amanatItemList = new ArrayList<Amanat>();	
		
		for(int i=0; i<jsonArray.size(); i++){
			
			JSONObject obj = (JSONObject)jsonArray.get(i);
			
			if(((String)obj.get("amanat")).equals("false")){
				InvoiceItems item = new InvoiceItems();
				
				item.setWeighmentId(Integer.parseInt((String)obj.get("weighmentId")));
				item.setGradeId(Integer.parseInt((String)obj.get("gradeId")));
				item.setRst(Integer.parseInt((String)obj.get("rst")));
				invoiceItemList.add(item);
			
				Amanat amItem = new Amanat();
				
				amItem.setCustomerId(Integer.parseInt((String)json.get("customerId")));
				amItem.setAmanatDate((String)json.get("invoiceDate"));
				amItem.setGradeId(Integer.parseInt((String)obj.get("gradeId")));
				amItem.setRst(Integer.parseInt((String)obj.get("rst")));
				amItem.setFinalRate(Long.parseLong((String)obj.get("rate")));
				amItem.setInvoicedQty(Long.parseLong((String)obj.get("quantity")));
				amanatItemList.add(amItem);
			}
		}
		
		int companyId = Integer.parseInt((String)json.get("companyId"));
		
		if(invoiceItemList.size()>0){
			invoice.setVoucherNo(Integer.parseInt((String)json.get("voucherNo")));
			invoice.setCompanyId(companyId);
			invoice.setInvoiceNo((String)json.get("invoiceNo").toString().toUpperCase());
			invoice.setTotal(Long.parseLong((String)json.get("total")));
			invoice.setNetPayable(Long.parseLong((String)json.get("netPayable")));
			invoice.setAmountPaid(Long.parseLong((String)json.get("amountPaid")));
			invoice.setPending(Long.parseLong((String)json.get("pending")));
			invoice.setInvDate((String)json.get("invoiceDate"));
			invoice.setCustomerId(Integer.parseInt((String)json.get("customerId")));
			invoice.setAuthorizer((String)json.get("authorizer").toString().toUpperCase());
			invoice.setNote((String)json.get("note").toString().toUpperCase());
			invoice.setTotalQuanity(Long.parseLong((String)json.get("totalQuantity")));
			invoice.setPaidByoperator(0);
			invoice.setUnloadingCharges(Float.parseFloat((String)json.get("unloadingCharges")));
			invoice.setBonusAmount(Float.parseFloat((String)json.get("totalBonus")));
			invoice.setPdcAmount(Long.parseLong((String)json.get("pdcAmount")));
			invoice.setAdvance(Long.parseLong((String)json.get("advance")));
			if(paymentModes.containsKey("Cash")){
				invoice.setCashAmount(Long.parseLong((String)paymentModes.get("Cash")));
				invoice.setCashDate((String)paymentModes.get("Cash-date"));
			}else{
				invoice.setCashAmount(0);
				invoice.setCashDate(null);
			}
			if(paymentModes.containsKey("Cheque")){
				invoice.setChequeAmount(Long.parseLong((String)paymentModes.get("Cheque")));
				invoice.setChequeDate((String)paymentModes.get("Cheque-date"));
			}else{
				invoice.setChequeAmount(0);
				invoice.setChequeDate(null);
			}
			if(paymentModes.containsKey("RTGS/NEFT")){
				invoice.setRtgsAmount(Long.parseLong((String)paymentModes.get("RTGS/NEFT")));
				invoice.setRtgsDate((String)paymentModes.get("RTGS/NEFT-date"));
			}else{
				invoice.setRtgsAmount(0);
				invoice.setRtgsDate(null);
			}
			
			AddInvoice addinvoice = new AddInvoice();
			
			invoiceId = addinvoice.addInvoice(invoice); 
			
			AddInvoiceItems addItems = new AddInvoiceItems();
			
			for(int i=0; i<invoiceItemList.size(); i++){
				invoiceItemList.get(i).setInvoiceId(invoiceId);
				addItems.addInvoiceItems(invoiceItemList.get(i));
			}
		}
		
		
		UpdateAmanat updateAmanat = new UpdateAmanat();
		
		for(int i=0; i<amanatItemList.size(); i++){
			updateAmanat.setFinalRate(amanatItemList.get(i));
		}
		
		Transactions trCredit = new Transactions();
		
		trCredit.setContactId(Integer.toString(invoice.getCustomerId()));
		trCredit.setAccountId(Integer.parseInt((String)json.get("accountPayableId")));
		trCredit.setCredit(Long.parseLong((String)json.get("pending")));
		trCredit.setDebit(0);
		trCredit.setTransactionDate(invoice.getInvDate());
		trCredit.setVouchNo(Integer.parseInt((String)json.get("voucherNo")));
		trCredit.setNarration("RAW COTTON PURCHASE - "+(String)json.get("invoiceNo").toString().toUpperCase());
		trCredit.setVouchRef("RAW COTTON - "+(String)json.get("invoiceNo").toString().toUpperCase());
		
		Transactions trDebit = new Transactions();
		
		trDebit.setContactId(Integer.toString(invoice.getCustomerId()));
		trDebit.setAccountId(Integer.parseInt((String)json.get("accountPurchaseId")));
		trDebit.setCredit(0);
		trDebit.setDebit(Long.parseLong((String)json.get("pending")));
		trDebit.setTransactionDate(invoice.getInvDate());
		trDebit.setVouchNo(Integer.parseInt((String)json.get("voucherNo")));
		trDebit.setNarration("RAW COTTON PURCHASE - "+(String)json.get("invoiceNo").toString().toUpperCase());
		trDebit.setVouchRef("RAW COTTON - "+ (String)json.get("invoiceNo").toString().toUpperCase());
		
		AddTransactions addTr = new AddTransactions();
		
		addTr.addTransactions(trCredit);
		addTr.addTransactions(trDebit);
		
		
		session.setAttribute("invoiceId", Integer.toString(invoiceId));
	    response.sendRedirect("../admin/Invoice_Amanat.jsp");
%>
<%-- <%@ page errorPage="../admin/Error.jsp" %>  --%>
<%@page import="com.prov.report.AmanatReport"%>
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
	String amanatNo = AmanatReport.getAmanatSeries();
		
		for(int i=0; i<jsonArray.size(); i++){
			
			JSONObject obj = (JSONObject)jsonArray.get(i);
			
			if(((String)obj.get("amanat")).equals("false")){
				InvoiceItems item = new InvoiceItems();
				
				item.setWeighmentId(Integer.parseInt((String)obj.get("weighmentId")));
				item.setGradeId(Integer.parseInt((String)obj.get("gradeId")));
				item.setRst(Integer.parseInt((String)obj.get("rst")));
				item.setRate(Double.parseDouble((String)obj.get("rate")));
				item.setQuantity(Double.parseDouble((String)obj.get("quantity")));
				invoiceItemList.add(item);
			}
			else if(((String)obj.get("amanat")).equals("true")){
				Amanat item = new Amanat();
				
				item.setCustomerId(Integer.parseInt((String)json.get("customerId")));
				item.setAmanatDate((String)json.get("invoiceDate"));
				item.setGradeId(Integer.parseInt((String)obj.get("gradeId")));
				item.setRst(Integer.parseInt((String)obj.get("rst")));
				item.setDifference(superRate - Long.parseLong((String)obj.get("rate")));
				item.setInvoicedQty(0);
				item.setAmanatNo(amanatNo);
				
				amanatItemList.add(item);
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
			if(invoiceId>0){
				for(int i=0; i<invoiceItemList.size(); i++){
					invoiceItemList.get(i).setInvoiceId(invoiceId);
					addItems.addInvoiceItems(invoiceItemList.get(i));
				}
			}
		}
		
		if(amanatItemList.size()>0){
			AddAmanatEntry addAmanat = new AddAmanatEntry();
			
			for(int i=0; i<amanatItemList.size(); i++){
				addAmanat.addAmanat(amanatItemList.get(i));
			}
		}
		
		if(Long.parseLong((String)json.get("pdcAmount")) > 0){
			PDC pdc = new PDC();
			
			pdc.setCustomerId(Integer.parseInt((String)json.get("customerId")));
			pdc.setPayDate((String)json.get("pdcDate"));
			pdc.setInvoiceId(invoiceId);
            pdc.setAmount(Long.parseLong((String)json.get("pdcAmount")));	
            pdc.setModeOfPayment(Integer.parseInt((String)json.get("pdcPaymentMode")));
            pdc.setChequeId(0);
            pdc.setRtgsId(0);
            pdc.setVoucherNo(0);
            pdc.setPayStatus(0);
            
            AddPDC add = new AddPDC();
            
            int pdcId = add.addPDC(pdc);
		}
		
		StockMasterReport stockMast = new StockMasterReport();
		
		int stockMastId = stockMast.getTodaysStockId((String)json.get("invoiceDate"), companyId);
		
		System.out.println("Stock ID ---- "+stockMastId);
		
		if(invoiceId>0){
			StockDetails stock = new StockDetails();
			double totalQuantity = Long.parseLong((String)json.get("totalQuantity"));
			double totalAmount = Long.parseLong((String)json.get("total"));
			double averageRate = totalAmount/(totalQuantity/100);
			stock.setInvId(invoiceId);
			stock.setTotalQuantity(totalQuantity);
			stock.setAverageRate(averageRate);
			stock.setStockMastId(stockMastId);
			stock.setCompanyId(Integer.parseInt((String)json.get("companyId")));
			
			AddStockDetails addStock = new AddStockDetails();
			
			addStock.addStockDetails(stock);
			
			StockMast sm = new StockMast();
			
			sm.setId(stockMastId);
			sm.setRawCotton(totalQuantity);
			sm.setCompanyId(companyId);
			sm.setStockDate((String)json.get("invoiceDate"));
			sm.setAvgRate(averageRate);
			
			UpdateStockMast us = new UpdateStockMast();
			
			us.updateStockOnEntry(sm);
		
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
		}
		
		session.setAttribute("invoiceId", Integer.toString(invoiceId));
	    response.sendRedirect("../admin/Invoice.jsp");
%>
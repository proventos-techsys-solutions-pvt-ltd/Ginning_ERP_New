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
<%@page import="org.json.simple.JSONObject"%>
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
	
	System.out.println(jsonArray);
	
	Invoice invoice = new Invoice();
	int invoiceId =0;
		
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
			}
			else if(((String)obj.get("amanat")).equals("true")){
				Amanat item = new Amanat();
				
				item.setCustomerId(Integer.parseInt((String)json.get("customerId")));
				item.setGradeId(Integer.parseInt((String)obj.get("gradeId")));
				item.setAmanatDate((String)json.get("invoiceDate"));
				item.setGradeId(Integer.parseInt((String)obj.get("gradeId")));
				item.setRst(Integer.parseInt((String)obj.get("rst")));
				amanatItemList.add(item);
			}
			
		}
		
		int companyId = Integer.parseInt((String)json.get("companyId"));
		
		if(invoiceItemList.size()>0){
			invoice.setCompanyId(companyId);
			invoice.setInvoiceNo((String)json.get("invoiceNo").toString().toUpperCase());
			invoice.setTotal(Double.parseDouble((String)json.get("total")));
			invoice.setAmountPaid(Double.parseDouble((String)json.get("amountPaid")));
			invoice.setPending(Double.parseDouble((String)json.get("pending")));
			invoice.setInvDate((String)json.get("invoiceDate"));
			invoice.setCustomerId(Integer.parseInt((String)json.get("customerId")));
			invoice.setAuthorizer((String)json.get("authorizer").toString().toUpperCase());
			invoice.setNote((String)json.get("note").toString().toUpperCase());
			invoice.setTotalQuanity(Double.parseDouble((String)json.get("totalQuantity")));
			if((String)json.get("Cash") == null){
				invoice.setCashAmount(0.0);
			}else{
				invoice.setCashAmount(Double.parseDouble((String)json.get("Cash")));
			}
			if((String)json.get("Cheque") == null){
				invoice.setChequeAmount(0.0);
			}else{
				invoice.setChequeAmount(Double.parseDouble((String)json.get("Cheque")));
			}
			if((String)json.get("RTGS/NEFT") == null){
				invoice.setRtgsAmount(0.0);
			}else{
				invoice.setRtgsAmount(Double.parseDouble((String)json.get("RTGS/NEFT")));
			}
			
			
			
			
			
			System.out.println("CASH -------"+ invoice.getCashAmount());
			System.out.println("ch -------"+ invoice.getChequeAmount());
			System.out.println("rtgs -------"+ invoice.getRtgsAmount());
			
			
			AddInvoice addinvoice = new AddInvoice();
			
			invoiceId = addinvoice.addInvoice(invoice); 
			
			AddInvoiceItems addItems = new AddInvoiceItems();
			
			for(int i=0; i<invoiceItemList.size(); i++){
				
				invoiceItemList.get(i).setInvoiceId(invoiceId);
				addItems.addInvoiceItems(invoiceItemList.get(i));
			}
		
		}
		
		if(amanatItemList.size()>0){
			AddAmanatEntry addAmanat = new AddAmanatEntry();
			
			for(int i=0; i<amanatItemList.size(); i++){
				addAmanat.addAmanat(amanatItemList.get(i));
			}
		}
		StockMasterReport stockMast = new StockMasterReport();
		
		int stockMastId = stockMast.getTodaysStockId((String)json.get("invoiceDate"), companyId);
		
		System.out.println("Stock ID ---- "+stockMastId);
		
		StockDetails stock = new StockDetails();
		double totalQuantity = Double.parseDouble((String)json.get("totalQuantity"));
		double totalAmount = Double.parseDouble((String)json.get("total"));
		double averageRate = totalAmount/totalQuantity;
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
		System.out.println("InvoiceNo -- " + invoice.getInvoiceNo());
		session.setAttribute("InvoiceNo", invoice.getInvoiceNo());
		response.sendRedirect("../views/Invoice.jsp");
%>
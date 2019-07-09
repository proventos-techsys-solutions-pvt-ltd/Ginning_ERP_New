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
	
	JSONArray jsonArray = (JSONArray)json.get("itemList");
	
	System.out.println(jsonArray);
	
		
		Invoice invoice = new Invoice();
		
		invoice.setCompanyId(Integer.parseInt((String)json.get("comapnyId")));
		invoice.setInvoiceNo((String)json.get("invoiceNo"));
		invoice.setTotal(Double.parseDouble((String)json.get("total")));
		invoice.setAmountPaid(Double.parseDouble((String)json.get("amountPaid")));
		invoice.setPending(Double.parseDouble((String)json.get("pending")));
		invoice.setInvDate((String)json.get("invoiceDate"));
		
		AddInvoice addinvoice = new AddInvoice();
		
		int invoiceId = addinvoice.addInvoice(invoice); 
		
		AddInvoiceItems addItems = new AddInvoiceItems();
		
		for(int i=0; i<jsonArray.size(); i++){
			JSONObject obj = (JSONObject)jsonArray.get(i);
			
			InvoiceItems items = new InvoiceItems();
			
			items.setInvoiceId(invoiceId);
			items.setWeighmentId(Integer.parseInt((String)json.get("weighmentId")));
			
			addItems.addInvoiceItems(items);
			
		}
		
		
		
		StockMast stock = new StockMast();
		
		/* stock.setCompanyId(companyId);
		stock.setStockDate(date);
		stock.setRawCotton(totalWeight);
		stock.setAvgRate(i.getTotal()); */
		
		/* AddStockMast addStock = new AddStockMast();
		
		addStock.addStockMast(stock); */
		
		response.sendRedirect("../views/Invoice.jsp");
	

%>
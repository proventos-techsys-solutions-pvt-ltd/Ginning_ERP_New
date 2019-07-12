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
				
				item.setCustomerId(Integer.parseInt((String)obj.get("customerId")));
				item.setGradeId(Integer.parseInt((String)obj.get("gradeId")));
				item.setAmanatDate((String)obj.get("invoiceDate"));
				amanatItemList.add(item);
			}
			
		}
		
		invoice.setCompanyId(Integer.parseInt((String)json.get("companyId")));
		invoice.setInvoiceNo((String)json.get("invoiceNo").toString().toUpperCase());
		invoice.setTotal(Double.parseDouble((String)json.get("total")));
		invoice.setAmountPaid(Double.parseDouble((String)json.get("amountPaid")));
		invoice.setPending(Double.parseDouble((String)json.get("pending")));
		invoice.setInvDate((String)json.get("invoiceDate"));
		invoice.setCustomerId(Integer.parseInt((String)json.get("customerId")));
		invoice.setAuthorizer((String)json.get("authorizer").toString().toUpperCase());
		invoice.setNote((String)json.get("note").toString().toUpperCase());
		invoice.setTotalQuanity(Double.parseDouble((String)json.get("totalQuantity")));
		
		AddInvoice addinvoice = new AddInvoice();
		
		int invoiceId = addinvoice.addInvoice(invoice); 
		
		AddInvoiceItems addItems = new AddInvoiceItems();
		
		for(int i=0; i<invoiceItemList.size(); i++){
			
			invoiceItemList.get(i).setInvoiceId(invoiceId);
			addItems.addInvoiceItems(invoiceItemList.get(i));
			
		}
		
		AddAmanatEntry addAmanat = new AddAmanatEntry();
		
		for(int i=0; i<amanatItemList.size(); i++){
			addAmanat.addAmanat(amanatItemList.get(i));
		}
		
		StockMasterReport stockMast = new StockMasterReport();
		
		int stockMastId = stockMast.getTodaysStockId((String)json.get("invoiceDate"));
		
		System.out.println("Stock ID ---- "+stockMastId);
		
		StockDetails stock = new StockDetails();
		double totalQuantity = invoice.getTotalQuanity();
		double totalAmount = invoice.getTotal();
		double averageRate = totalAmount/totalQuantity;
		System.out.println("Average rate ---- "+averageRate);
		stock.setInvId(invoiceId);
		stock.setTotalQuantity(totalQuantity);
		stock.setAverageRate(averageRate);
		stock.setStockMastId(stockMastId);
		stock.setCompanyId(Integer.parseInt((String)json.get("companyId")));
		
		AddStockDetails addStock = new AddStockDetails();
		
		addStock.addStockDetails(stock);
		
		response.sendRedirect("../views/Invoice.jsp");
	

%>
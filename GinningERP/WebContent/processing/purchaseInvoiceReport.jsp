<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.Customer"%>
<%@page import="com.prov.bean.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.CustomerReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	
   		InvoiceReport ir = new InvoiceReport();
    
    	ArrayList<Invoice> invoiceReport = ir.getInvoiceReport(); 
    
    	CustomerReport cr = new CustomerReport();
    
    	JSONArray jsonArray = new JSONArray();
    	
    	for(int i=0;i<invoiceReport.size();i++){
    		Customer c = cr.getReport(invoiceReport.get(i).getCid());
    		
    		JSONObject jsonObj = new JSONObject(invoiceReport.get(i));
    		jsonObj.put("customerName", c.getName());
    		jsonObj.put("customerAddress", c.getAddress());
    		jsonObj.put("customerMobile", c.getMobile());
    		
    		jsonArray.put(jsonObj);
    		
    	}
    	
    	out.println(jsonArray);
    
    %>
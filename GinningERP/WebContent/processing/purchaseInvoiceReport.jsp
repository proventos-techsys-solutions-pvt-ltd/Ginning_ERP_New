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
    
    	JSONArray invoiceReport = ir.getInvoiceReport(); 
    
    	out.println(invoiceReport);
    	out.flush();
    
    %>
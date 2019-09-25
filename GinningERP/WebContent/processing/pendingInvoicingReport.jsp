<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    	
    	InvoiceReport report = new InvoiceReport();
    	
    	JSONArray arr = report.pendingInvoicingReport();
    	
    	out.print(arr);
    	out.flush();
    
    %>
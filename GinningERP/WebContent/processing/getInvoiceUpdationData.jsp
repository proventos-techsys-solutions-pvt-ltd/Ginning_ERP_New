<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String invoiceNo = request.getParameter("invoiceNo").toUpperCase().trim(); 

	InvoiceReport report = new InvoiceReport();
	JSONObject obj = report.getInvoiceDataForUpdation(invoiceNo);
	
	out.println(obj);
	out.flush();

%>
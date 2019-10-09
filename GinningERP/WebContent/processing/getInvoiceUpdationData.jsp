<%@page import="com.prov.dbops.CheckInvoiceExists"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String invoiceNo = request.getParameter("invoiceNo").toUpperCase().trim(); 
	
	CheckInvoiceExists checkInvoice = new CheckInvoiceExists();
	
	int invoiceFlag = 0;
	
	invoiceFlag = checkInvoice.invoiceExistsCheck(invoiceNo);
	
	JSONObject obj = null;

	if(invoiceFlag > 0){

		InvoiceReport report = new InvoiceReport();
		obj = report.getInvoiceDataForUpdation(invoiceNo);
		out.println(obj);
		out.flush();
		
	}else{
		out.println(0);
		out.flush();
	}
%>
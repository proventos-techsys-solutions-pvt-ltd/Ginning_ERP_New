<%@page import="com.prov.delete.DeleteInvoiceEntry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
 	int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
	
	DeleteInvoiceEntry deleteObj = new DeleteInvoiceEntry();
	
	String output = deleteObj.deleteInvoiceEntry(invoiceId);
	out.print(output);
	out.flush();

%>
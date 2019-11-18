<%@page import="com.prov.delete.DeleteInvoiceCashTr"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
	DeleteInvoiceCashTr deleteCash = new DeleteInvoiceCashTr();
	
	int returnValue = deleteCash.deleteCashEntry(invoiceId);
	
	out.print(returnValue);
	out.flush();

%>
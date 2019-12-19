<%@page import="com.prov.report.AmanatReport"%>
<%@page import="com.prov.delete.DeleteAmanat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	
	AmanatReport ar = new AmanatReport();
	int output = 0;
	long invoicedQty = ar.getAmanatInvoicedQty(id);
	if(invoicedQty==0){
		DeleteAmanat del = new DeleteAmanat();
		output = del.deleteAmanat(id);
	}else{
		output = -1;
	}
	
	out.print(output);
	out.flush();
	
%>
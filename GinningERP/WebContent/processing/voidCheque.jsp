<%@page import="com.prov.delete.VoidCheque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int chequeId = Integer.parseInt(request.getParameter("chequeId"));
	
	VoidCheque voidChequeObj = new VoidCheque();
	
	int delId = 0;
	delId = voidChequeObj.voidCheque(chequeId);
	
	out.print(delId);
	out.flush();

%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.CashReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	CashReport cr = new CashReport();
	JSONArray arr = cr.getCashPayments();
	
	out.print(arr);
	out.flush();

%>
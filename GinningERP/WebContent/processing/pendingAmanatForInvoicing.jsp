<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	AmanatReport ar = new AmanatReport();
	JSONArray arr = ar.getAmanatPendingForInvoicing();
	
	out.print(arr);
	out.flush();
%>
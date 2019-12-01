<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	System.out.println(request.getParameter("rstNo"));
	int rstNo = Integer.parseInt(request.getParameter("rstNo"));

	AmanatReport ar = new AmanatReport();
	
	JSONArray arr = ar.getAmanatDataForSlip(rstNo);
	
	out.print(arr);
	out.flush();
%>
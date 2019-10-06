<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.WeighReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	WeighReport report = new WeighReport();

	JSONArray arr = report.getWeighBridgeReport();
	
	out.print(arr);
	out.flush();

%>
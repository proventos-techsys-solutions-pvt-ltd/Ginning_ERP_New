<%@page import="com.prov.report.VehicleRateReport"%>
<%@page import="com.prov.report.WeighReport"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    	VehicleRateReport report = new VehicleRateReport();
    
    	JSONArray jsonArray = new JSONArray(report.getReport());
    	
    	out.print(jsonArray);
    	out.flush();
    	
    %>
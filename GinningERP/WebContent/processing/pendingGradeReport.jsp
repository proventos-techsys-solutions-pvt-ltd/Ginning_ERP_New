<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.GradeReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	
    	GradeReport report = new GradeReport();
    	
    	JSONArray arr = report.pendingGradingReport();
    	
    	out.print(arr);
    	out.flush();
    
    %>
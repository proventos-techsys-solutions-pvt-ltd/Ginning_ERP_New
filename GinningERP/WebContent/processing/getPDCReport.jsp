<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.PDCReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	
    	PDCReport pdcReport = new PDCReport();
    
    	JSONArray jsonArr = pdcReport.getPDCReport();
    	
    	out.print(jsonArr);
    	out.flush();
    
    %>
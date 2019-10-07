<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.DailySetupReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	
    	DailySetupReport dsReport = new DailySetupReport();
		
    	JSONArray jsonArray = dsReport.getDailySetupReport();
    	out.println(jsonArray);
    	out.flush();
    
    %>
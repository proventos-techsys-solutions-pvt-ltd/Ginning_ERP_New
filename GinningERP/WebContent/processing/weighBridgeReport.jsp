<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.WeighReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    	WeighReport report = new WeighReport();
    
    
   		JSONArray pendingTareReport = report.pendingTareReport();
   		
   		JSONArray completedTareReport = report.todaysCompletedRst();
   		
   		JSONObject obj = new JSONObject();
   		
   		obj.put("pendingReport", pendingTareReport);
   		obj.put("completedReport", completedTareReport);
   		
   		out.print(obj);
   		out.flush();
    
    %>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.DailySetup"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.DailySetupReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	DailySetupReport dsr = new DailySetupReport();
    
   		JSONArray setupJson = dsr.getTodaysDailySetups();
    	
    	out.print(setupJson);
    	out.flush(); 
    %>
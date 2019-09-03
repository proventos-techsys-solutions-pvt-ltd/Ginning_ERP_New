<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.bean.GradeRateMaster"%>
<%@page import="com.prov.report.GradeRateReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.DailySetup"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.DailySetupReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	DailySetupReport dsr = new DailySetupReport();
    
   		JSONArray setupJson = dsr.getTodaysDailySetups();
   		
   		System.out.println(setupJson);
    	
    	out.print(setupJson);
    	out.flush(); 
    %>
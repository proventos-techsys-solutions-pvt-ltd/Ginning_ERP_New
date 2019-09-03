<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.GradeRateMaster"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.GradeRateReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.DailySetupReport"%>
<%@page import="com.prov.bean.DailySetup"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    	DailySetupReport dsr = new DailySetupReport();
    
    	DailySetup ds = dsr.LatestDailySetup();
    	
    	JSONObject obj = new JSONObject(ds);
    	
    	out.print(obj);
    	out.flush();
    	
    %>
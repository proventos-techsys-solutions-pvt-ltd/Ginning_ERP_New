<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.report.GradeRateReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.GradeMaster"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.GradeReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	GradeRateReport gr = new GradeRateReport();
    	
    	
    	JSONArray jsonArray = gr.getTodaysGradeRates();
    	
    	out.print(jsonArray);
    	out.flush();
    	
    %>
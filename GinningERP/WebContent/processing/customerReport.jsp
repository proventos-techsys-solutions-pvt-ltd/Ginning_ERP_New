<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.CustomerReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <% 
    	
    	CustomerReport cr = new CustomerReport();
    
    	JSONArray jsonArray = new JSONArray(cr.getReport());
    	
    	out.println(jsonArray);
    
    %>
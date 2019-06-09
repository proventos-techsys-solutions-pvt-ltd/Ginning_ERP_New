<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.Amanat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    	
    	AmanatReport ar = new AmanatReport();
    
    	ArrayList<Amanat> list = new ArrayList<Amanat>();
    	
    	list = ar.getAmanatData();
    	
    	JSONArray jsonList = new JSONArray(list);
    	
    	out.print(jsonList);
    
    %>
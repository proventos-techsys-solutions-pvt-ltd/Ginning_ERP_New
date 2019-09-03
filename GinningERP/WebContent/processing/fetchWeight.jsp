<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.weighing.FetchWeight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>	
    
    <% 
    	FetchWeight fetch = new FetchWeight();
    	String weightStr = fetch.fetch();
    	double weight = fetch.parseWeight(weightStr);
    
    	out.println(weight);
    	out.flush();
    %>
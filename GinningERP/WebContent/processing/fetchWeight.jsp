<%@page import="com.prov.weighing.FetchWeight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>	
    
    <% 
    	
    	FetchWeight fetch = new FetchWeight();
    	double weight = fetch.fetch();
    
    	out.println(weight);
    	out.flush();
    
    %>
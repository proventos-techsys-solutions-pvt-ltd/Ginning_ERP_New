<%@page import="com.prov.report.AmanatReport"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    
    	int rst = Integer.parseInt(request.getParameter("rst"));
    
    	System.out.println(rst);

    	AmanatReport rep = new AmanatReport();
    	
    	JSONArray json = rep.getAmanatDataInvoicing(rst);

    	out.print(json);
    	out.flush();
    %>
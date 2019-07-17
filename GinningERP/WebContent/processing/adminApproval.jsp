<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.RstReport"%>
<%@page import="com.prov.bean.Amanat"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.CustomerReport"%>
<%@page import="com.prov.bean.Customer"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@page import="com.prov.report.WeighReport"%>
<%@page import="com.prov.report.CustomerVehicleReport"%>
<%@page import="com.prov.bean.CustomerVehicle"%>
<%@page import="com.prov.bean.Invoice"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	
    	String rstString = request.getParameter("rst");
    
        System.out.print(rstString);
        
        if(rstString.equals("0") || rstString == "")
        {
        	out.println("Please enter valid information.");	
        }
        
        else{
        	
        	int rst = Integer.parseInt(rstString);
        	
	    	RstReport report = new RstReport();
        	
        	JSONArray jsonArray =  report.getDataForInvoicing(rst);
        	
	    	out.print(jsonArray);
	    	out.flush();
        }
    %>
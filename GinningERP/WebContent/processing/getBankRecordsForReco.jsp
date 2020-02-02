<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.TransactionReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    	
    	int bankId = Integer.parseInt(request.getParameter("bankId"));
    	int companyId = Integer.parseInt(request.getParameter("companyId"));
    	String date = request.getParameter("date");
    	
    	TransactionReport trReportObj = new TransactionReport();
    	JSONArray arr = trReportObj.getBankTransactionForReco(companyId, bankId, date);
    	
    	out.print(arr);
    	out.flush();
    	
    %>
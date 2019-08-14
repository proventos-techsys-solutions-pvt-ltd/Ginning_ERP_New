<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.CashReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    
    	String startDate = request.getParameter("startDate");
    	String endDate = request.getParameter("endDate");
    	
    	CashReport report = new CashReport();
    	
    	JSONArray jsonArray = report.getCashReport(startDate, endDate);
    	
    	System.out.print(jsonArray);
    	session.setAttribute("jsonArray", jsonArray);
    	
    	response.sendRedirect("../admin/Cash_Register.jsp");
    
    %>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.BankReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	int bankId = Integer.parseInt(request.getParameter("bankId"));
	int companyId = Integer.parseInt(request.getParameter("companyId"));
	
	BankReport report = new BankReport();
	
	JSONArray jsonArray = report.getBankTransactions(startDate, endDate, bankId, companyId);
	
	System.out.print(jsonArray);
	session.setAttribute("jsonArray", jsonArray);
	
	response.sendRedirect("../admin/Bank_Register.jsp");
    
    %>
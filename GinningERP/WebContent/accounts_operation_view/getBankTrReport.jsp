<%@page import="org.json.JSONObject"%>
<%@ page errorPage="../admin/Error.jsp" %>  
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
	
	double openingBalance = report.getOpeningBalForLedger(bankId, companyId, startDate);
	
	JSONArray jsonArray = report.getBankTransactions(startDate, endDate, bankId, companyId);
	
	JSONObject parentObj = new JSONObject();
	
	parentObj.put("array", jsonArray);
	parentObj.put("openingBal", openingBalance);
	
	System.out.print(parentObj);
	out.print(parentObj);
	out.flush();
    
    %>
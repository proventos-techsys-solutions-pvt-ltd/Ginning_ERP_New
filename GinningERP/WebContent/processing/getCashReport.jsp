<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.TransactionReport"%>
<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.CashReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    
    String startDate = request.getParameter("startDate");
   	String endDate = request.getParameter("endDate");
   	int accId = Integer.parseInt(request.getParameter("accId"));
   	int companyId = Integer.parseInt(request.getParameter("companyId"));
    	
    	CashReport report = new CashReport();
    	
    	TransactionReport trReport = new TransactionReport();

    	double openingBalance = trReport.getOpeningBalForLedger(accId, companyId, startDate);
    	
    	JSONObject parentObj = new JSONObject();
    	
    	parentObj.put("openingBal", openingBalance);
    	
    	System.out.print(parentObj);
    	out.print(parentObj);
    	out.flush();
    	
    	
    	JSONArray jsonArray = report.getTransactions(startDate, endDate, accId, companyId);
    	parentObj.put("array", jsonArray);
    	
    	
    	System.out.print(jsonArray);
    	session.setAttribute("jsonArray", jsonArray);
    	
    	response.sendRedirect("../admin/Cash_Register.jsp");
    
    %>
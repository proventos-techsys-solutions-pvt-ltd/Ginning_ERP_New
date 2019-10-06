<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.BalanceReport"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int companyId = Integer.parseInt(request.getParameter("companyId"));
	int bankId = Integer.parseInt(request.getParameter("bankId"));
	
	JSONObject parent = new JSONObject();
	
	BalanceReport br = new BalanceReport();
	
	double bankBalance = br.getBankBalanceForDS(companyId, bankId);
	
	JSONArray arr = br.getCashBalanceForDS(companyId);
	
	parent.put("bankBalance", bankBalance);
	parent.put("cashBalances", arr);
	
	out.print(parent);
	out.flush();

%>
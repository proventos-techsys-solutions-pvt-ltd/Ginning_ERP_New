<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.TransactionReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int voucherNo = Integer.parseInt(request.getParameter("voucherNo"));
	
	TransactionReport trReportObj = new TransactionReport();
	
	JSONArray arr = trReportObj.getJournalEntriesForUpdation(voucherNo);
	
	out.print(arr);
	out.flush();

%>
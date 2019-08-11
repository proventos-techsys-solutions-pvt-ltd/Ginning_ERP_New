<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.GeneralLedger"%>
<%@page import="com.prov.report.GeneralLedgerReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	GeneralLedgerReport report = new GeneralLedgerReport();
	JSONArray jsonArr= report.getReport();
	out.print(jsonArr);
	out.flush();
	
%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.Cheque"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	ChequeReport report = new ChequeReport();

	ArrayList<Cheque> chequeReport = report.getChequeReport();
	
	JSONArray jsonnArray = new JSONArray(chequeReport);
	
	out.print(jsonnArray);
	out.flush();

%>
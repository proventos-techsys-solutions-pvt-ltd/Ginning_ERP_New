<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.RstReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String rst = request.getParameter("rst");
	
	RstReport report = new RstReport();
	
	JSONObject obj = report.getGraderData(rst);

	out.print(obj);
	out.flush();
	
%>
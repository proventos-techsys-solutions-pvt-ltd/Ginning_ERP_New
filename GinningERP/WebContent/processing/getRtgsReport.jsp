<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.Rtgs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.RtgsReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	RtgsReport report = new RtgsReport();

	JSONArray rtgsReport = report.getRtgsReportforPayment();
	
	out.print(rtgsReport);
	out.flush();
	
%>
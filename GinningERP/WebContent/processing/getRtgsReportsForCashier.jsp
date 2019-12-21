<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.RtgsReport"%>
<%@page import="com.prov.bean.Rtgs"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 

	RtgsReport report = new RtgsReport();

	ArrayList<Rtgs> rtgsReport = report.rtgsReport();
	
	JSONArray jsonArr = new JSONArray(rtgsReport);
	
	out.print(jsonArr);
	out.flush();
	
%>
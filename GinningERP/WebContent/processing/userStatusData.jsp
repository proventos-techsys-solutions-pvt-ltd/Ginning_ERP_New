<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.UserReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	UserReport report = new UserReport();

	ArrayList<User> aList = report.getReport();
	
	JSONArray jArray = new JSONArray(aList);
	
	out.print(jArray);
	out.flush();

%>
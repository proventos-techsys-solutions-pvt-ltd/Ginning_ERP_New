<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.RstReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	int rst = Integer.parseInt(request.getParameter("rst"));
	
	if(rst == 0 )
	{
		out.println("Please enter valid information.");
	}
	else{
	RstReport report = new RstReport();
	
	JSONObject obj = report.getGraderData(rst);

	out.print(obj);
	out.flush();
	}
%>
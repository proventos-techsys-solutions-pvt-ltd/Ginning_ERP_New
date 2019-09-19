<%@page import="com.prov.report.RtgsReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	int companyId = Integer.parseInt(request.getParameter("companyId"));
	
	RtgsReport report = new RtgsReport();
	
	int rtgsCount = report.todaysRtgsCount(companyId);
	
	out.print(rtgsCount);
	out.flush();

%>
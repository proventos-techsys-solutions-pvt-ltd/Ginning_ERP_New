<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.Company"%>
<%@page import="com.prov.report.CompanyReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	CompanyReport cr = new CompanyReport();
	
 	Company company = cr.getCompanyData(id);
 	
 	JSONObject json = new JSONObject(company);
 	
 	out.print(json);
 	out.flush();

%>
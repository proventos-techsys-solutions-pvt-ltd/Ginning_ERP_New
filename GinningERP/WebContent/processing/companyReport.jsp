<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.bean.Company"%>
<%@page import="com.prov.report.CompanyReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 	
 	CompanyReport cr = new CompanyReport();
 
 	ArrayList<Company> c = new ArrayList<Company>();
 	
 	
 	c = cr.getReport();
 	
 	JSONArray customerArray = new JSONArray(c);
 	
 	out.print(customerArray);
 	out.flush();
 %>
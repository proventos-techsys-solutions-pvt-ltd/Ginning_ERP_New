<%@page import="com.prov.dbops.CheckRST"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	int rst = Integer.parseInt(request.getParameter("rst"));

	CheckRST cr = new CheckRST();
	
	int flag = cr.checkRstExists(rst);
	
	out.print(rst);

%>
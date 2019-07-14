<%@page import="com.prov.dbops.CheckRST"%>
<%@page import="com.prov.weighing.SimpleRead"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	SimpleRead.getWeighBridgeData();
	
	int rst = 0;
	int flag = 0;
	
	CheckRST cr = new CheckRST();
	
	//flag = cr.checkRstExists(rst);
	
	out.print(flag);
	
%>
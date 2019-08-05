<%@page import="com.prov.dbops.RSTSeries"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	
	RSTSeries series = new RSTSeries();

	int rst = series.getRst();
	
	out.print(rst);
	out.flush();

%>
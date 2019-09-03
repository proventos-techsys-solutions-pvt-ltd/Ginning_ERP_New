<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbops.CheckDailySetup"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 		
 	CheckDailySetup cds = new CheckDailySetup();
 	int rowCount = cds.checkDailySetupCompleted();
 	
 	out.print(rowCount);
 	out.flush();
 	
 %>
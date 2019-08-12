<%@page import="com.prov.dbops.GetTodaysBonusAmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    	GetTodaysBonusAmt bonus = new GetTodaysBonusAmt();
    
    	float bonusAmount = bonus.getBonusAmt();
    	
    	out.println(bonusAmount);
    	out.flush();
    
    %>
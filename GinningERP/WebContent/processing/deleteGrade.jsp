<%@page import="com.prov.delete.DeleteGradeMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    	int gradeId = Integer.parseInt(request.getParameter("gradeId"));	
    
    	DeleteGradeMaster delGrade = new DeleteGradeMaster();
    	
    	int id = delGrade.deleteGrade(gradeId);
    	
    	out.println(id);
    	out.flush();
    
    %>
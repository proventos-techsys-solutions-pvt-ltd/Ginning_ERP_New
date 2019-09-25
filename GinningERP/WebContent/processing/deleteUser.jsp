<%@page import="com.prov.delete.DeleteUser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	int userId = Integer.parseInt(request.getParameter("userId"));	
    
    	DeleteUser deleteUser = new DeleteUser();
    	
    	deleteUser.deleteUser(userId);
    	
		out.flush();
    %>
<%@page import="com.prov.delete.DeleteDailySetup"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%></html>
    
    <%
    
    	int dailySetupId = Integer.parseInt(request.getParameter("dailySetupId"));
    
    	DeleteDailySetup ds = new DeleteDailySetup();
    	
    	int id = ds.deleteDailySetup(dailySetupId);
    	
    	session.setAttribute("id", id);
    	
    	response.sendRedirect("../admin/Daily_Setup.jsp");
    
    %>
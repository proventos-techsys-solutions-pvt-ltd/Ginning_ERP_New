<%@page import="com.prov.dbops.Grading"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	int rst = Integer.parseInt(request.getParameter("rst"));
    	String grade = request.getParameter("grade");
    	Float graderRate = Float.parseFloat(request.getParameter("graderRate"));
    	
		Grading obj = new Grading();
		
		obj.setGrading(grade, graderRate, rst);
		
		response.sendRedirect("../views/Grader.jsp");    
    %>
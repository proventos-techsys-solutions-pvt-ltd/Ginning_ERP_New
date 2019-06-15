<%@page import="com.prov.dbops.Grading"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	int rst = Integer.parseInt(request.getParameter("gradeRST"));
    	String grade = request.getParameter("grade").toUpperCase();
    	Float graderRate = Float.parseFloat(request.getParameter("rate"));
    	
    	if(rst == 0 || grade == "" || grade == null || graderRate == 0 || graderRate == null)
    	{
    		out.println("Please enter valid information.");
    	}
    	else{
		Grading obj = new Grading();
		
		obj.setGrading(grade, graderRate, rst);
		
		response.sendRedirect("../views/Grader.jsp");    
    	}
    %>
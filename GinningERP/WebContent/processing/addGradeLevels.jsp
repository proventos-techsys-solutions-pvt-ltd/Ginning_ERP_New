<%@page import="com.prov.dbinsertion.AddGradeMaster"%>
<%@page import="com.prov.bean.GradeMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	String grade = request.getParameter("grade");
     	String desc = request.getParameter("desc");
     	
     	GradeMaster gm = new GradeMaster();
     	
     	gm.setGrade(grade);
     	gm.setDesc(desc);
     	
     	AddGradeMaster agm = new AddGradeMaster();
     	
     	agm.addGradeMaster(gm);
     	
        response.sendRedirect("../views/SetupGrade.jsp");
    
    %>
    
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.dbupdation.UpdateGradeMaster"%>
<%@page import="com.prov.dbinsertion.AddGradeMaster"%>
<%@page import="com.prov.bean.GradeMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	String gradeId = request.getParameter("gradeId");
    	String gradeName = request.getParameter("gradeNameUpdate");
    	String gradeDescription = request.getParameter("descriptionUpdate");
    	
     	GradeMaster gm = new GradeMaster();
     	
     	gm.setId(Integer.parseInt(gradeId));
     	gm.setGrade(gradeName);
     	gm.setDesc(gradeDescription);
     	
     	UpdateGradeMaster ugm = new UpdateGradeMaster();
     	
     	ugm.updateGradeMaster(gm);
     	
        response.sendRedirect("../views/SetupGrade.jsp");
    
    %>
    
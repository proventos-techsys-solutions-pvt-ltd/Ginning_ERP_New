<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.dbupdation.UpdateGradeMaster"%>
<%@page import="com.prov.dbinsertion.AddGradeMaster"%>
<%@page import="com.prov.bean.GradeMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	String output = request.getParameter("outputUpdate");
    	
    	JSONParser parser = new JSONParser();
    	
    	JSONObject obj = (JSONObject)parser.parse(output);
    	
     	GradeMaster gm = new GradeMaster();
     	
     	gm.setId(Integer.parseInt((String)obj.get("gradeId")));
     	gm.setGrade(((String)obj.get("gradeName")).toUpperCase());
     	gm.setDesc(((String)obj.get("description")).toUpperCase());
     	
     	UpdateGradeMaster ugm = new UpdateGradeMaster();
     	
     	ugm.updateGradeMaster(gm);
     	
        response.sendRedirect("../views/SetupGrade.jsp");
    
    %>
    
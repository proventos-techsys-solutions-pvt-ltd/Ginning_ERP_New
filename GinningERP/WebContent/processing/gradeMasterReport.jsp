<%@page import="com.prov.bean.GradeMaster"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.GradeReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.GradeRateReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <% 
  		GradeReport gr = new GradeReport();
    	
  		ArrayList<GradeMaster> arr = gr.getReport();
    	
    	JSONArray jsonArray = new JSONArray(arr);
    	
    	out.print(jsonArray);
    	out.flush();
    	
    %>
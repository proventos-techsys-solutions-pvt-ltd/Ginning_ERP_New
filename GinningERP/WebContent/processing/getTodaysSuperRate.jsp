<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.GradeRateReport"%>
<%@page import="com.prov.bean.GradeRateMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%
   
   	GradeRateReport gradeReport = new GradeRateReport();
   
   	GradeRateMaster grm = gradeReport.getTodaysSuperRate();
   
   	JSONObject obj = new JSONObject(grm);
   	
   	out.print(obj);
   	out.flush();
   	
   %>
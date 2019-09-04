<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.report.StockMasterReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.GradeRateReport"%>
<%@page import="com.prov.bean.GradeRateMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%
   
   	GradeRateReport gradeReport = new GradeRateReport();
   
   	GradeRateMaster grm = gradeReport.getTodaysSuperRate();
   	
   	StockMasterReport smr = new StockMasterReport();
   	
   	double avgRate = smr.getTodaysAverageRate();
   
   	JSONObject obj = new JSONObject();
   	
   	System.out.println(grm.getRate());
   	
   	obj.put("superRate", grm.getRate());
   	obj.put("averageRate", avgRate);
   	
   	out.print(obj);
   	out.flush();
   	
   %>
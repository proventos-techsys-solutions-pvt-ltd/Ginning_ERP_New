<%@page import="com.prov.bean.GradeRateMaster"%>
<%@page import="com.prov.dbinsertion.AddGradeRateMaster"%>
<%@page import="com.prov.bean.DailySetup"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String output =  request.getParameter("dailySetupOutput");

	JSONParser parser = new JSONParser();
	
	JSONObject json = (JSONObject) parser.parse(output);
	
	JSONArray jsonArray = (JSONArray)json.get("gradeRates");
	
	DailySetup ds = new DailySetup();
	
	ds.setCompanyId(Integer.parseInt((String)json.get("companyId")));
	ds.setSetupDate((String)json.get("todaysDate"));
	ds.setCottonHeap((String)json.get("todaysHeap"));
	ds.setCottonRate(Float.parseFloat((String)(((JSONObject)jsonArray.get(0)).get("gradeRate"))));
	
	AddGradeRateMaster addRates = new AddGradeRateMaster();
	
	for(int i=0;i<jsonArray.size();i++){
		GradeRateMaster gr = new GradeRateMaster();
		gr.setGradeId(Integer.parseInt((String)(((JSONObject)jsonArray.get(i)).get("gradeId"))));
		gr.setRate(Double.parseDouble((String)(((JSONObject)jsonArray.get(i)).get("gradeRate"))));
		gr.setRateDate((String)json.get("todaysDate"));
		
		addRates.addGradeRateMaster(gr);
	}
	

%>
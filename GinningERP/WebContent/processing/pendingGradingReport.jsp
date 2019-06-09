<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.Customer"%>
<%@page import="com.prov.report.CustomerReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.WeighReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	WeighReport wr = new WeighReport();
	
	CustomerReport cr = new CustomerReport();
	
	
	ArrayList<WeighMast> list = new ArrayList<WeighMast>();

	list = wr.getReport();
	
	JSONArray jsonList = new JSONArray();
	
	for(WeighMast wm : list){
		
		if(wm.getGrade()==null && wm.getGraderRate()==0.0){
			
			Customer c = cr.getReport(wm.getCid());
			
			JSONObject jsonObj = new JSONObject(wm);
			
			jsonObj.put("customerName", c.getName());
			
			jsonList.put(jsonObj);
		}
		
	}
	
	out.print(jsonList);
	out.flush();

%>
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
	
	JSONArray jsonList = wr.pendingTareReport(); 
	
	out.print(jsonList);
	out.flush();

%>

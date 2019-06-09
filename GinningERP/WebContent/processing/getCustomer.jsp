<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.Customer"%>
<%@page import="com.prov.report.CustomerReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

	String customerName = request.getParameter("customerName").toUpperCase();
	String customerMobile = request.getParameter("mobileNo");
	
	if(customerName == "" || customerName == null || customerMobile == "" || customerMobile == null)
	{
		out.println("Please enter valid information.");
	}
	else{
		
	CustomerReport report = new CustomerReport();
	
	Customer customer = report.getCustomerData(customerName, customerMobile);
	if(customer.getId()>0){
		JSONObject customerJson = new JSONObject(customer);
		out.print(customerJson);
		out.flush();
	}
	else{
		out.print(false);
		out.flush();
	}
	}
%>
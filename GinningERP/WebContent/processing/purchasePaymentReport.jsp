<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.PurchaseReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	PurchaseReport pr = new PurchaseReport();

	JSONObject json = pr.getTodaysTotalPurchase();
	json.put("rtgsPdp", pr.getTodaysPdpPurchase("3"));
	json.put("cashPdp", pr.getTodaysPdpPurchase("1"));
	json.put("chequePdp", pr.getTodaysPdpPurchase("2"));
	
	long totalPurchase = json.getLong("chequeAmount") + json.getLong("cashAmount") + json.getLong("rtgsAmount");
	
	long totalPdpPurchase = json.getLong("chequePdp") + json.getLong("rtgsPdp") + json.getLong("cashPdp");
	
	json.put("totalPurchase", totalPurchase);
	json.put("totalPdpPurchase", totalPdpPurchase);
	
	System.out.print(json);
	
	out.print(json);
	out.flush();
	
%>
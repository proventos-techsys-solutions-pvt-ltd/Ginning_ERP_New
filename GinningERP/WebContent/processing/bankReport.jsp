<%@page import="com.prov.report.CompanyReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.bean.Bank"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.prov.report.BankReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    	BankReport br = new BankReport();
    	
    	ArrayList<Bank> bankList = new ArrayList<Bank>();
    	
    	bankList = br.getReport();
    	
    	CompanyReport cr = new CompanyReport();
    	
    	JSONArray jsonArray = new JSONArray(bankList);
    	
    	
    	for(int i=0; i<jsonArray.length(); i++){
    		
    		
    		String companyName = cr.getCompanyData(Integer.parseInt((jsonArray.getJSONObject(i).get("companyId").toString()))).getName();
    		
    		jsonArray.getJSONObject(i).put("companyName", companyName);
    	}
    	
    	out.print(jsonArray);
    	
    %>
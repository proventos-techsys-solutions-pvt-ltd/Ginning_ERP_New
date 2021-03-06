<%@page import="com.prov.report.InvoiceReport"%>
<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.DailySetup"%>
<%@page import="com.prov.report.DailySetupReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    
    	DailySetupReport dsr = new DailySetupReport();
    
    	DailySetup ds = dsr.LatestDailySetup();
    	
    	JSONObject jsonObj = new JSONObject(ds);
    	
    	InvoiceReport invReport = new InvoiceReport();
    	
    	String invoiceSeries = invReport.getInvoiceNoSeries(ds.getCompanyId());
    	
    	jsonObj.put("invoiceSeries", invoiceSeries);
    	
    	out.print(jsonObj);
    	out.flush();
    
    
    %>
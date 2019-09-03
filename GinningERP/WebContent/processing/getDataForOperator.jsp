<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@page import="com.prov.dbops.CheckInvoiceSaved"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    	
    	String invoiceNo = request.getParameter("invoiceNo").toUpperCase();
    
    	CheckInvoiceSaved check = new CheckInvoiceSaved();
    	
    	if(invoiceNo.equals("") || invoiceNo.equals("0")){
    		out.print(0);
    		out.flush();
    	}else if(check.invoiceExistsCheckByNo(invoiceNo)<=0){
    		out.print(0);
    		out.flush();
    	}else if(check.invoiceExistsCheckByNo(invoiceNo)>0){
    		
    		InvoiceReport invoice = new InvoiceReport();
    		JSONObject obj = invoice.getInvoiceForOperator(invoiceNo);
    		out.print(obj);
    		out.flush();
    	}
    
    %>
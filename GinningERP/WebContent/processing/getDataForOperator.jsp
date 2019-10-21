<%@page import="com.prov.bean.PDC"%>
<%@page import="com.prov.report.PDCReport"%>
<%@page import="com.prov.misc.MergeJSON"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="com.prov.bean.Cheque"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@page import="com.prov.dbops.CheckInvoiceSaved"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
    	
    	String invoiceNo = request.getParameter("invoiceNo").toUpperCase();
    
    	MergeJSON mergeJson = new MergeJSON();	
    
    	CheckInvoiceSaved check = new CheckInvoiceSaved();
    	
    	if(invoiceNo.equals("") || invoiceNo.equals("0")){
    		out.print(0);
    		out.flush();
    	}else{
    		int invoiceExistFlag = check.invoiceExistsCheckByNo(invoiceNo);
    		if(invoiceExistFlag<=0){
 		    	out.print(0);
	    		out.flush();
	    	}else if(invoiceExistFlag>0){
	    		InvoiceReport invoice = new InvoiceReport();
	    		int paymentStatus = invoice.getInvoicePaymentStatus(invoiceNo);
	    		if(paymentStatus == 0){
		    		JSONObject obj = invoice.getInvoiceForOperator(invoiceNo);
	    			out.print(obj);
	        		out.flush();
	    		}else if(paymentStatus == 1){
	    			
	    			JSONObject paymentAmounts = invoice.getInvoicePaymentDetails(invoiceNo);
	    			
	    		}
	    	}
    	}
    
    %>
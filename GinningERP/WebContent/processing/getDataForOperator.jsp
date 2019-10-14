<%@page import="com.prov.bean.PDC"%>
<%@page import="com.prov.report.PDCReport"%>
<%@page import="com.prov.misc.MergeJSON"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="com.prov.bean.Cheque"%>
<%@ page errorPage="../admin/Error.jsp" %>  
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
    	}else if(check.invoiceExistsCheckByNo(invoiceNo)<=0){
    		out.print(0);
    		out.flush();
    	}else if(check.invoiceExistsCheckByNo(invoiceNo)>0){
    		
    		InvoiceReport invoice = new InvoiceReport();
    		JSONObject obj = invoice.getInvoiceForOperator(invoiceNo);
    		
    		if(Integer.parseInt((String)obj.get("paidByOperator")) == 0){
    			out.print(obj);
        		out.flush();
    		}else{
    			if(Long.parseLong((String)obj.get("chequeAmount")) > 0){
    				ChequeReport cr = new ChequeReport();
    				
    				JSONObject chqObj = cr.getChequeForInvoice(Integer.parseInt((String)obj.get("invoiceId")));
    				obj = mergeJson.mergeJSONObjects(obj, chqObj);
    			}
    			if(Long.parseLong((String)obj.get("pdcAmount")) > 0){
    				
    				PDCReport pdcReport = new PDCReport();
    				
    				PDC pdc = pdcReport.getPDCData(Integer.parseInt((String)obj.get("invoiceId")));
    				
    				if(pdc.getChequeId() > 0){
    					
    				}
    				
    			}
    		}
    	}
    
    %>
<%@page import="com.prov.report.RtgsReport"%>
<%@page import="com.prov.report.TransactionReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.PaymentReport"%>
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
	    		PaymentReport paymentReport = new PaymentReport();
	    		JSONObject mainJsonObj = new JSONObject();
	    		InvoiceReport invoiceReport = new InvoiceReport();
	    		JSONObject invoiceJson = invoiceReport.getInvoiceForOperator(invoiceNo);
	    		MergeJSON mergeJson = new MergeJSON();
	    		mainJsonObj.put("invoiceJson", invoiceJson);
	    		int invoiceId = Integer.parseInt(invoiceJson.getString("invoiceId"));
	    		if(Long.parseLong(invoiceJson.getString("cashAmount")) > 0){
	    			JSONObject cashJson = paymentReport.getCashReport(invoiceId);
	    			if(Integer.parseInt(cashJson.getString("paymentStatus")) == 1){
	    				TransactionReport trReport = new TransactionReport();
	    				int accountId = trReport.getAccountId(Integer.parseInt(cashJson.getString("voucherNo")));
	    				cashJson.put("accountId", accountId);
	    			}
	    			mainJsonObj.put("cashJson", cashJson);
	    		}
	    		if(Long.parseLong(invoiceJson.getString("chequeAmount")) > 0){
	    			JSONObject chequeJson = paymentReport.getChequeReport(invoiceId);
	    			if(Integer.parseInt(chequeJson.getString("paymentStatus")) == 1){
	    				ChequeReport chequeReport = new ChequeReport();
	    				JSONObject cheqeuDataJson = new JSONObject(chequeReport.getChequeReport(Integer.parseInt(chequeJson.getString("chequeId"))));
	    				chequeJson =  mergeJson.mergeJSONObjects(cheqeuDataJson, chequeJson);
	    			}
	    			mainJsonObj.put("chequeJson", chequeJson);
	    		}
	    		if(Long.parseLong(invoiceJson.getString("rtgsAmount")) > 0){
	    			JSONObject rtgsJson = paymentReport.getRtgsReport(invoiceId);
	    			if(Integer.parseInt(rtgsJson.getString("paymentStatus")) == 1){
	    				RtgsReport rtgsReport = new RtgsReport();
	    				JSONObject cheqeuDataJson = rtgsReport.rtgsReport(Integer.parseInt(rtgsJson.getString("rtgsId")));
	    				rtgsJson =  mergeJson.mergeJSONObjects(cheqeuDataJson, rtgsJson);
	    			}
	    			mainJsonObj.put("rtgsJson", rtgsJson);
	    		}
	    		if(Long.parseLong(invoiceJson.getString("pdcAmount")) > 0){
	    			PDCReport pdcReport = new PDCReport();
	    			JSONObject pdcJson = pdcReport.getPDCJsonData(invoiceId);
	    			//int paymentStatus = Integer.parseInt(pdcJson.getString("pdcPayStatus"));
	    			String modeOfPayment = pdcJson.getString("modeOfPayment");
	    			if(pdcJson.has("voucherNo") == true && modeOfPayment.equalsIgnoreCase("CASH")){
	    				TransactionReport trReport = new TransactionReport();
	    				int accountId = trReport.getAccountId(Integer.parseInt(pdcJson.getString("voucherNo")));
	    				pdcJson.put("accountId", accountId);
	    			}
	    			if(pdcJson.has("chequeId") == true && modeOfPayment.equalsIgnoreCase("CHEQUE")){
	    				ChequeReport chequeReport = new ChequeReport();
	    				JSONObject cheqeuDataJson = new JSONObject(chequeReport.getChequeReport(Integer.parseInt(pdcJson.getString("chequeId"))));
	    				System.out.print(cheqeuDataJson);
	    				
	    				pdcJson =  mergeJson.mergeJSONObjects(cheqeuDataJson, pdcJson);
	    			}
	    			if(pdcJson.has("rtgsId") == true && modeOfPayment.equalsIgnoreCase("RTGS")){
	    				RtgsReport rtgsReport = new RtgsReport();
	    				JSONObject cheqeuDataJson = rtgsReport.rtgsReport(Integer.parseInt(pdcJson.getString("rtgsId")));
	    				pdcJson =  mergeJson.mergeJSONObjects(cheqeuDataJson, pdcJson);
	    			}
	    			mainJsonObj.put("pdcJson", pdcJson);
	    		}
    			out.print(mainJsonObj);
        		out.flush();
	    	}
	    }
    %>
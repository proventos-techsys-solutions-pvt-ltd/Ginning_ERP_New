<%@page import="com.prov.bean.Cheque"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.PaymentReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.PDCReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	AmanatReport amanatReport = new AmanatReport();
	
	JSONArray amanatReportArray = amanatReport.getAmanatDataForExcel(startDate, endDate);
	
	int invoiceId = 0;
	for(int i=0; i<amanatReportArray.length(); i++){
		PaymentReport paymentReport = new PaymentReport();
		 
		invoiceId = Integer.parseInt(amanatReportArray.getJSONObject(i).getString("invoiceId"));
		JSONArray paymentReportArray = paymentReport.getPaymentReport(invoiceId);
		
		for(int j=0; j<paymentReportArray.length(); j++){
			
			if(Integer.parseInt(paymentReportArray.getJSONObject(j).getString("modeId")) == 1){
				amanatReportArray.getJSONObject(i).put("cashAmount", paymentReportArray.getJSONObject(j).getString("amount"));
				amanatReportArray.getJSONObject(i).put("cashPayDate", paymentReportArray.getJSONObject(j).getString("date"));
			}else if(Integer.parseInt(paymentReportArray.getJSONObject(j).getString("modeId")) == 2){
				amanatReportArray.getJSONObject(i).put("chequeAmount", paymentReportArray.getJSONObject(j).getString("amount"));
				if(paymentReportArray.getJSONObject(j).has("chequeId")){
					amanatReportArray.getJSONObject(i).put("chequeId", paymentReportArray.getJSONObject(j).getString("chequeId"));
				}
			}else if(Integer.parseInt(paymentReportArray.getJSONObject(j).getString("modeId")) == 3){
				amanatReportArray.getJSONObject(i).put("rtgsAmount", paymentReportArray.getJSONObject(j).getString("amount"));
				amanatReportArray.getJSONObject(i).put("rtgsPayDate", paymentReportArray.getJSONObject(j).getString("date"));
			}
		}
		
		if(Double.parseDouble(amanatReportArray.getJSONObject(i).getString("pdcAmount")) > 0){
			PDCReport pdcReport = new PDCReport();
			JSONObject pdcReportObj = pdcReport.getPDCJsonData(invoiceId);
			amanatReportArray.getJSONObject(i).put("PDPayDate", pdcReportObj.getString("payDate"));
			amanatReportArray.getJSONObject(i).put("PDPayMode", pdcReportObj.getString("modeOfPayment"));
			if(Integer.parseInt(pdcReportObj.getString("modeOfPayment")) == 2){
				if(pdcReportObj.has("chequeId")){
					amanatReportArray.getJSONObject(i).put("PDCId", pdcReportObj.getString("chequeId"));
				}
			}
		}
		
		if(amanatReportArray.getJSONObject(i).has("chequeId")){
			ChequeReport chequeReport = new ChequeReport();
			Cheque cheque = chequeReport.getChequeReport(Integer.parseInt(amanatReportArray.getJSONObject(i).getString("chequeId")));
			amanatReportArray.getJSONObject(i).put("chequeBank",cheque.getBankName());
			amanatReportArray.getJSONObject(i).put("chequeDate",cheque.getChequeDate());
			amanatReportArray.getJSONObject(i).put("chequeNo",cheque.getChequeNo());
		}
		if(amanatReportArray.getJSONObject(i).has("PDCId")){
			ChequeReport chequeReport = new ChequeReport();
			Cheque cheque = chequeReport.getChequeReport(Integer.parseInt(amanatReportArray.getJSONObject(i).getString("PDCId")));
			amanatReportArray.getJSONObject(i).put("pdcchequeBank",cheque.getBankName());
			amanatReportArray.getJSONObject(i).put("pdcDate",cheque.getChequeDate());
			amanatReportArray.getJSONObject(i).put("pdcNo",cheque.getChequeNo());
		}
		
	}
	
	out.print(amanatReportArray);
	out.flush();
	
%>
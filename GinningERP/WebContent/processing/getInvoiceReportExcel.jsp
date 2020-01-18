<%@page import="com.prov.bean.Cheque"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="com.prov.report.PDCReport"%>
<%@page import="com.prov.report.PaymentReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	InvoiceReport invoiceReport = new InvoiceReport();
	
	JSONArray invoiceReportArray = invoiceReport.invoiceReportToExcel(startDate, endDate);
	int invoiceId = 0;
	for(int i=0; i<invoiceReportArray.length(); i++){
		PaymentReport paymentReport = new PaymentReport();
		 
		invoiceId = Integer.parseInt(invoiceReportArray.getJSONObject(i).getString("invoiceId"));
		JSONArray paymentReportArray = paymentReport.getPaymentReport(invoiceId);
		
		for(int j=0; j<paymentReportArray.length(); j++){
			
			if(Integer.parseInt(paymentReportArray.getJSONObject(j).getString("modeId")) == 1){
				invoiceReportArray.getJSONObject(i).put("cashAmount", paymentReportArray.getJSONObject(j).getString("amount"));
				invoiceReportArray.getJSONObject(i).put("cashPayDate", paymentReportArray.getJSONObject(j).getString("date"));
			}else if(Integer.parseInt(paymentReportArray.getJSONObject(j).getString("modeId")) == 2){
				invoiceReportArray.getJSONObject(i).put("chequeAmount", paymentReportArray.getJSONObject(j).getString("amount"));
				if(paymentReportArray.getJSONObject(j).has("chequeId")){
					invoiceReportArray.getJSONObject(i).put("chequeId", paymentReportArray.getJSONObject(j).getString("chequeId"));
				}
			}else if(Integer.parseInt(paymentReportArray.getJSONObject(j).getString("modeId")) == 3){
				invoiceReportArray.getJSONObject(i).put("rtgsAmount", paymentReportArray.getJSONObject(j).getString("amount"));
				invoiceReportArray.getJSONObject(i).put("rtgsPayDate", paymentReportArray.getJSONObject(j).getString("date"));
			}
		}
		
		if(Double.parseDouble(invoiceReportArray.getJSONObject(i).getString("pdcAmount")) > 0){
			PDCReport pdcReport = new PDCReport();
			JSONObject pdcReportObj = pdcReport.getPDCJsonData(invoiceId);
			invoiceReportArray.getJSONObject(i).put("PDPayDate", pdcReportObj.getString("payDate"));
			invoiceReportArray.getJSONObject(i).put("PDPayMode", pdcReportObj.getString("modeOfPayment"));
			if(Integer.parseInt(pdcReportObj.getString("modeOfPayment")) == 2){
				if(pdcReportObj.has("chequeId")){
					invoiceReportArray.getJSONObject(i).put("PDCId", pdcReportObj.getString("chequeId"));
				}
			}
		}
		
		if(invoiceReportArray.getJSONObject(i).has("chequeId")){
			ChequeReport chequeReport = new ChequeReport();
			Cheque cheque = chequeReport.getChequeReport(Integer.parseInt(invoiceReportArray.getJSONObject(i).getString("chequeId")));
			invoiceReportArray.getJSONObject(i).put("chequeBank",cheque.getBankName());
			invoiceReportArray.getJSONObject(i).put("chequeDate",cheque.getChequeDate());
			invoiceReportArray.getJSONObject(i).put("chequeNo",cheque.getChequeNo());
		}
		if(invoiceReportArray.getJSONObject(i).has("PDCId")){
			ChequeReport chequeReport = new ChequeReport();
			Cheque cheque = chequeReport.getChequeReport(Integer.parseInt(invoiceReportArray.getJSONObject(i).getString("PDCId")));
			invoiceReportArray.getJSONObject(i).put("pdcchequeBank",cheque.getBankName());
			invoiceReportArray.getJSONObject(i).put("pdcDate",cheque.getChequeDate());
			invoiceReportArray.getJSONObject(i).put("pdcNo",cheque.getChequeNo());
		}
		
	}
	
	out.print(invoiceReportArray);
	out.flush();

%>
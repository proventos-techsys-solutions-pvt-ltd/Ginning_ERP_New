<%@page import="com.prov.misc.NumberToWords"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.TransactionReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	int transactionId = Integer.parseInt(request.getParameter("transactionId"));
	
	TransactionReport trReportObj = new TransactionReport();
	
	JSONObject obj = trReportObj.getBankTransactionForPrint(transactionId);
	
	NumberToWords numToWords = new NumberToWords();
	String amountInWords = null;
	if(Double.parseDouble(obj.getString("credit")) > 0){
		amountInWords = numToWords.convertToIndianCurrency(obj.getString("credit"));
	}else if(Double.parseDouble(obj.getString("debit")) > 0){
		amountInWords = numToWords.convertToIndianCurrency(obj.getString("debit"));
	}
	
	obj.put("amountInWords", amountInWords);
	
	out.print(obj);
	out.flush();
			

%>
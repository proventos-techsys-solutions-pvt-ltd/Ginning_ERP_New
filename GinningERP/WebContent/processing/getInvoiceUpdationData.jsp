<%@page import="com.prov.report.PaymentReport"%>
<%@page import="com.prov.dbops.CheckInvoiceExists"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String invoiceNo = request.getParameter("invoiceNo").toUpperCase().trim(); 
	
	CheckInvoiceExists checkInvoice = new CheckInvoiceExists();
	
	int invoiceFlag = 0;
	
	invoiceFlag = checkInvoice.invoiceExistsCheck(invoiceNo);
	
	JSONObject obj = null;

	if(invoiceFlag > 0){

		InvoiceReport report = new InvoiceReport();
		PaymentReport payReport = new PaymentReport();
		obj = report.getInvoiceDataForUpdation(invoiceNo);
		obj.put("paymentDetails",payReport.getPaymentReport(obj.getInt("invoiceId")));
		out.println(obj);
		out.flush();
		
	}else{
		out.println(0);
		out.flush();
	}
%>
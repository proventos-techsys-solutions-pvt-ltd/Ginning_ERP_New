<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.prov.bean.Cheque"%>
<%@page import="com.prov.report.ChequeReport"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int invoiceId = Integer.parseInt((String)request.getParameter("invoiceId"));

InvoiceReport invReport = new InvoiceReport();

org.json.JSONObject printObj = invReport.getInvoiceForPrinting(invoiceId);
if(printObj.has("chequeId")){
	ChequeReport chqRep = new ChequeReport();
	Cheque chqJson =chqRep.getChequeReport(Integer.parseInt(printObj.getString("chequeId")));
	printObj.put("chequeNo", chqJson.getChequeNo());
	Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(chqJson.getChequeDate());
	SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy");
	String properDate = format2.format(date1);
	
	
	printObj.put("chequeDate", properDate);
}else{
	printObj.put("chequeNo", "");
	printObj.put("chequeDate", "");
}
if(printObj.has("pdcId")){
	ChequeReport chqRep = new ChequeReport();
	Cheque chqJson =chqRep.getChequeReport(Integer.parseInt(printObj.getString("pdcId")));
	printObj.put("pdcNo", chqJson.getChequeNo());
}else{
	printObj.put("pdcNo", "");
}

out.print(printObj);
out.flush();

%>
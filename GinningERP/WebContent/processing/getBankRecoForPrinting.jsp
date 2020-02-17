<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.TransactionReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	int bankId = Integer.parseInt(request.getParameter("bankId"));
	int companyId = Integer.parseInt(request.getParameter("companyId"));
	String date = request.getParameter("date");
	
	TransactionReport trReportObj = new TransactionReport();
	JSONArray arr = trReportObj.getBankTransactionForRecoPrint(companyId, bankId, date);
	
	double closingBal = trReportObj.getClosingBalForLedger(bankId, companyId, date);
	double closingBalBank = trReportObj.getClosingBalForBankReco(bankId, companyId, date);
	
	JSONObject obj = new JSONObject();
	
	obj.put("closingBalance", closingBal);
	obj.put("closingBalanceBank", closingBalBank);
	
	Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(date);
	SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
	String properDate = format2.format(date1);
	
	obj.put("date", properDate);
	obj.put("array", arr);
	
	out.print(obj);
	out.flush();

%>
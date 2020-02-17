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
    	
    	String firstRecoDate=trReportObj.getFirstRecoDate(bankId, companyId);
    	
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date firstRecoDateObj = sdf.parse(firstRecoDate);
        Date selectedDateobj = sdf.parse(date);
         
         if(selectedDateobj.compareTo(firstRecoDateObj) > 0 || selectedDateobj.compareTo(firstRecoDateObj) == 0){
        	 JSONArray arr = trReportObj.getBankTransactionForReco(companyId, bankId, date);
         	
         	double closingBal = trReportObj.getClosingBalForLedger(bankId, companyId, date);
         	
         	double closingBalBank = trReportObj.getClosingBalForBankReco(bankId, companyId, date);
         	
         	String lastRecoDate = trReportObj.getLastRecoDate(bankId, companyId);
         	
         	JSONObject obj = new JSONObject();
         	
         	obj.put("closingBalance", closingBal);
         	obj.put("closingBankBalance", closingBalBank);
         	obj.put("lastRecoDate", lastRecoDate);
         	
         	obj.put("array", arr);
         	
         	out.print(obj);
         	out.flush();
         }else{
        	 out.print(0);
          	out.flush();
         }
    	
    	
    	
    %>
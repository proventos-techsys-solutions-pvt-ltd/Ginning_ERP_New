<%@page import="com.prov.misc.MergeJSON"%>
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
    	
    	String firstRecoDate = trReportObj.getFirstRecoDate(bankId, companyId);
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date firstRecoDateObj = sdf.parse(firstRecoDate);
        Date selectedDateobj = sdf.parse(date);
        
        JSONArray arr = new JSONArray();
         
         if(selectedDateobj.compareTo(firstRecoDateObj) > 0 || selectedDateobj.compareTo(firstRecoDateObj) == 0){
        	 String latestRecoDate = trReportObj.getLastRecoDate(bankId, companyId);
        	 
        	 if(latestRecoDate != "NA"){
        		 SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
                 Date latestDateFormat = sdf1.parse(latestRecoDate);
                 String latestDateStr = sdf.format(latestDateFormat);
            	 Date latestRecoDateObj = sdf.parse(latestDateStr);
            	 
            	 if(latestRecoDateObj.compareTo(selectedDateobj) < 0){
            		  arr = trReportObj.getOnlyUnrecoBankTransaction(companyId, bankId, date);
            	 }else if(latestRecoDateObj.compareTo(selectedDateobj) >= 0){
            		  arr = trReportObj.getBankTransactionForReco(companyId, bankId, date);
            	 } 
        	 }else{
        		  arr = trReportObj.getOnlyUnrecoBankTransaction(companyId, bankId, date);
        	 }

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
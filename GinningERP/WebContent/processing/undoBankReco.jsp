<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.prov.report.TransactionReport"%>
<%@page import="com.prov.report.BankRecoReport"%>
<%@page import="com.prov.dbinsertion.AddRecoDetails"%>
<%@page import="com.prov.bean.RecoDetails"%>
<%@page import="com.prov.bean.BankRecoMaster"%>
<%@page import="com.prov.dbinsertion.AddBankRecoMaster"%>
<%@page import="com.prov.delete.DeleteBankReco"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	String jsonData = request.getParameter("output");
	
	System.out.println(jsonData);
	
	JSONParser parser = new JSONParser();
	
	JSONObject parentObj = (JSONObject)parser.parse(jsonData);
	
	BankRecoReport bankRecoReport = new BankRecoReport();
	DeleteBankReco delBankRecoObj = new DeleteBankReco();
	TransactionReport trReportObj = new TransactionReport();
	
	int delBankRecoId = 0;
	
	int bankId = Integer.parseInt((String)parentObj.get("bankId"));
	int companyId = Integer.parseInt((String)parentObj.get("companyId"));
	String recoDate = (String)parentObj.get("recoDate");

	String latestRecoDate = trReportObj.getLastRecoDate(bankId, companyId);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date latestRecoDateObj = sdf.parse(latestRecoDate);
    Date selectedDateobj = sdf.parse(recoDate);
	
	int recoCount = bankRecoReport.getRecoCount(bankId, companyId, recoDate);
	
	if(latestRecoDateObj.compareTo(selectedDateobj) < 0){
		delBankRecoId = -2;		
	}else if(latestRecoDateObj.compareTo(selectedDateobj) == 0){
		
		delBankRecoId = delBankRecoObj.deleteBankRecoEntry(bankId, companyId, recoDate);
		
	}else if(latestRecoDateObj.compareTo(selectedDateobj) > 0){
		delBankRecoId = -3;
	}
	
	session.setAttribute("recoId", Integer.toString(delBankRecoId));
	response.sendRedirect("../admin/BankReconciliation.jsp");
		
		
	

%>    

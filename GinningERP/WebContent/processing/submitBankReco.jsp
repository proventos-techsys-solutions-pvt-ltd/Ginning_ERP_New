<%@page import="com.prov.dbinsertion.AddRecoDetails"%>
<%@page import="com.prov.bean.RecoDetails"%>
<%@page import="com.prov.bean.BankRecoMaster"%>
<%@page import="com.prov.dbinsertion.AddBankRecoMaster"%>
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
	
	JSONArray recoDetails = (JSONArray)parentObj.get("recoDetails");
	
	AddBankRecoMaster addBankRecoObj = new AddBankRecoMaster();
	
	BankRecoMaster br = new BankRecoMaster();
	
	br.setCompanyId(Long.parseLong((String)parentObj.get("companyId")));
	br.setBankId(Long.parseLong((String)parentObj.get("bankId")));
	br.setBankGlId(Long.parseLong((String)parentObj.get("bankGlId")));
	br.setClosingBalBank(Double.parseDouble((String)parentObj.get("closingBankBal")));
	br.setClosingBalLedger(Double.parseDouble((String)parentObj.get("closingGlBal")));
	br.setDate((String)parentObj.get("recoDate"));
	
	
	int bankRecoId = addBankRecoObj.addBankRecoMaster(br);
	
	if(bankRecoId>0){
		for(int i=0; i<recoDetails.size(); i++){
			
			JSONObject rdJson = (JSONObject)recoDetails.get(i);
			RecoDetails rd = new RecoDetails();
			
			rd.setRecoId(bankRecoId);
			rd.setTransactionId(Long.parseLong((String)rdJson.get("transactionId")));
			rd.setVoucherNo(Long.parseLong((String)rdJson.get("voucherNo")));
			
			AddRecoDetails addRecoDetails = new AddRecoDetails();
			
			addRecoDetails.addRecoDetails(rd);
		}
	}
	
	session.setAttribute("recoId", Integer.toString(bankRecoId));
	response.sendRedirect("../admin/BankReconciliation.jsp");
	
%>
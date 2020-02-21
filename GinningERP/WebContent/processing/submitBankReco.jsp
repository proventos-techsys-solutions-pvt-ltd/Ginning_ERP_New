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
	
	JSONArray recoDetails = (JSONArray)parentObj.get("recoDetails");
	
	BankRecoReport bankRecoReport = new BankRecoReport();
	DeleteBankReco delBankRecoObj = new DeleteBankReco();
	TransactionReport trReportObj = new TransactionReport();
	
	int bankRecoId = 0;
	
	int bankId = Integer.parseInt((String)parentObj.get("bankId"));
	int companyId = Integer.parseInt((String)parentObj.get("companyId"));
	String recoDate = (String)parentObj.get("recoDate");

	String latestRecoDate = trReportObj.getLastRecoDate(bankId, companyId);
	
	if(latestRecoDate != "NA"){
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		
		Date latestDateFormat = sdf1.parse(latestRecoDate);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String latestDateStr = sdf.format(latestDateFormat);
	    Date latestRecoDateObj = sdf.parse(latestDateStr);
	    Date selectedDateobj = sdf.parse(recoDate);
		
		int recoCount = bankRecoReport.getRecoCount(bankId, companyId, recoDate);
		
		if(latestRecoDateObj.compareTo(selectedDateobj) < 0){
			AddBankRecoMaster addBankRecoObj = new AddBankRecoMaster();
			
			BankRecoMaster br = new BankRecoMaster();
			
			br.setCompanyId(Long.parseLong((String)parentObj.get("companyId")));
			br.setBankId(Long.parseLong((String)parentObj.get("bankId")));
			br.setBankGlId(Long.parseLong((String)parentObj.get("bankGlId")));
			br.setClosingBalBank(Double.parseDouble((String)parentObj.get("closingBankBal")));
			br.setClosingBalLedger(Double.parseDouble((String)parentObj.get("closingGlBal")));
			br.setDate((String)parentObj.get("recoDate"));
			
			bankRecoId = addBankRecoObj.addBankRecoMaster(br);
			
			if(bankRecoId>0){
				for(int i=0; i<recoDetails.size(); i++){
					
					JSONObject rdJson = (JSONObject)recoDetails.get(i);
					RecoDetails rd = new RecoDetails();
					
					rd.setRecoId(bankRecoId);
					rd.setTransactionId(Long.parseLong((String)rdJson.get("transactionId")));
					rd.setVoucherNo(Long.parseLong((String)rdJson.get("voucherNo")));
					rd.setRecoDate((String)parentObj.get("recoDate"));
					
					AddRecoDetails addRecoDetails = new AddRecoDetails();
					
					addRecoDetails.addRecoDetails(rd);
				}
			}
		}else if(latestRecoDateObj.compareTo(selectedDateobj) == 0){
			int delBankRecoId = delBankRecoObj.deleteBankRecoEntry(bankId, companyId, recoDate);
			
			if(delBankRecoId>0){
				AddBankRecoMaster addBankRecoObj = new AddBankRecoMaster();
				
				BankRecoMaster br = new BankRecoMaster();
				
				br.setCompanyId(Long.parseLong((String)parentObj.get("companyId")));
				br.setBankId(Long.parseLong((String)parentObj.get("bankId")));
				br.setBankGlId(Long.parseLong((String)parentObj.get("bankGlId")));
				br.setClosingBalBank(Double.parseDouble((String)parentObj.get("closingBankBal")));
				br.setClosingBalLedger(Double.parseDouble((String)parentObj.get("closingGlBal")));
				br.setDate((String)parentObj.get("recoDate"));
				
				bankRecoId = addBankRecoObj.addBankRecoMaster(br);
				
				if(bankRecoId>0){
					for(int i=0; i<recoDetails.size(); i++){
						
						JSONObject rdJson = (JSONObject)recoDetails.get(i);
						RecoDetails rd = new RecoDetails();
						
						rd.setRecoId(bankRecoId);
						rd.setTransactionId(Long.parseLong((String)rdJson.get("transactionId")));
						rd.setVoucherNo(Long.parseLong((String)rdJson.get("voucherNo")));
						rd.setRecoDate((String)parentObj.get("recoDate"));
						
						AddRecoDetails addRecoDetails = new AddRecoDetails();
						
						addRecoDetails.addRecoDetails(rd);
					}
				}
			}
		}else if(latestRecoDateObj.compareTo(selectedDateobj) > 0){
			bankRecoId = -1;
		}
	}else{
		AddBankRecoMaster addBankRecoObj = new AddBankRecoMaster();
		
		BankRecoMaster br = new BankRecoMaster();
		
		br.setCompanyId(Long.parseLong((String)parentObj.get("companyId")));
		br.setBankId(Long.parseLong((String)parentObj.get("bankId")));
		br.setBankGlId(Long.parseLong((String)parentObj.get("bankGlId")));
		br.setClosingBalBank(Double.parseDouble((String)parentObj.get("closingBankBal")));
		br.setClosingBalLedger(Double.parseDouble((String)parentObj.get("closingGlBal")));
		br.setDate((String)parentObj.get("recoDate"));
		
		bankRecoId = addBankRecoObj.addBankRecoMaster(br);
		
		if(bankRecoId>0){
			for(int i=0; i<recoDetails.size(); i++){
				
				JSONObject rdJson = (JSONObject)recoDetails.get(i);
				RecoDetails rd = new RecoDetails();
				
				rd.setRecoId(bankRecoId);
				rd.setTransactionId(Long.parseLong((String)rdJson.get("transactionId")));
				rd.setVoucherNo(Long.parseLong((String)rdJson.get("voucherNo")));
				rd.setRecoDate((String)parentObj.get("recoDate"));
				
				AddRecoDetails addRecoDetails = new AddRecoDetails();
				
				addRecoDetails.addRecoDetails(rd);
			}
		}
	}
	session.setAttribute("recoId", Integer.toString(bankRecoId));
	response.sendRedirect("../admin/BankReconciliation.jsp");

%>    

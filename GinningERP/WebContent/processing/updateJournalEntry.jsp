<%@page import="com.prov.delete.DeleteTransaction"%>
<%@page import="com.prov.dbinsertion.AddTransactions"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.prov.bean.Transactions"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%
 	 String data =request.getParameter("data");
 
	 System.out.println(data);
 	
 	JSONParser parser = new JSONParser();
	
	JSONArray dataArr = (JSONArray)parser.parse(data);
	
	int voucherNo = Integer.parseInt((String)((JSONObject)dataArr.get(1)).get("voucherNo"));
	
	DeleteTransaction deleteTransObj = new DeleteTransaction();
	
	int delVoucherNo = deleteTransObj.deleteTransaction(voucherNo);
	int count=1;
	int[] ids = new int[dataArr.size()];
	
	if(delVoucherNo == voucherNo){
		AddTransactions addTransactions = new AddTransactions();
		for(int i=0; i<dataArr.size(); i++){
			
			JSONObject obj = (JSONObject)dataArr.get(i);
			Transactions tr = new Transactions();
			
			tr.setVouchNo(Integer.parseInt((String)obj.get("voucherNo")));
			tr.setAccountId(Integer.parseInt((String)obj.get("accountId")));
			tr.setTransactionDate((String)obj.get("transactionDate"));
			tr.setVouchRef((String)obj.get("voucherReference"));
			tr.setNarration((String)obj.get("description"));
			tr.setContactId(null);
			tr.setCredit(Double.parseDouble((String)obj.get("credit")));
			tr.setDebit(Double.parseDouble((String)obj.get("debit")));
			tr.setTransactionType("JOURNAL");
			ids[i] = addTransactions.addTransactions(tr);
			if(ids[i]==0){
				count=0;
			}
		}
	}else{
		count=0;
	}
	
	session.setAttribute("transactionId", Integer.toString(count));
	response.sendRedirect("../accounts/JournalEntry.jsp");

 %>
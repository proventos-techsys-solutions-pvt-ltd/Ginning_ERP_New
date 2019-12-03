<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.prov.dbupdation.UpdateRtgs"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.prov.dbops.VoucherSeries"%>
<%@page import="com.prov.dbinsertion.AddTransactions"%>
<%@page import="com.prov.report.AccountNameReport"%>
<%@page import="com.prov.bean.Transactions"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String output = request.getParameter("output");

	JSONParser parser = new JSONParser();
	
	JSONArray jsonArr = (JSONArray)parser.parse(output);
	System.out.print(jsonArr);
	AccountNameReport anr = new AccountNameReport();
	UpdateRtgs updateRtgs = new UpdateRtgs();
	VoucherSeries vs = new VoucherSeries();
	int debitId = 0;
	int creditId = 0;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date todaysDate = new Date();
	String dateStr = sdf.format(todaysDate);
	
	for(int i=0; i<jsonArr.size(); i++){
		JSONObject obj = (JSONObject)jsonArr.get(i);
		
		int accountPayableId = anr.getAccountsPayableId(Integer.parseInt((String)obj.get("companyId")));
		int bankAccountId = anr.getAccountId(Integer.parseInt((String)obj.get("companyId")), Integer.parseInt((String)obj.get("bankId")));
		
		int voucherNo = vs.getVoucherNo();
		
		Transactions rtgsTrDb = new Transactions();
		rtgsTrDb.setAccountId(accountPayableId);
		rtgsTrDb.setContactId((String)obj.get("customerId"));
		rtgsTrDb.setDebit(Long.parseLong((String)obj.get("rtgsAmount")));
		rtgsTrDb.setCredit(0);
		rtgsTrDb.setTransactionDate(dateStr);
		rtgsTrDb.setNarration("RAW COTTON PURCHASE - "+(String)obj.get("invoiceNo"));
		rtgsTrDb.setVouchRef("RAW COTTON - "+(String)obj.get("invoiceNo"));
		rtgsTrDb.setVouchNo(voucherNo);
		
		Transactions rtgsTrCr = new Transactions();
		rtgsTrCr.setAccountId(bankAccountId);
		rtgsTrCr.setContactId((String)obj.get("customerId"));
		rtgsTrCr.setDebit(0);
		rtgsTrCr.setCredit(Long.parseLong((String)obj.get("rtgsAmount")));
		rtgsTrCr.setTransactionDate(dateStr);
		rtgsTrCr.setNarration("RAW COTTON PURCHASE - "+(String)obj.get("invoiceNo"));
		rtgsTrCr.setVouchRef("RAW COTTON - "+(String)obj.get("invoiceNo"));
		rtgsTrCr.setVouchNo(voucherNo);
		
		AddTransactions addTr = new AddTransactions();
		
		debitId = addTr.addTransactions(rtgsTrDb);
		creditId = addTr.addTransactions(rtgsTrCr);
		
		updateRtgs.addVoucherRtgs(voucherNo, Integer.parseInt((String)obj.get("rtgsId")));
		
		if(debitId == 0 || creditId == 0){
			break;
		}
	}	
	if(debitId == 0 || creditId == 0){
		session.setAttribute("successId",0);
		response.sendRedirect("../admin/PostPayments.jsp");
	}else if(debitId > 0 && creditId > 0){
		session.setAttribute("successId",1);
		System.out.print(session.getAttribute("successId"));
		response.sendRedirect("../admin/PostPayments.jsp");
	}
%>
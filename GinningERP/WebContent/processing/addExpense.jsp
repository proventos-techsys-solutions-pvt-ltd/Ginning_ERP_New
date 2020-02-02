<%@page import="com.prov.dbinsertion.AddCheque"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.BankReport"%>
<%@page import="com.prov.bean.Cheque"%>
<%@page import="com.prov.dbinsertion.AddTransactions"%>
<%@page import="com.prov.bean.Transactions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
	    String date = request.getParameter("date").toUpperCase();
		String reference = request.getParameter("voucherReference").toUpperCase();
		int voucherNo = Integer.parseInt(request.getParameter("voucherNo"));
		int debitAccountId = Integer.parseInt(request.getParameter("accountId"));
		String description = request.getParameter("description").toUpperCase();
		double amount = Double.parseDouble(request.getParameter("amount"));
		int creditAccountId = Integer.parseInt(request.getParameter("paymentMode"));
		String contactId = request.getParameter("payee").toUpperCase();
		String chequeNo = request.getParameter("chequeNo");
		
		
		System.out.println("chequeNo---"+chequeNo);
		Transactions debitTransaction = new Transactions();
		
		debitTransaction.setNarration(description);
		debitTransaction.setVouchRef(reference);
		debitTransaction.setAccountId(debitAccountId);
		debitTransaction.setVouchNo(voucherNo);
		debitTransaction.setTransactionDate(date);
		debitTransaction.setDebit(Math.round(amount));
		debitTransaction.setCredit(0);
		debitTransaction.setContactId(contactId);
		
		Transactions creditTransaction = new Transactions();
		
		creditTransaction.setNarration(description);
		creditTransaction.setVouchRef(reference);
		creditTransaction.setAccountId(creditAccountId);
		creditTransaction.setVouchNo(voucherNo);
		creditTransaction.setTransactionDate(date);
		creditTransaction.setDebit(0);
		creditTransaction.setCredit(Math.round(amount));
		creditTransaction.setContactId(contactId);
		
		System.out.println(debitTransaction.toString());
		System.out.println(creditTransaction.toString());
		
		AddTransactions addTrans = new AddTransactions();
		
		int debitId=addTrans.addTransactions(debitTransaction);
		int creditId=addTrans.addTransactions(creditTransaction);
		
		if(debitId!=0 && creditId!=0){
			if(chequeNo != "" && chequeNo != null){
				
				BankReport br = new BankReport();
				
				JSONObject bankData = br.getBankFromAccountId(creditAccountId);
				
				Cheque cheque = new Cheque();
				
				cheque.setBankId(Integer.parseInt((String)bankData.get("bankId")));
				cheque.setBankName((String)bankData.get("bankName"));
				cheque.setChequeAmount(Math.round(amount));
				cheque.setChequeDate(date);
				cheque.setCustomerName(contactId);
				cheque.setStatus(0);
				cheque.setChequePaymentStatus(0);
				cheque.setVoucherNo(voucherNo);
				cheque.setChequeNo(chequeNo);
				
				AddCheque addChequeObj =new AddCheque();
				
				addChequeObj.addCheque(cheque);
			}
		}
		int expenseId=0;
		if(debitId==0 || creditId==0){
			expenseId=0;
		}else{
			expenseId=1;
		}
		
		session.setAttribute("expenseId", Integer.toString(expenseId));
		response.sendRedirect("../accounts/Record_Expenses.jsp");
    %>
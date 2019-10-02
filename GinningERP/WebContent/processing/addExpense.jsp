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
		
		Transactions debitTransaction = new Transactions();
		
		debitTransaction.setNarration(description);
		debitTransaction.setVouchRef(reference);
		debitTransaction.setAccountId(debitAccountId);
		debitTransaction.setVouchNo(voucherNo);
		debitTransaction.setTransactionDate(date);
		debitTransaction.setDebit(amount);
		debitTransaction.setCredit(0);
		debitTransaction.setContactId(null);
		
		Transactions creditTransaction = new Transactions();
		
		creditTransaction.setNarration(description);
		creditTransaction.setVouchRef(reference);
		creditTransaction.setAccountId(creditAccountId);
		creditTransaction.setVouchNo(voucherNo);
		creditTransaction.setTransactionDate(date);
		creditTransaction.setDebit(0);
		creditTransaction.setCredit(amount);
		creditTransaction.setContactId(null);
		
		AddTransactions addTrans = new AddTransactions();
		
		addTrans.addTransactions(debitTransaction);
		addTrans.addTransactions(creditTransaction);
		
		response.sendRedirect("../admin/Record_Expenses.jsp");
    %>
<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.bean.Transactions"%>
<%@page import="com.prov.dbinsertion.AddTransactions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    String bankAddDate = request.getParameter("addBankDate").toUpperCase();
	String reference = request.getParameter("addBankReference").toUpperCase();
	int voucherNo = Integer.parseInt(request.getParameter("addBankVoucher"));
	int debitAccountId = Integer.parseInt(request.getParameter("addBankAccountId"));
	String description = request.getParameter("addBankDesc").toUpperCase();
	double amount = Double.parseDouble(request.getParameter("addBankAmount"));
	int creditAccountId = Integer.parseInt(request.getParameter("addBankMode"));
	
	Transactions debitTransaction = new Transactions();
	
	debitTransaction.setNarration(description);
	debitTransaction.setVouchRef(reference);
	debitTransaction.setAccountId(debitAccountId);
	debitTransaction.setVouchNo(voucherNo);
	debitTransaction.setTransactionDate(bankAddDate);
	debitTransaction.setDebit(amount);
	debitTransaction.setCredit(0);
	debitTransaction.setContactId(null);
	debitTransaction.setTransactionType("JOURNAL");
	
	Transactions creditTransaction = new Transactions();
	
	creditTransaction.setNarration(description);
	creditTransaction.setVouchRef(reference);
	creditTransaction.setAccountId(creditAccountId);
	creditTransaction.setVouchNo(voucherNo);
	creditTransaction.setTransactionDate(bankAddDate);
	creditTransaction.setDebit(0);
	creditTransaction.setCredit(amount);
	creditTransaction.setContactId(null);
	creditTransaction.setTransactionType("JOURNAL");
	
	AddTransactions addTrans = new AddTransactions();
	
	addTrans.addTransactions(debitTransaction);
	addTrans.addTransactions(creditTransaction);
	
	response.sendRedirect("../admin/Daily_Setup.jsp");
    
    %>
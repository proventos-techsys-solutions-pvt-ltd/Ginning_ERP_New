<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddTransactions"%>
<%@page import="com.prov.bean.Transactions"%>
<%@page import="com.prov.bean.GeneralLedger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
		String cashAddDate = request.getParameter("addCashDate").toUpperCase();
    	String reference = request.getParameter("addCashReference").toUpperCase();
    	int voucherNo = Integer.parseInt(request.getParameter("addCashVoucher"));
    	int debitAccountId = Integer.parseInt(request.getParameter("addCashAccount"));
    	String description = request.getParameter("addCashDescription").toUpperCase();
    	double amount = Double.parseDouble(request.getParameter("addCashAmount"));
    	int creditAccountId = Integer.parseInt(request.getParameter("addCashMode"));
    	
    	Transactions debitTransaction = new Transactions();
    	
    	debitTransaction.setNarration(description);
    	debitTransaction.setVouchRef(reference);
    	debitTransaction.setAccountId(debitAccountId);
    	debitTransaction.setVouchNo(voucherNo);
    	debitTransaction.setTransactionDate(cashAddDate);
    	debitTransaction.setDebit(amount);
    	debitTransaction.setCredit(0);
    	debitTransaction.setContactId(null);
    	debitTransaction.setTransactionType("JOURNAL");
    	
		Transactions creditTransaction = new Transactions();
    	
		creditTransaction.setNarration(description);
		creditTransaction.setVouchRef(reference);
		creditTransaction.setAccountId(creditAccountId);
		creditTransaction.setVouchNo(voucherNo);
		creditTransaction.setTransactionDate(cashAddDate);
		creditTransaction.setDebit(0);
		creditTransaction.setCredit(amount);
		creditTransaction.setContactId(null);
		creditTransaction.setTransactionType("JOURNAL");
    	
		AddTransactions addTrans = new AddTransactions();
		
		addTrans.addTransactions(debitTransaction);
		addTrans.addTransactions(creditTransaction);
		
		response.sendRedirect("../admin/Daily_Setup.jsp");
    	
    %>
<%@page import="com.prov.dbinsertion.AddCreditEntry"%>
<%@page import="com.prov.dbinsertion.AddDebitEntry"%>
<%@page import="com.prov.bean.CreditVoucher"%>
<%@page import="com.prov.bean.DebitVoucher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	int companyId = Integer.parseInt(request.getParameter("companyId"));
    	String date = request.getParameter("date");
    	String voucherNo = request.getParameter("voucherNo").toUpperCase();
    	String reference = request.getParameter("voucherReference").toUpperCase();
    	int accountId = Integer.parseInt(request.getParameter("accountId"));
    	String description = request.getParameter("description").toUpperCase();
    	double amount = Double.parseDouble(request.getParameter("amount"));
    	int paymentMode = Integer.parseInt(request.getParameter("paymentMode"));
    	
    	DebitVoucher debit = new DebitVoucher();
    	
    	debit.setCompanyId(companyId);
    	debit.setVoucherDate(date);
    	debit.setVoucherNo(voucherNo);
    	debit.setVoucherRef(reference);
    	debit.setAccountNameId(accountId);
    	debit.setDescription(description);
    	debit.setDebitAmount(amount);
    	debit.setPreparedBy("TEST");
    	debit.setAuthorizedBy("TEST");
		debit.setFinancialYear("2019-2020");
    	
    	AddDebitEntry debitEntry = new AddDebitEntry();
    	
    	CreditVoucher credit = new CreditVoucher();
    	
    	credit.setCompanyId(companyId);
    	credit.setVoucherDate(date);
    	credit.setVoucherNo(voucherNo);
    	credit.setVoucherRef(reference);
    	credit.setAccountNameId(paymentMode);
    	credit.setDescription(description);
    	credit.setCreditAmount(amount);
    	credit.setPreparedBy("TEST");
    	credit.setAuthorizedBy("TEST");
    	credit.setFinancialYear("2019-2020");
    	
    	AddCreditEntry creditEntry = new AddCreditEntry();
    	
    	debitEntry.addDebitEntry(debit);
    	
    	creditEntry.addCreditEntry(credit);
    	
    	response.sendRedirect("../views/RecordExpenses.jsp");
    	
    %>
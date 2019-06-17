<%@page import="com.prov.bean.AccountName"%>
<%@page import="com.prov.dbinsertion.AddAccountName"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	System.out.println(request.getParameter("company"));
	int companyId = Integer.parseInt(request.getParameter("company"));
 	int accountType = Integer.parseInt(request.getParameter("accountType"));
 	String accountName = request.getParameter("accountName").toUpperCase();
 	String  description = request.getParameter("description").toUpperCase();
 	float openingBalance = Float.parseFloat(request.getParameter("openingBalance"));
 	
 	AddAccountName obj = new AddAccountName();
 	
 	AccountName account = new AccountName();
 	
 	account.setCompanyId(companyId);
 	account.setAccountCategoryId(accountType);
 	account.setAccountName(accountName);
 	account.setOpeningBalance(openingBalance);
 	
 	obj.addAccountName(account);
 	
 	response.sendRedirect("../views/ChartOfAccounts.jsp");		
 	
%>
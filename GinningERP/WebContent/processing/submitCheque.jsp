<%@page import="com.prov.bean.Cheque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	
	double chequeAmt = Double.parseDouble(request.getParameter("chequeAmt"));
	int chequeBank = Integer.parseInt(request.getParameter("chequeBank"));
	long chequeNo = Long.parseLong(request.getParameter("chequeNo"));
	String chequeDate = request.getParameter("chequeDate");
	String chequeName = request.getParameter("chequeName").toUpperCase();
	
	Cheque cheque = new Cheque();
	
	cheque.setBankId(chequeBank);
	cheque.setBankName(bankName);
	cheque.setChequeAmount(chequeAmt);
	cheque.setChequeDate(chequeDate);
	cheque.setChequeNo(chequeNo);
	cheque.setCustomerId(customerId);
	cheque.setCustomerName(customerName);
	cheque.setId(id);
	cheque.setInvoiceNo(invoiceNo);
	
%>
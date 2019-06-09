<%@page import="com.prov.dbupdation.UpdateInvoice"%>
<%@page import="com.prov.bean.Invoice"%>
<%@page import="com.prov.bean.Amanat"%>
<%@page import="com.prov.dbupdation.UpdateAmanat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	int id = Integer.parseInt(request.getParameter("id"));
	String invoiceNo = request.getParameter("invoiceNo").toUpperCase();
	Double finalRate = Double.parseDouble(request.getParameter("rate"));
	Double amountPaid = Double.parseDouble(request.getParameter("advance"));
	Double pending = Double.parseDouble(request.getParameter("net"));
	Double totalWeight = Double.parseDouble(request.getParameter("quantity"));
		
	if(id == 0 || invoiceNo == "" || invoiceNo == null || finalRate == 0 || finalRate == null || amountPaid == 0 || amountPaid == null
	   || pending == 0 || pending == null || totalWeight == 0 || totalWeight == null)
	{
		out.println("Please enter valid information.");
	}
	else{
		
	Invoice i = new Invoice();
	
	i.setId(id);
	i.setInvoiceNo(invoiceNo);
	i.setFinalRate(finalRate);
	i.setAmountPaid(amountPaid);
	i.setPending(pending);
	i.setTotal(finalRate*totalWeight);
	
	UpdateInvoice ui =new UpdateInvoice();
	
	ui.updateRate(i);
	
	response.sendRedirect("../views/Invoice.jsp");
	}
%>
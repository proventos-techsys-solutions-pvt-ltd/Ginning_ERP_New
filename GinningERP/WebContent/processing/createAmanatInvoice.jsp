<%@page import="com.prov.dbupdation.UpdateInvoice"%>
<%@page import="com.prov.bean.Invoice"%>
<%@page import="com.prov.bean.Amanat"%>
<%@page import="com.prov.dbupdation.UpdateAmanat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    	
    	int id = Integer.parseInt(request.getParameter("id"));
		double finalRate = Double.parseDouble(request.getParameter("finalRate"));
		double total = Double.parseDouble(request.getParameter("total"));
		double amountPaid = Double.parseDouble(request.getParameter("amountPaid"));
		double pending = Double.parseDouble(request.getParameter("pending"));
		String invoiceNo = request.getParameter("invoiceNo");
		int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
		String date = request.getParameter("date");
		
		
		Amanat a = new Amanat();
		a.setId(id);
		a.setFinalRate(finalRate);
		
		Invoice i = new Invoice();
		
		i.setId(invoiceId);
		i.setFinalRate(finalRate);
		i.setTotal(total);
		i.setAmountPaid(amountPaid);
		i.setPending(pending);
		i.setInvoiceNo(invoiceNo);
		i.setInvDate(date);
		
		UpdateAmanat ua = new UpdateAmanat();
		
		ua.setFinalRate(a);
		
		UpdateInvoice ui = new UpdateInvoice();
		
		ui.createAmanatInvoice(i);
		
		response.sendRedirect("../views/PendingAmanatInvoices.jsp");
		
    
    %>
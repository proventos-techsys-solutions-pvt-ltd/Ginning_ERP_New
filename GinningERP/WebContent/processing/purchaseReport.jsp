<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.report.PurchaseReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 

    String paymentType = request.getParameter("paymentType");
    int companyId = Integer.parseInt(request.getParameter("companyId"));
    
    double amount = 0;
    
	PurchaseReport pr = new PurchaseReport();
    
	if(companyId==0){
		switch(paymentType)
		{
		case "cash":
			amount = pr.getCashReport();
			break;
		case "cheque":
			amount = pr.getChequeReport();
			break;
		case "pdc":
			amount = pr.getPdcReport();
			break;
		case "rtgs":
			amount = pr.getRtgsReport();
			break;
		case "all":
			amount = pr.getTotalPurchase();
			break;
		}
	}else if(companyId>0){
		switch(paymentType)
		{
		case "cash":
			amount = pr.getCashReport(companyId);
			break;
		case "cheque":
			amount = pr.getChequeReport(companyId);	
			break;
		case "pdc":
			amount = pr.getPdcReport(companyId);
			break;
		case "rtgs":
			amount = pr.getRtgsReport(companyId);			
			break;
		case "all":
			amount = pr.getTotalPurchase(companyId);
			break;
		}
	}
    
    out.println(amount);
    out.flush();
    
    %>
<%@page import="com.prov.dbupdation.UpdateGeneralLedger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	
    	int accountId = Integer.parseInt(request.getParameter("accountId"));
    	double openingBal = Double.parseDouble(request.getParameter("openingBal"));
    	
    	UpdateGeneralLedger update = new UpdateGeneralLedger();
    	
    	int rows = update.updateOpeningBal(openingBal, accountId);
    	
    	response.sendRedirect("../views/ChartOfAccounts.jsp");
    
    %>
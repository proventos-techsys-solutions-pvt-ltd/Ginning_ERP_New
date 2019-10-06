<%@page import="com.prov.dbinsertion.AddAccountName"%>
<%@page import="com.prov.bean.AccountName"%>
<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddGeneralLedger"%>
<%@page import="com.prov.bean.GeneralLedger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    	int accountCatId = Integer.parseInt(request.getParameter("accGroupId"));
    	int companyId = Integer.parseInt(request.getParameter("companyId"));
    	String accountName = request.getParameter("accountLedgerName").toUpperCase();
    	String accountDesc = request.getParameter("ledgerDesc").toUpperCase();
    	double openingBal = Double.parseDouble(request.getParameter("openingBal")); 
    	int balanceType = Integer.parseInt(request.getParameter("openingBalType"));
    	String ledgerDate = request.getParameter("openingBalDate");
    	
    	AccountName an = new AccountName();
        
        an.setAccountLedger(accountName);
        an.setCompanyId(companyId);
        an.setAccCategoryId(accountCatId);
        an.setLedgerDesc(accountDesc);
        an.setLedgerDate(ledgerDate);
        an.setBankId(0);
        if(balanceType == 1){
        	an.setOpeningBal(openingBal);
    	}else if(balanceType == 2){
    		an.setOpeningBal(0-openingBal);
    	}
    	
    	AddAccountName addAccount = new AddAccountName();
    	
    	int accId = addAccount.addAccountName(an);
    	
    	GeneralLedger gl = new GeneralLedger();
    	gl.setAccNameId(accId);
    	if(balanceType == 1){
    		gl.setOpeningBal(openingBal);
    	}else if(balanceType == 2){
    		gl.setOpeningBal(0-openingBal);
    	}
    	gl.setGlDate(ledgerDate);
   		gl.setCredit(0);
	    gl.setDebit(0);
   		gl.setClosingBal(gl.getOpeningBal());
	    
	    AddGeneralLedger addGl = new AddGeneralLedger();
	    
	    int ledgerId = addGl.addGeneralLedger(gl);
	    
	    session.setAttribute("accountId",ledgerId);
   		response.sendRedirect("../admin/Chart_Of_Accounts.jsp");
   		
	    
    %>
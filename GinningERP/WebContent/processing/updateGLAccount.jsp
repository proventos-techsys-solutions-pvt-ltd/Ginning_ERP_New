<%@page import="com.prov.delete.DeleteGeneralLedger"%>
<%@page import="com.prov.dbops.CheckTransactions"%>
<%@page import="com.prov.dbupdation.UpdateAccountName"%>
<%@page import="com.prov.dbinsertion.AddGeneralLedger"%>
<%@page import="com.prov.dbinsertion.AddAccountName"%>
<%@page import="com.prov.bean.AccountName"%>
<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.bean.GeneralLedger"%>
<%@page import="com.prov.dbupdation.UpdateGeneralLedger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <% 
    	
    	int accountId = Integer.parseInt(request.getParameter("accountId"));
		int accountCatId = Integer.parseInt(request.getParameter("accGroupId"));
		int companyId = Integer.parseInt(request.getParameter("companyId"));
		String accountName = request.getParameter("accountLedgerName").toUpperCase();
		String accountDesc = request.getParameter("ledgerDesc").toUpperCase();
		double openingBal = Double.parseDouble(request.getParameter("openingBal")); 
		int balanceType = Integer.parseInt(request.getParameter("openingBalType"));
		String ledgerDate = request.getParameter("openingBalDate");
		
		
		CheckTransactions checkTrans = new CheckTransactions();
		int flag = 0;
		
		flag = checkTrans.checkTransactionsForAccount(accountId);
		
		if(flag == 0){
		
			AccountName an = new AccountName();
	        
			an.setAccountId(accountId);
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
	    	
	    	UpdateAccountName updateAccount = new UpdateAccountName();
	    	
	    	int accId = updateAccount.updateAccountName(an);
	    	
	    	DeleteGeneralLedger deleteGl = new DeleteGeneralLedger();
	    	
	    	deleteGl.deleteGeneralLedger(accId);
	    	
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
		    
		    session.setAttribute("updateAccountId",Integer.toString(accId));
	    	response.sendRedirect("../admin/Chart_Of_Accounts.jsp");
		}else {
			session.setAttribute("accountId",-1);
	    	response.sendRedirect("../admin/Chart_Of_Accounts.jsp");
		}
    
    %>
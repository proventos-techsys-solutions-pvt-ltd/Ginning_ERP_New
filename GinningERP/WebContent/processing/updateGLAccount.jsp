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
		
		GeneralLedger gl = new GeneralLedger();
    	gl.setCompanyId(companyId);
    	gl.setAccountCatId(accountCatId);
    	gl.setAccountLedger(accountName);
    	gl.setLedgerDesc(accountDesc);
    	if(balanceType == 1){
    		gl.setOpeningBal(openingBal);
    	}else if(balanceType == 2){
    		gl.setOpeningBal(0-openingBal);
    	}
    	gl.setGlDate(ledgerDate);
   		gl.setCredit(0);
	    gl.setDebit(0);
   		gl.setClosingBal(0);
   		gl.setAccountId(accountId);
   		gl.setVoucherNo(0);
    	
    	UpdateGeneralLedger update = new UpdateGeneralLedger();
    	
    	int accountid = update.updateGeneralLedger(gl);
    	
    	response.sendRedirect("../admin/Chart_Of_Accounts.jsp");
    
    %>
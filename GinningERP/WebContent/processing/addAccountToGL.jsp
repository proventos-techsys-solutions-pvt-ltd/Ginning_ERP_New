<%@page import="com.prov.dbinsertion.AddGeneralLedger"%>
<%@page import="com.prov.bean.GeneralLedger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    	int groupId = Integer.parseInt(request.getParameter("accGroupId"));
    	int companyId = Integer.parseInt(request.getParameter("companyId"));
    	String accountName = request.getParameter("accountLedgerName").toUpperCase();
    	String accountDesc = request.getParameter("ledgerDesc").toUpperCase();
    	double openingBal = Double.parseDouble(request.getParameter("openingBal")); 
    	int balanceType = Integer.parseInt(request.getParameter("openingBalType"));
    	String ledgerDate = request.getParameter("openingBalDate");
    	
    	GeneralLedger gl = new GeneralLedger();
    	gl.setCompanyId(companyId);
    	gl.setGroupId(groupId);
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
	    
	    AddGeneralLedger addGl = new AddGeneralLedger();
	    
	    int ledgerId = addGl.addGeneralLedger(gl);
	    
	    session.setAttribute("accountLedgerId",ledgerId);
   		response.sendRedirect("../admin/Chart_Of_Accounts.jsp");
   		
	    
    %>
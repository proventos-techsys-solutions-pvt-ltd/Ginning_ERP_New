<%@page import="com.prov.dbinsertion.AddAccountName"%>
<%@page import="com.prov.bean.AccountName"%>
<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddGeneralLedger"%>
<%@page import="com.prov.bean.GeneralLedger"%>
<%@page import="com.prov.dbinsertion.AddBank"%>
<%@page import="com.prov.bean.Bank"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    int companyId = Integer.parseInt(request.getParameter("companyId"));
    String bankName = request.getParameter("bankName").toUpperCase();
    String accountNo = request.getParameter("accountNo");
    String ifsc = request.getParameter("ifsc").toUpperCase();
    String micr = request.getParameter("micr").toUpperCase();
    String date = request.getParameter("date");
    double openingBalance = Double.parseDouble(request.getParameter("openingBal"));
    
    Bank b = new Bank();
    
    b.setCompanyId(companyId);
    b.setBankName(bankName);
    b.setAccountNo(accountNo);
    b.setIfsc(ifsc);
    b.setMicr(micr);
    b.setDate(date);
    
    AddBank ab = new AddBank();
    
    int bankId = ab.addBank(b);
    
    String bankAccountName = b.getBankName()+" - "+(b.getAccountNo().substring(b.getAccountNo().length() - 4));
    
   	AccountName an = new AccountName();
    
    GeneralLedger gl = new GeneralLedger();
    
    an.setAccountLedger(bankAccountName);
    an.setCompanyId(b.getCompanyId());
    an.setAccCategoryId(1);
    an.setLedgerDesc(b.getBankName());
    an.setLedgerDate(date);
	an.setBankId(bankId);
	an.setOpeningBal(openingBalance);
	
	AddAccountName addAccount = new AddAccountName();
	
	int accId = addAccount.addAccountName(an);
	
	gl.setAccNameId(accId);
    gl.setGlDate(date);
	gl.setOpeningBal(openingBalance);
    gl.setCredit(0);
    gl.setDebit(0);
	gl.setClosingBal(openingBalance);
    
    AddGeneralLedger addGl = new AddGeneralLedger();
    
    addGl.addGeneralLedger(gl);
	
    session.setAttribute("bankId", Integer.toString(bankId));
    response.sendRedirect("../admin/Setup_Bank.jsp");
    
    %>
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
    
    Bank b = new Bank();
    
    b.setCompanyId(companyId);
    b.setBankName(bankName);
    b.setAccountNo(accountNo);
    b.setIfsc(ifsc);
    b.setMicr(micr);
    b.setDate(date);
    
    AddBank ab = new AddBank();
    
    int bankId = ab.addBank(b);
    
    session.setAttribute("bankId", Integer.toString(bankId));
    response.sendRedirect("../views/SetupBanks.jsp");
    
    %>
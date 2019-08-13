<%@page import="com.prov.dbops.VoucherSeries"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    	VoucherSeries series = new VoucherSeries();
    
    	int voucherNo = series.getVoucherNo();
    	
    	out.print(voucherNo);
    	out.flush();
    
    %>
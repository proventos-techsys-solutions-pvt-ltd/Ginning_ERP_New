<%@page import="com.prov.delete.DeleteCustomer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int customerId = Integer.parseInt(request.getParameter("vendorId"));
	
	DeleteCustomer deleteCustomer = new DeleteCustomer();
	
	int output = deleteCustomer.deleteCustomer(customerId);
	
	out.print(output);
	out.flush();
%>
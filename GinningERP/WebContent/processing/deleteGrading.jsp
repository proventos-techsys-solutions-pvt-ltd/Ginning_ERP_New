<%@page import="com.prov.dbops.CheckInvoiceExists"%>
<%@page import="com.prov.delete.DeleteGradeDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int rst = Integer.parseInt("rst");
	int weighmentId = Integer.parseInt("weighmentId");
	
	int deleteFlag = 0; 
	
	CheckInvoiceExists checkInvoice = new CheckInvoiceExists();
	
	int invoiceFlag = checkInvoice.invoiceExistsCheck(rst);

	if(invoiceFlag == 0){
		DeleteGradeDetails deleteGrading = new DeleteGradeDetails();
		deleteFlag = deleteGrading.deleteGradeDetails(weighmentId);
		out.print(deleteFlag);
		out.flush();
	}else{
		out.print(0);
		out.flush();
	}
	
	
%>
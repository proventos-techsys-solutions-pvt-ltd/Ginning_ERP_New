<%@page import="com.prov.delete.DeleteRTGS"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int rtgsId = Integer.parseInt(request.getParameter("rtgsId"));
	
	DeleteRTGS deleteRtgsObj = new DeleteRTGS();
	
	int returnValue = deleteRtgsObj.deleteRtgs(rtgsId);
	
	out.print(returnValue);
	out.flush();
	
%>
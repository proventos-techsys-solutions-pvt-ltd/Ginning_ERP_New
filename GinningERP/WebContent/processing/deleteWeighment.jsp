<%@page import="com.prov.delete.DeleteRst"%>
<%@page import="com.prov.dbops.CheckAlreadyGraded"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int rst = Integer.parseInt(request.getParameter("rst"));
	//int weighmentId = Integer.parseInt(request.getParameter("weighmentId"));
	
	int output = 0;
	CheckAlreadyGraded checkGrade = new CheckAlreadyGraded();
	
	int gradeFlag = checkGrade.alreadyGraded(rst);
	if(gradeFlag == 0){
		DeleteRst deleteRst = new DeleteRst();
		output = deleteRst.deleteRst(rst);
	}
	out.print(output);
	out.flush();
	
%>
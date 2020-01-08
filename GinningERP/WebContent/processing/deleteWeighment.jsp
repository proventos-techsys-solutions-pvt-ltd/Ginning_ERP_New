<%@page import="com.prov.dbops.CheckWeighment"%>
<%@page import="com.prov.delete.DeleteRst"%>
<%@page import="com.prov.dbops.CheckAlreadyGraded"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int rst = Integer.parseInt(request.getParameter("rst"));
	int output = 0;
	CheckAlreadyGraded checkGrade = new CheckAlreadyGraded();
	
	int gradeFlag = checkGrade.alreadyGraded(rst);
	if(gradeFlag == 0){
		CheckWeighment checkWtStatus = new CheckWeighment();
		int tareWtFlag = checkWtStatus.checkTareWtCompleted(rst);
		if(tareWtFlag==0){
			DeleteRst deleteRst = new DeleteRst();
			output = deleteRst.deleteRst(rst);
		}
		
	}
	
	out.print(output);
	out.flush();
	
%>
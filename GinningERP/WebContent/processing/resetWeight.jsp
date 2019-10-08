<%@page import="com.prov.dbupdation.UpdateWeighMast"%>
<%@page import="com.prov.dbops.CheckWeighment"%>
<%@page import="com.prov.dbops.CheckRST"%>
<%@page import="com.prov.dbops.CheckAlreadyGraded"%>
<%@page import="com.prov.dbops.CheckInvoiceExists"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int rst = Integer.parseInt(request.getParameter("rst"));
	
	int output = 0;
	
	CheckRST checkRst = new CheckRST();
	int rstExistFlag = checkRst.checkRstExistsInWeighMast(rst);
	
	if(rstExistFlag > 0){
		
		CheckAlreadyGraded checkGraded = new CheckAlreadyGraded();
		int gradeFlag = 0;
		
		gradeFlag = checkGraded.alreadyGraded(rst);
		
		if(gradeFlag == 0){
			
			CheckWeighment checkWtStatus = new CheckWeighment();
			
			int grossWtFlag = checkWtStatus.checkGrossWtCompleted(rst);
			
			if(grossWtFlag == 1){
				
				int tareWtFlag = checkWtStatus.checkTareWtCompleted(rst);
				
				if(tareWtFlag == 1){
					UpdateWeighMast updateWeight = new UpdateWeighMast();
					
					int rows = updateWeight.resetTareWt(rst);
					
					output = 4;
					
				}else if(tareWtFlag == 0){
					UpdateWeighMast updateWeight = new UpdateWeighMast();
					
					int rows = updateWeight.resetGrossWt(rst);
					
					output = 3;
				}
			}else{
				output = 2;
			}
		}else{
			output = 1;
		}
	}else{
		output = 0;
	}
	
	out.print(output);
	out.flush();
	
%>
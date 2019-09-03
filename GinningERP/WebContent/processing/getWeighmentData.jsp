<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbops.CheckInvoiceExists"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.dbops.CheckRST"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.RstReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	int rst = 0;
	try{
		 rst = Integer.parseInt(request.getParameter("rst"));
	}catch(Exception e){
		out.println(0);
	}

	CheckRST cr = new CheckRST();
	
	int rstExistFlag = cr.checkRstExistsInWeighMast(rst);
	
	if(rst == 0 )
	{
		out.println(0);
	}
	else if(rstExistFlag <= 0){
		out.println(1);
	}
	else if(rstExistFlag > 0){
		
		RstReport report = new RstReport();
		
		int gradeExistsFlag = cr.checkRstExistsInGradeDetails(rst);
		
		if(gradeExistsFlag==0){
		
			JSONArray jsonArray = new JSONArray();
			
			JSONObject obj = report.getWeighmentData(rst);
			
			if(Double.parseDouble((String)obj.get("netWeight")) <= 0){
				out.println(2);
				out.flush();
			}else if(Double.parseDouble((String)obj.get("netWeight")) > 0)
			{
				obj.put("flag", gradeExistsFlag);
				
				jsonArray.put(obj);
			
				out.print(jsonArray);
				out.flush();
			}
		}
		else if(gradeExistsFlag>0)
		{
			JSONArray jsonArray = null;
			CheckInvoiceExists checkInv = new CheckInvoiceExists();
			if(checkInv.invoiceExistsCheck(rst) > 0){
				jsonArray = report.getDataForInvoicing(rst);
				jsonArray.getJSONObject(0).put("flag", gradeExistsFlag);
				jsonArray.getJSONObject(0).put("invoiceFlag", 1);
			}
			else if(checkInv.invoiceExistsCheck(rst) <= 0){
				jsonArray = report.getDataForInvoicing(rst);
				jsonArray.getJSONObject(0).put("flag", gradeExistsFlag);
				jsonArray.getJSONObject(0).put("invoiceFlag", 0);
			}
			
			out.print(jsonArray);
			out.flush();
		}
	}
%>
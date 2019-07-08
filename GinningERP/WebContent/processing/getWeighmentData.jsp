<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.dbops.CheckRST"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.RstReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	int rst = Integer.parseInt(request.getParameter("rst"));

	CheckRST cr = new CheckRST();
	
	int rstExistFlag = cr.checkRstExistsInWeighMast(rst);
	
	if(rst == 0 )
	{
		out.println("Please enter valid information.");
	}
	else if(rstExistFlag > 0){
		
		RstReport report = new RstReport();
		
		int gradeExistsFlag = cr.checkRstExistsInGradeDetails(rst);
		
		if(gradeExistsFlag==0){
		
			JSONArray jsonArray = new JSONArray();
			
			JSONObject obj = report.getWeighmentData(rst);
			
			obj.put("flag", gradeExistsFlag);
			
			jsonArray.put(obj);
		
			out.print(jsonArray);
			out.flush();
		}
		else if(gradeExistsFlag>0)
		{
			JSONArray jsonArray = report.getDataForInvoicing(rst);
			jsonArray.getJSONObject(0).put("flag", gradeExistsFlag);
			
			out.print(jsonArray);
			out.flush();
		}
	}
%>
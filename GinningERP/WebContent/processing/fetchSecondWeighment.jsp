<%@page import="com.prov.dbops.CheckRST"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.RstReport"%>
<%@page import="com.prov.dbinsertion.AddWeighMast"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    	String rstStr = request.getParameter("rst");
    System.out.println(rstStr);
	    if(rstStr.equals("0") || rstStr == "")
	    {
	    	out.println(0);	
			out.flush();
	
	    }else{
	    	int rst=0;
	    	try{
	    		rst = Integer.parseInt(rstStr);
	    	}catch(NumberFormatException e){
	    		out.println(0);	
	    		out.flush();
	    	}
	        CheckRST cr = new CheckRST();
	    	
	    	int rstExistFlag = cr.checkRstExistsInWeighMast(rst);
	    	
	    	if(rstExistFlag <= 0){
	    		out.println(0);
	    		out.flush();
	    	}
	    	else if(rstExistFlag > 0){
	    		
	    		RstReport report = new RstReport();
	    		
	    		JSONObject firstWeighment = report.getRstForSecondWeighment(rst);
	    		
	    		out.print(firstWeighment);
	    		out.flush();
	    	}
	    }
    	
    %>
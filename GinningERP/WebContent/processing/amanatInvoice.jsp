<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.GradeRateReport"%>
<%@page import="com.prov.dbops.CheckAmanatRstExists"%>
<%@page import="com.prov.dbops.CheckAlreadyGraded"%>
<%@page import="com.prov.dbops.CheckRST"%>
<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.report.AmanatReport"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    
    String rstString = request.getParameter("rst");
    
    
    if(rstString.equals("0") || rstString == "")
    {
    	out.println(0);	
		out.flush();

    }else{
    	int rst=0;
    	try{
    		rst = Integer.parseInt(rstString);
    	}catch(Exception e){
    		out.println(0);	
    		out.flush();
    	}
        CheckRST cr = new CheckRST();
    	
    	int rstExistFlag = cr.checkRstExistsInWeighMast(rst);
    	
    	if(rstExistFlag <= 0){
    		out.println(1);
    		out.flush();
    	}
    	else if(rstExistFlag > 0){
    		CheckAlreadyGraded checkGrade = new CheckAlreadyGraded();
    		int gradeRows = checkGrade.alreadyGraded(rst);
    		if(gradeRows <= 0){
    			
    			out.println(2);
	    		out.flush();

    		}
    		else if(gradeRows>0){
    			
    			CheckAmanatRstExists checkAmanat = new CheckAmanatRstExists();
    			
    			int AmanatRstFlag = checkAmanat.checkRstExistsInAmanat(rst);
    			
    			if(AmanatRstFlag > 0){
	    			AmanatReport rep = new AmanatReport();
	    	    	
	    	    	JSONArray json = rep.getAmanatDataInvoicing(rst);
	    	    	
	    	    	double superRate = new GradeRateReport().getTodaysSuperRate().getRate();
	    	    	JSONObject obj = new JSONObject();
	    	    	obj.put("superRate", superRate);
					json.put(obj);
	    	    	out.print(json);
	    	    	out.flush();
    			}else if(AmanatRstFlag == 0){
    				out.println(3);
    	    		out.flush();

    			}
    	
			}
		}
	}

    
    %>
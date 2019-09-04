<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbops.CheckInvoiceSaved"%>
<%@page import="com.prov.dbops.CheckAlreadyGraded"%>
<%@page import="com.prov.dbops.CheckRST"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.prov.report.RstReport"%>
<%@page import="com.prov.bean.Amanat"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.CustomerReport"%>
<%@page import="com.prov.bean.Customer"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@page import="com.prov.report.WeighReport"%>
<%@page import="com.prov.report.CustomerVehicleReport"%>
<%@page import="com.prov.bean.CustomerVehicle"%>
<%@page import="com.prov.bean.Invoice"%>
<%@page import="com.prov.report.InvoiceReport"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	
    	String rstString = request.getParameter("rst");
    
        System.out.print(rstString);
        
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
	    			
	    			CheckInvoiceSaved checkInvoice = new CheckInvoiceSaved();
	    			
	    			int invoiceSavedFlag = checkInvoice.invoiceExistsCheck(rst);
	    			
	    			//if(invoiceSavedFlag==0){
	        	
				    	RstReport report = new RstReport();
			        	
			        	JSONArray jsonArray =  report.getDataForInvoicing(rst);
			        	
				    	out.print(jsonArray);
				    	out.flush();
	    			//}else if(invoiceSavedFlag>0){
	    			//	out.println(3);
	    				//out.flush();
	    			//}
	    		}
	    	}
        }
    %>
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
    	
    	int rst = Integer.parseInt(request.getParameter("rst"));
    
        System.out.print(rst);
        
        if(rst == 0)
        {
        	out.println("Please enter valid information.");	
        }
        
        else{
			
        	WeighReport wr = new WeighReport();
	    	
	    	WeighMast w= new WeighMast();
	    	
	    	CustomerVehicle cv = new CustomerVehicle();
	    	
	    	CustomerVehicleReport vr = new CustomerVehicleReport();
	    	
	    	cv = vr.getReport(w.getVid());
	    	
	    	w = wr.getReport(rst);
	    	
	    	Customer cust = new Customer();
	    	
	    	CustomerReport cr = new CustomerReport();
	    	
	    	cust = cr.getReport(w.getCid());
	    	
	    	JSONObject vehicleObj = new JSONObject(cv);
	    	JSONObject weighObj = new JSONObject(w);
	    	JSONObject customerObj = new JSONObject(cust);
	    	
	    	JSONObject obj = new JSONObject();
	    	obj.put("vehicle", vehicleObj);
	    	obj.put("weight", weighObj);
	    	obj.put("customer", customerObj);
	    	
	    	out.print(obj);
        }
    %>
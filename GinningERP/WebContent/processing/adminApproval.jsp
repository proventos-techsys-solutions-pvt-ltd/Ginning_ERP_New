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
        	
	    	InvoiceReport ir = new InvoiceReport();
	    	
	    	Invoice inv = new Invoice();
	    	
	    	inv = ir.getInvoiceData(rst);
	    	
	    	CustomerVehicle cv = new CustomerVehicle();
	    	
	    	CustomerVehicleReport vr = new CustomerVehicleReport();
	    	
	    	cv = vr.getReport(inv.getVid());
	    	
	    	WeighReport wr = new WeighReport();
	    	
	    	WeighMast w= new WeighMast();
	    	
	    	w = wr.getReport(rst);
	    	
	    	Customer cust = new Customer();
	    	
	    	CustomerReport cr = new CustomerReport();
	    	
	    	cust = cr.getReport(inv.getCid());
	    	
	    	JSONObject invObj = new JSONObject(inv);
	    	JSONObject vehicleObj = new JSONObject(cv);
	    	JSONObject weighObj = new JSONObject(w);
	    	JSONObject customerObj = new JSONObject(cust);
	    	
	    	JSONObject obj = new JSONObject();
	    	obj.put("invoice", invObj);
	    	obj.put("vehicle", vehicleObj);
	    	obj.put("weight", weighObj);
	    	obj.put("customer", customerObj);
	    	
	    	out.print(obj);
        }
    %>
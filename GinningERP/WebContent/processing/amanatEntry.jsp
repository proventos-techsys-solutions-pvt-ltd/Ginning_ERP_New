<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.prov.dbinsertion.AddAmanatEntry"%>
<%@page import="com.prov.bean.Amanat"%>
<%@page import="com.prov.report.AmanatReport"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.report.CustomerReport"%>
<%@page import="com.prov.bean.Customer"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@page import="com.prov.report.WeighReport"%>
<%@page import="com.prov.report.CustomerVehicleReport"%>
<%@page import="com.prov.bean.CustomerVehicle"%>
    
    <%
	
    	int rst = Integer.parseInt(request.getParameter("rst"));
    	int cid = Integer.parseInt(request.getParameter("cid"));
    	int vid = Integer.parseInt(request.getParameter("vid"));
    	double contractRate = Double.parseDouble(request.getParameter("contractRate"));
    	double total = Double.parseDouble(request.getParameter("total"));
    	String amanatDate = request.getParameter("amanatDate");
    	String dateOfExpiry = request.getParameter("dateOfExpiry");
    	double finalRate = 0.0;
    	int companyId = Integer.parseInt(request.getParameter("companyId"));
    	
    	if(rst == 0 || cid == 0 || vid == 0 || contractRate == 0 || total == 0 || amanatDate == "" || amanatDate == null || 
    	   dateOfExpiry == "" || dateOfExpiry == null)
    	{
    		out.println("Please enter valid information.");	
    	}
    	else{
    		
    	Amanat a = new Amanat();
    	
    	AddAmanatEntry ae= new AddAmanatEntry();
    	
    	a.setRst(rst);
    	a.setCid(cid);
    	a.setVid(vid);
    	a.setContractRate(contractRate);
    	a.setTotal(total);
    	a.setAmanatDate(amanatDate);
    	a.setDateOfExpiry(dateOfExpiry);
    	a.setFinalRate(finalRate);
    	
    	ae.addAmanat(a);
    	
    	response.sendRedirect("../views/Amanat.jsp");

    	}
    %>
<%@page import="com.prov.dbinsertion.AddWeighRateMast"%>
<%@page import="com.prov.bean.WeighRateMast"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	String vehicle_name = request.getParameter("vehicle_name");
     	String vehicle_desc = request.getParameter("vehicle_desc");
     	Double weighrate = Double.parseDouble(request.getParameter("weighrate"));
     	
     	WeighRateMast wrm = new WeighRateMast();
     	
     	wrm.setVehicle_name(vehicle_name);
     	wrm.setVehicle_Desc(vehicle_desc);
     	wrm.setWeighrate(weighrate);
     	
     	AddWeighRateMast awrm = new AddWeighRateMast();
     	
     	awrm.addWeighRateMast(wrm);
     	
        response.sendRedirect("../views/SetupVehicle.jsp");
    
    %>
    
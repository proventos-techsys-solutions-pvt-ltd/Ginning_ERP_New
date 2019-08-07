<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.dbinsertion.AddWeighRateMast"%>
<%@page import="com.prov.bean.WeighRateMast"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	String data = request.getParameter("output");
     
    	JSONParser parser = new JSONParser();
    	
    	JSONObject jsonObj = (JSONObject)parser.parse(data);
     	
     	WeighRateMast wrm = new WeighRateMast();
     	
     	wrm.setVehicleName(((String)jsonObj.get("vehicleName")).toUpperCase());
     	wrm.setVehicleDesc(((String)jsonObj.get("description")).toUpperCase());
     	wrm.setWeighrate(Double.parseDouble((String)jsonObj.get("weighRate")));
     	
     	AddWeighRateMast awrm = new AddWeighRateMast();
     	
     	int weighRateId = 0;
     	
     	weighRateId = awrm.addWeighRateMast(wrm);
     	
     	session.setAttribute("weighRateId", Integer.toString(weighRateId));
     	response.sendRedirect("../views/SetupVehicle.jsp");
    %>
    
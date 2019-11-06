<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbupdation.UpdateWeighRateMast"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.prov.dbinsertion.AddWeighRateMast"%>
<%@page import="com.prov.bean.WeighRateMast"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	String data = request.getParameter("outputUpdate");
     
    	JSONParser parser = new JSONParser();
    	
    	JSONObject jsonObj = (JSONObject)parser.parse(data);
     	
     	WeighRateMast wrm = new WeighRateMast();
     	
     	wrm.setId(Integer.parseInt((String)jsonObj.get("vehicleTypeId")));
     	wrm.setVehicleName(((String)jsonObj.get("vehicleNameUpdate")).toUpperCase());
     	wrm.setVehicleDesc(((String)jsonObj.get("description")).toUpperCase());
     	wrm.setWeighrate(Double.parseDouble((String)jsonObj.get("rate")));
     	
     	UpdateWeighRateMast uwrm = new UpdateWeighRateMast();
     	
     	int updatedWeighRate = uwrm.updateWeighRateMast(wrm);
     	
		response.sendRedirect("../admin/Setup_Vehicle_Rates.jsp");
    
    %>
    
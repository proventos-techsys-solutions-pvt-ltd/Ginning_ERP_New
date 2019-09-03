<%@page import="com.prov.delete.DeleteVehicleRates"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%
    
    	int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));	
    
    	DeleteVehicleRates delVehRates = new DeleteVehicleRates();
    	
    	int id = delVehRates.deleteVehicleRates(vehicleId);
    	
    	out.println(id);
    	out.flush();
    
    %>
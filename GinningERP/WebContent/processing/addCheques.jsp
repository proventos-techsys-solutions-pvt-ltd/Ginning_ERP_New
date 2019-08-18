<%@page import="com.prov.dbupdation.UpdateDailySetup"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    

    String output = request.getParameter("dailySetupOutput");
    
    JSONParser parser = new JSONParser();
    
    JSONObject obj = (JSONObject)parser.parse(output);
    
    String lastChequeNo = (String)obj.get("lastChequeNo");
    int totalCheques = Integer.parseInt((String)obj.get("totalCheques"));
    int setupId = Integer.parseInt((String)obj.get("setupId"));
    
    UpdateDailySetup uds = new UpdateDailySetup();
   	
    int rowsUpdated = uds.addCheques(lastChequeNo, totalCheques, setupId);
    
    response.sendRedirect("../admin/Daily_Setup.jsp");
    
    %>
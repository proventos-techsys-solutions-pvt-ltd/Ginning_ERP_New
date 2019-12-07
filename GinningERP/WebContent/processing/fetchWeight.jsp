<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.googlecode.javacv.CanvasFrame" %>
<%@page import="com.googlecode.javacv.OpenCVFrameGrabber" %>
<%@page import="com.googlecode.javacv.cpp.opencv_core.IplImage" %>
<%@page import="com.googlecode.javacv.cpp.opencv_core.*" %>
<%@page import="org.opencv.core.*" %>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="java.io.File" %>
<%@page import="java.io.IOException" %>
<%@page import="javax.imageio.ImageIO" %>

<%@page import="com.prov.weighing.FetchWeight"%>
<%@page import="com.prov.ipcamera.IpCamera"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>	
    
    
    <% 
    	String dataStr = request.getParameter("data");
    	
    	JSONParser parser = new JSONParser();
    
    	JSONObject obj = (JSONObject)parser.parse(dataStr);
    
  	 	SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy_HHmmss");  
		Date todaysDate = new Date();  
		String formattedDate = formatter.format(todaysDate);
		
		String frontImageName = "";
		String rearImageName = "";
		
		if(((String)obj.get("weighType")).equals("gross")){
			 frontImageName = (String)obj.get("name")+"_"+formattedDate+"front_gross.png"; 
	    	 rearImageName = (String)obj.get("name")+"_"+formattedDate+"rear_gross.png"; 
		}else if(((String)obj.get("weighType")).equals("tare")){
			 frontImageName = (String)obj.get("name")+"_"+formattedDate+"front_tare.png"; 
	    	 rearImageName = (String)obj.get("name")+"_"+formattedDate+"rear_tare.png"; 
		}
 	
		//Need to fill the IP address here
		String frontIp = "";
		String rearIp = "";
		
   		IpCamera.getVehiclePhoto(frontIp, frontImageName);//take vehicle photo
   		IpCamera.getVehiclePhoto(rearIp, rearImageName);
    	FetchWeight fetch = new FetchWeight();
    	String weightStr = fetch.fetch();
    	double weight = Double.parseDouble(weightStr);
    	
    	org.json.JSONObject outObj = new org.json.JSONObject();
    	
    	outObj.put("weight", weight);
    	outObj.put("frontImageName", frontImageName);
    	outObj.put("rearImageName", rearImageName);
    	
    	out.println(outObj);
    	out.flush();
    %>
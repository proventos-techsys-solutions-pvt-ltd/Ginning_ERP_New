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
   IpCamera.getVehiclePhoto();//take vehicle photo
    	FetchWeight fetch = new FetchWeight();
    	String weightStr = fetch.fetch();
    	double weight = Double.parseDouble(weightStr);
    	
    	out.println(weight);
    	out.flush();
    %>
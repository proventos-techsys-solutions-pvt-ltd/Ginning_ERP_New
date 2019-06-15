<%@page import="com.prov.dbinsertion.AddWeighMast"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    
    	int rst = Integer.parseInt(request.getParameter("rst"));
	  	float tareWt =  Float.parseFloat(request.getParameter("tare"));
	    String tareWtTime = request.getParameter("tareWtTime");
	    float netWt = Float.parseFloat(request.getParameter("net"));
	    
	    WeighMast wm = new WeighMast();
	    
	    wm.setRst(rst);
	    wm.setTare(tareWt);
	    wm.setTareWtTime(tareWtTime);
	    wm.setNet(netWt);
	    
	    AddWeighMast addWeigh = new AddWeighMast();
	    
	    addWeigh.addSecondWeighment(wm);
	    
	    response.sendRedirect("../views/GenerateRST.jsp");
    	
    %>
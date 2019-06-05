<%@page import="com.prov.dbinsertion.AddWeighMast"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@page import="com.prov.dbinsertion.AddCustomerVehicle"%>
<%@page import="com.prov.bean.CustomerVehicle"%>
<%@page import="com.prov.dbinsertion.AddInvoice" %>
<%@page import="com.prov.bean.Invoice" %>

<% 
   
	int cid = Integer.parseInt(request.getParameter("id"));
 	int rst = Integer.parseInt(request.getParameter("rst"));
 	String date = request.getParameter("date");
 	String vehicleNo = request.getParameter("vehicleNo").toUpperCase();
 	String vehicleType = request.getParameter("vehicleType").toUpperCase();
 	String customer = request.getParameter("customer").toUpperCase();
 	String address = request.getParameter("address").toUpperCase();
 	String material = request.getParameter("material").toUpperCase();
 	String mobile = request.getParameter("mobile").toUpperCase();
 	float gross = Float.parseFloat(request.getParameter("gross"));
 	float tare = Float.parseFloat(request.getParameter("tare"));
 	float net = Float.parseFloat(request.getParameter("net"));
 	String grossWt = request.getParameter("grossWtTime");
 	String tareWt = request.getParameter("tareWtTime");
 	String netWt = request.getParameter("netWtTime");
 	int weighRate = Integer.parseInt(request.getParameter("weighRate"));
 	
	CustomerVehicle cv = new CustomerVehicle();
	Invoice inv = new Invoice();
	WeighMast w = new WeighMast();
	
	cv.setCid(cid);
	cv.setVehicleNo(vehicleNo);
	cv.setVehicleType(vehicleType);
	//cv.setGrossWtTime(grossWt);
	//cv.setTareWtTime(tareWt);
	
	AddCustomerVehicle addVehicle = new AddCustomerVehicle();
	
	int vehicleId = addVehicle.addCustomerVehicle(cv);
	
	inv.setRst(rst);
	inv.setCid(cid);
	inv.setVid(vehicleId);
	
	inv.setInvDate(date);
	inv.setAmountPaid(0);
	inv.setFinalRate(0);
	inv.setPending(0);
	inv.setTotal(0);
	
	w.setMaterial(material);
	w.setWeighRate(weighRate);
	w.setRst(rst);
	w.setCid(cid);
	w.setVid(vehicleId);
	w.setGross(gross);
	w.setTare(tare);
	w.setNet(net);
	w.setGrossWtTime(grossWt);
	w.setTareWtTime(tareWt);
	
	AddWeighMast addWeigh = new AddWeighMast();
	
	int rstWeighMast = addWeigh.addWeighMast(w);
	
	
	AddInvoice addInvoice = new AddInvoice();
	
	int invId = addInvoice.addInvoice(inv);
	
	response .sendRedirect("../views/GenerateRST.jsp");
	
%>

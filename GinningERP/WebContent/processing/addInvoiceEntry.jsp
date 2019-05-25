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
 	
	CustomerVehicle cv = new CustomerVehicle();
	Invoice inv = new Invoice();
	
	cv.setCid(cid);
	cv.setVehicleNo(vehicleNo);
	cv.setVehicleType(vehicleType);
	cv.setGrossWtTime(grossWt);
	cv.setTareWtTime(tareWt);
	
	AddCustomerVehicle addVehicle = new AddCustomerVehicle();
	
	int vehicleId = addVehicle.addCustomerVehicle(cv);
	
	inv.setCid(cid);
	inv.setVid(vehicleId);
	inv.setGrossWeight(gross);
	inv.setTareWeight(tare);
	inv.setNetWeight(net);
	inv.setInvDate(date);
	
	AddInvoice addInvoice = new AddInvoice();
	
	int invId = addInvoice.addInvoice(inv);
	
	response .sendRedirect("../views/GenerateRST.jsp");
	
%>


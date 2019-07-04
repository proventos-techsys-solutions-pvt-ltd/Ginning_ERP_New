<%@page import="com.prov.dbops.CheckRST"%>
<%@page import="com.prov.dbupdation.UpdateWeighMast"%>
<%@page import="com.prov.dbinsertion.AddWeighMast"%>
<%@page import="com.prov.bean.WeighMast"%>
<%@page import="com.prov.dbinsertion.AddCustomerVehicle"%>
<%@page import="com.prov.bean.CustomerVehicle"%>
<%@page import="com.prov.dbinsertion.AddInvoice" %>
<%@page import="com.prov.bean.Invoice" %>

<% 

	int rst = Integer.parseInt(request.getParameter("rst"));

	CheckRST cr = new CheckRST();
	
	if(cr.checkRstExists(rst)==0){
	
		int cid = Integer.parseInt(request.getParameter("id"));
	 	String date = request.getParameter("date");
	 	String vehicleNo = request.getParameter("vehicleNo").toUpperCase();
	 	int vehicleTypeId = Integer.parseInt(request.getParameter("vehicleType"));
	 	String customer = request.getParameter("customer").toUpperCase();
	 	String address = request.getParameter("address").toUpperCase();
	 	String material = request.getParameter("material").toUpperCase();
	 	String mobile = request.getParameter("mobile").toUpperCase();
	 	float gross = Float.parseFloat(request.getParameter("gross"));
	 	float tare = Float.parseFloat(request.getParameter("tare"));
	 	float net = Float.parseFloat(request.getParameter("net"));
	 	String grossWtTime = request.getParameter("grossWtTime");
	 	String tareWtTime = request.getParameter("tareWtTime");
	 	String netWtTime = request.getParameter("netWtTime");
	 	double weighRate = Double.parseDouble(request.getParameter("weighRate"));
	 	
	 	if(cid == 0 || rst == 0 || date == null || vehicleNo == "" || vehicleNo == null || 
	 	   vehicleTypeId == 0 || customer == "" || customer == null || address == "" || address == null || 
	 	   material == null || material == "" || mobile == null || mobile == "" || gross == 0 ||
	 	   grossWtTime == "" || grossWtTime == null || weighRate == 0)
	 	{
	 		out.println("Please enter valid information.");
	 	}
	 	else{
	 		
			CustomerVehicle cv = new CustomerVehicle();
			Invoice inv = new Invoice();
			WeighMast w = new WeighMast();
			
			cv.setCid(cid);
			cv.setVehicleNo(vehicleNo);
			cv.setvTypeId(vehicleTypeId);
			cv.setRst(rst);
			cv.setWeighRate(weighRate);
			
			AddCustomerVehicle addVehicle = new AddCustomerVehicle();
			
			int vehicleId = addVehicle.addCustomerVehicle(cv);
			
			w.setRst(rst);
			w.setVid(vehicleId);
			w.setMaterial(material);
			w.setGross(gross);
			w.setTare(tare);
			w.setNet(net);
			w.setGrossWtTime(grossWtTime);
			w.setTareWtTime(tareWtTime);	
			
			AddWeighMast addWeigh = new AddWeighMast();
			
			int rstWeighMast = addWeigh.addWeighMast(w);
			
			response .sendRedirect("../views/GenerateRST.jsp");
		
			}
	}
	else{
		
		float tare = Float.parseFloat(request.getParameter("tare"));
	 	float net = Float.parseFloat(request.getParameter("net"));
	 	String tareWtTime = request.getParameter("tareWtTime");
	 	String netWtTime = request.getParameter("netWtTime");
	 	
	 	WeighMast w = new WeighMast();
	 	
	 	w.setRst(rst);
		w.setTare(tare);
		w.setNet(net);
		w.setTareWtTime(tareWtTime);
		
		UpdateWeighMast uw = new UpdateWeighMast();
		
		int rstWeighMast = uw.secondWeighment(w);
		
		response.sendRedirect("../views/GenerateRST.jsp");
		
		}


%>

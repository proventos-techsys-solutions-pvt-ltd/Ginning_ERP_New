<%@page import="jcifs.smb.SmbFileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="jcifs.smb.SmbFile"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%-- page errorPage="../admin/Error.jsp" --%>  
<%@page import="org.json.JSONObject"%>
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
	if(cr.checkRstExistsInWeighMast(rst)==0){
	
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
	 	int dailySetupId = Integer.parseInt(request.getParameter("dailySetupId"));
	 	String operator = request.getParameter("operator");
	 	String frontImageData = request.getParameter("ImageData2");
	 	String backImageData = request.getParameter("ImageData3");
	 	
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy_HHmmss");  
		Date todaysDate = new Date();  
		String formattedDate = formatter.format(todaysDate);
	 	
	 	byte[] frontImagedata = DatatypeConverter.parseBase64Binary(frontImageData.substring(frontImageData.indexOf(",") + 1)); 
    	BufferedImage bufferedImage = null; 
    	String localPath = "c:/TEMP/";
    	String remotePath = "smb://192.168.1.8/VendorImages/";
		
		bufferedImage = ImageIO.read(new ByteArrayInputStream(frontImagedata)); 
    	String frontImageName = customer+"_"+formattedDate+"front.png"; 
    	File file1= new File(localPath+frontImageName);	
    	ImageIO.write(bufferedImage, "png",file1); 
    	
    	byte[] rearImagedata = DatatypeConverter.parseBase64Binary(frontImageData.substring(frontImageData.indexOf(",") + 1)); 
    	bufferedImage = ImageIO.read(new ByteArrayInputStream(rearImagedata)); 
    	String rearImageName = customer+"_"+formattedDate+"rear.png"; 
    	File file2= new File(localPath+rearImageName);	
    	ImageIO.write(bufferedImage, "png",file2); 
	 	
    	InputStream in = null;
    	OutputStream outStr = null;
    	
    	SmbFile remoteFileFront = new SmbFile(remotePath+frontImageName);
    	SmbFile remoteFileRear = new SmbFile(remotePath+rearImageName);
    	
    	remoteFileFront.connect();
    	
    	in = new BufferedInputStream(new FileInputStream(file1));
    	outStr = new BufferedOutputStream(new SmbFileOutputStream(remoteFileFront));
    	
    	byte[] buffer1 = new byte[4096];
    	int len1 = 0;
    	while((len1 = in.read(buffer1, 0, buffer1.length)) != -1){
    		outStr.write(buffer1, 0, len1);
    	}

    	outStr.close();
    	in.close();
    	
    	remoteFileRear.connect();
    	
    	in = new BufferedInputStream(new FileInputStream(file2));
    	outStr = new BufferedOutputStream(new SmbFileOutputStream(remoteFileRear));
    	
    	byte[] buffer2 = new byte[4096];
    	int len2 = 0;
    	while((len2 = in.read(buffer2, 0, buffer2.length)) != -1){
    		outStr.write(buffer2, 0, len2);
    	}
    	
    	
    	try{
    		if(out != null){
    			outStr.close();
    		}
    		if(in != null){
    			in.close();
    		}
    	}catch(Exception e){}
    	
    	file1.delete();
    	file2 .delete();
    	
		CustomerVehicle cv = new CustomerVehicle();
		Invoice inv = new Invoice();
		WeighMast w = new WeighMast();
		
		cv.setCid(cid);
		cv.setVehicleNo(vehicleNo);
		cv.setvTypeId(vehicleTypeId);
		cv.setRst(rst);
		cv.setWeighRate(weighRate);
		cv.setFrontImage(remotePath+frontImageName);
		cv.setRearImage(remotePath+rearImageName);
		
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
		w.setWeighmentDate(date);
		w.setDsId(dailySetupId);
		w.setWbOperator(operator);
		
		AddWeighMast addWeigh = new AddWeighMast();
		int weighMastId=0;
		weighMastId = addWeigh.addWeighMast(w);
		
		session.setAttribute("weighmentId", Integer.toString(weighMastId));
		//response.sendRedirect("../report/RST.jsp");
		response.sendRedirect("../wb_operator/GenerateRST.jsp");

	}
	else{
		
		int weighmentId = Integer.parseInt(request.getParameter("id"));
		float tare = Float.parseFloat(request.getParameter("tare"));
	 	float net = Float.parseFloat(request.getParameter("net"));
	 	String tareWtTime = request.getParameter("tareWtTime");
	 	String netWtTime = request.getParameter("netWtTime");
	 	
	 	WeighMast w = new WeighMast();
	 	
	 	w.setRst(rst);
		w.setTare(tare);
		w.setNet(net);
		w.setTareWtTime(tareWtTime);
		
		System.out.println(w.getTareWtTime());
		
		UpdateWeighMast uw = new UpdateWeighMast();
		
		int rstWeighMast = uw.secondWeighment(w);
		
		session.setAttribute("weighmentId", Integer.toString(weighmentId));
		//response.sendRedirect("../report/RST.jsp");
		response.sendRedirect("../wb_operator/GenerateRST.jsp");
	}
%>


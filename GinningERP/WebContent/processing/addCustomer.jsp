<%@page import="jcifs.smb.SmbFileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="jcifs.smb.SmbFile"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.dbinsertion.AddCustomer"%>
<%@page import="com.prov.bean.Customer"%>

<% 
	
    String CustomerName = request.getParameter("name").toUpperCase();
    String CustomerAddress = request.getParameter("address").toUpperCase();
    String CustomerMobile = request.getParameter("mobile").toUpperCase();
    String img = request.getParameter("customerImage");
    int CustomerMembership = 0;
    int CustomerBlacklisted = 0;
   
    if(CustomerName == null || CustomerName == "" || CustomerAddress == null || CustomerAddress == "" || CustomerMobile == null || CustomerMobile == "" || img == "" || img == null)
    {
    	out.println(0);
    }
    else
    {
    	
    	byte[] imagedata = DatatypeConverter.parseBase64Binary(img.substring(img.indexOf(",") + 1)); 
    	BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata)); 
    	String localPath = "c:/temp";
    	String remotePath = "smb://192.168.1.206/Vendor_Images/"; 
    	String fileName = CustomerName+"_"+CustomerMobile.substring(CustomerMobile.length()-5)+".png";
    	File file= new File(localPath+fileName);	
    	ImageIO.write(bufferedImage, "png",file); 
    	
    	InputStream in = null;
    	OutputStream outStr = null;
    	
    	SmbFile remoteFile = new SmbFile(remotePath+fileName);
    	
    	remoteFile.connect();
    	
    	in = new BufferedInputStream(new FileInputStream(file));
    	outStr = new BufferedOutputStream(new SmbFileOutputStream(remoteFile));
    	
    	byte[] buffer = new byte[4096];
    	int len = 0;
    	while((len = in.read(buffer, 0, buffer.length)) != -1){
    		outStr.write(buffer, 0, len);
    	}
    	outStr.flush();
    	
    	try{
    		if(out != null){
    			outStr.close();
    		}
    		if(in != null){
    			in.close();
    		}
    	}catch(Exception e){}
    	
    	file.delete();
    	
    	 AddCustomer ac = new AddCustomer();
    	 Customer c = new Customer();
    	 c.setName(CustomerName);
    	 c.setAddress(CustomerAddress);
    	 c.setMobile(CustomerMobile);
    	 c.setMembership(CustomerMembership);
    	 c.setBlacklist(CustomerBlacklisted);
    	 c.setPhoto(remotePath+fileName);
    	 
    	 int id = ac.addCustomer(c);
    	   	
    	 c.setId(id);
    	 
    	 JSONObject newCustomerJson = new JSONObject(c);
    	   	
    	 out.print(newCustomerJson);
    	 out.flush();
    }	
%>


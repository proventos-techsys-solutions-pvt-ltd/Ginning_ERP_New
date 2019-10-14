<%@page import="java.io.File"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@ page errorPage="../admin/Error.jsp" %>  
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
   
    if(CustomerName == null || CustomerName == "" || CustomerAddress == null || CustomerAddress == "" || CustomerMobile == null || CustomerMobile == "")
    {
    	out.println("Please enter valid information.");
    }
    else
    {
    	
    	byte[] imagedata = DatatypeConverter.parseBase64Binary(img.substring(img.indexOf(",") + 1)); 
    	BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imagedata)); 
    	//String path= request.getSession().getServletContext().getRealPath("/").concat("images/");
    	String path = "E:/customerImages/";
    	String fileName=CustomerName+"_"+CustomerMobile.substring(CustomerMobile.length()-5)+".png"; 
    	File file= new File(path+fileName);	
    	ImageIO.write(bufferedImage, "png",file); 
    	
    	 AddCustomer ac = new AddCustomer();
    	 Customer c = new Customer();
    	 c.setName(CustomerName);
    	 c.setAddress(CustomerAddress);
    	 c.setMobile(CustomerMobile);
    	 c.setMembership(CustomerMembership);
    	 c.setBlacklist(CustomerBlacklisted);
    	 c.setPhoto(path+fileName);
    	 
    	 int id = ac.addCustomer(c);
    	   	
    	 c.setId(id);
    	 
    	 JSONObject newCustomerJson = new JSONObject(c);
    	   	
    	 out.print(newCustomerJson);
    	 out.flush();
    }
    	
   
   	
%>


<%@page import="com.prov.dbupdation.UpdateCompany"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.prov.bean.StockMast"%>
<%@page import="com.prov.dbinsertion.AddStockMast"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.Company"%>
<%@page import="com.prov.dbinsertion.AddCompany"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%

File file ;
String location = null;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
String filePath = session.getServletContext().getRealPath("/images/");

HashMap<String, String> data = new HashMap<String, String>();

// Verify the content type
String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0)) {
   DiskFileItemFactory factory = new DiskFileItemFactory();
   // maximum size that will be stored in memory
   factory.setSizeThreshold(maxMemSize);
   
   // Location to save data that is larger than maxMemSize.
   factory.setRepository(new File(filePath));

   // Create a new file upload handler
   ServletFileUpload upload = new ServletFileUpload(factory);
   
   // maximum file size to be uploaded.
   upload.setSizeMax( maxFileSize );
   
   try { 
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);

      // Process the uploaded file items
      Iterator i = fileItems.iterator();

      while ( i.hasNext () ) {
         FileItem fi = (FileItem)i.next();
         if ( !fi.isFormField () ) {
           	continue;
         }
         else{
         	
         	data.put(fi.getFieldName(), fi.getString());
         	
         }
      }
      
  	System.out.println(data);
      
 	
 	Company c = new Company();
 	
 	c.setId(Integer.parseInt(data.get("id").toUpperCase()));
  	c.setName(data.get("name").toUpperCase());
 	c.setAddress(data.get("address").toUpperCase());
 	c.setCity(data.get("city").toUpperCase());
 	c.setState(data.get("state").toUpperCase());
 	c.setPan(data.get("pan").toUpperCase());
 	c.setTan(data.get("tan").toUpperCase());
 	c.setCin(data.get("cin").toUpperCase());
 	c.setGst(data.get("gst").toUpperCase());
 	c.setTelephone(data.get("telephone"));
 	c.setMobile(data.get("mobile"));
 	c.setEmail(data.get("email"));
 	c.setInvoiceSeries(data.get("invoiceSeries").toUpperCase());
 	
 	UpdateCompany uc = new UpdateCompany();
	
	int rows = uc.updateCompany(c);

/*    	Company c = new Company();

    	c.setId(Integer.parseInt(request.getParameter("id")));
     	c.setName(request.getParameter("name").toUpperCase());
    	c.setAddress(request.getParameter("address").toUpperCase());
    	c.setCity(request.getParameter("city").toUpperCase());
    	c.setState(request.getParameter("state").toUpperCase());
    	c.setPan(request.getParameter("pan").toUpperCase());
    	c.setTan(request.getParameter("tan").toUpperCase());
    	c.setCin(request.getParameter("cin").toUpperCase());
    	c.setGst(request.getParameter("gst").toUpperCase());
    	c.setTelephone(request.getParameter("telephone"));
    	c.setMobile(request.getParameter("mobile"));
    	c.setEmail(request.getParameter("email"));
    	c.setInvoiceSeries(request.getParameter("invoiceSeries").toUpperCase());
    	
    	UpdateCompany uc = new UpdateCompany();
    	
    	int rows = uc.updateCompany(c);
    	
    	*/
    	
    	session.setAttribute("companyId", Integer.toString(rows));
	    response.sendRedirect("../admin/Setup_Companies.jsp");

   } catch(Exception ex) {
       System.out.println(ex);
    }
 }
%>
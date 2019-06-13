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
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");
   Map<String, String> data = new TreeMap<String, String>();

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File(context.getInitParameter("file-upload")));

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
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               location = filePath+fileName;
            }
            else{
            	
            	data.put(fi.getFieldName(), fi.getString());
            	
            }
         }
         
     	System.out.println(data);
         
    	
    	Company c = new Company();
    	
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
    	c.setLogoPath(location); 
    	
    	AddCompany ac = new AddCompany();
    	
    	ac.addCompany(c);
    	
    	response.sendRedirect("../views/SetupCompanies.jsp");
    	
      } catch(Exception ex) {
         System.out.println(ex);
         
      }
      
   }
   
%>
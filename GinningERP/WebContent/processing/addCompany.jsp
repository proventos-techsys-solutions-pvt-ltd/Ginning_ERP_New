<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddAccountName"%>
<%@page import="com.prov.bean.AccountName"%>
<%@page import="com.prov.dbinsertion.AddGeneralLedger"%>
<%@page import="com.prov.bean.GeneralLedger"%>
<%@ page errorPage="../admin/Error.jsp" %>  
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
               location = fileName;
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
    	c.setInvoiceSeries(data.get("invoiceSeries").toUpperCase());
    	c.setLogoPath(location); 
    	
    	AddCompany ac = new AddCompany();
    	int companyId = 0;
    	
    	companyId = ac.addCompany(c);
    	
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	Date date = new Date();
    	String todaysDate = dateFormat.format(date); 
    	
    	StockMast sm = new StockMast();
    	
		sm.setCompanyId(companyId);
		sm.setStockDate(todaysDate);
		sm.setRawCotton(0);
		sm.setCottonBales(0);
		sm.setCottonCakes(0);
		sm.setCottonSeed(0);
		sm.setCottonSeedOil(0);
		sm.setAvgRate(0);
    	
    	AddStockMast addStockMast = new AddStockMast();
    	
    	addStockMast.addStockMast(sm);
    	
    	String companyAccountLedgerName = c.getName() + " PURCHASE ACCOUNT";
    	String companyAccountLedgerDesc = c.getName() + " RAW COTTON PURCHASE ACCOUNT";
    	
    	GeneralLedger glPurchaseAccount = new GeneralLedger();
       	AccountName anPurchase = new AccountName();

    	
       	anPurchase.setAccountLedger(companyAccountLedgerName);
       	anPurchase.setCompanyId(companyId);
       	anPurchase.setAccCategoryId(5);
       	anPurchase.setLedgerDesc(companyAccountLedgerDesc);
       	anPurchase.setLedgerDate(todaysDate);
       	anPurchase.setBankId(0);
       	anPurchase.setOpeningBal(0);
    	

   		AddAccountName addAccount = new AddAccountName();
   		
   		int accPurchaseId = addAccount.addAccountName(anPurchase);
    	
   		glPurchaseAccount.setAccNameId(accPurchaseId);
    	glPurchaseAccount.setGlDate(todaysDate);
    	glPurchaseAccount.setOpeningBal(0);
   	 	glPurchaseAccount.setCredit(0);
   		glPurchaseAccount.setDebit(0);
   		glPurchaseAccount.setClosingBal(0);
   		
	   	AddGeneralLedger addGl = new AddGeneralLedger();
	     
	    addGl.addGeneralLedger(glPurchaseAccount);
	    
	    String companyAccountPayableName = c.getName() + " - ACCOUNTS PAYABLE";
    	String companyAccountPayableDesc = c.getName() + " - PAYABLE ACCOUNTS";
    	
    	GeneralLedger glAccountPayable = new GeneralLedger();
    	AccountName anPayable = new AccountName();
 	    
 	    anPayable.setAccountLedger(companyAccountPayableName);
 	    anPayable.setCompanyId(companyId);
 	    anPayable.setAccCategoryId(6);
 	    anPayable.setLedgerDesc(companyAccountPayableDesc);
 	    anPayable.setLedgerDate(todaysDate);
 	    anPayable.setBankId(0);
 	    anPayable.setOpeningBal(0);
	    
   		int accPayableId = addAccount.addAccountName(anPayable);

   		glAccountPayable.setAccNameId(accPayableId);
		glAccountPayable.setGlDate(todaysDate);
		glAccountPayable.setOpeningBal(0);
		glAccountPayable.setCredit(0);
		glAccountPayable.setDebit(0);
		glAccountPayable.setClosingBal(0);
	    
	    addGl.addGeneralLedger(glAccountPayable);
    	
    	session.setAttribute("companyId", Integer.toString(companyId));
	    response.sendRedirect("../admin/Setup_Companies.jsp");
      } catch(Exception ex) {
         System.out.println(ex);
      }
   }
   
%>
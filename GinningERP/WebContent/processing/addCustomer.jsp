<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.dbinsertion.AddCustomer"%>
<%@page import="com.prov.bean.Customer"%>

<% 
    String CustomerName = request.getParameter("name").toUpperCase();
    String CustomerAddress = request.getParameter("address").toUpperCase();
    String CustomerCity = request.getParameter("mobile").toUpperCase();
    int CustomerMembership = 0;
    int CustomerBlacklisted = 0;
   
    if(CustomerName == null || CustomerName == "" || CustomerAddress == null || CustomerAddress == "" || CustomerCity == null || CustomerCity == "")
    {
    	out.println("Please enter valid information.");
    }
    else
    {
    	 AddCustomer ac = new AddCustomer();
    	 Customer c = new Customer();
    	 c.setName(CustomerName);
    	 c.setAddress(CustomerAddress);
    	 c.setMobile(CustomerCity);
    	 c.setMembership(CustomerMembership);
    	 c.setBlacklist(CustomerBlacklisted);
    	    
    	 int id = ac.addCustomer(c);
    	   	
    	 c.setId(id);
    	 
    	 JSONObject newCustomerJson = new JSONObject(c);
    	   	
    	 out.print(newCustomerJson);
    	 out.flush();
    }
    	
   
   	
%>


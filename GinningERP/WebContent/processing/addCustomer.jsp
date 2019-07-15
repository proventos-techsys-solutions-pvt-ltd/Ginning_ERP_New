<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.dbinsertion.AddCustomer"%>
<%@page import="com.prov.bean.Customer"%>

<% 
    String CustomerName = request.getParameter("name").toUpperCase();
    String CustomerAddress = request.getParameter("address").toUpperCase();
    String CustomerCity = request.getParameter("mobile").toUpperCase();
    int CustomerMembership = Integer.parseInt(request.getParameter("membership"));
    int CustomerBlacklisted = Integer.parseInt(request.getParameter("blacklist"));
   
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


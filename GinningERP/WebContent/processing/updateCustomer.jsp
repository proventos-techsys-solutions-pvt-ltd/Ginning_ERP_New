<%@page import="com.prov.dbupdation.UpdateCustomer"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.prov.bean.Customer"%>

<% 
	int customerId = Integer.parseInt(request.getParameter("customerId"));
    String CustomerName = request.getParameter("name").toUpperCase();
    String CustomerAddress = request.getParameter("address").toUpperCase();
    String CustomerCity = request.getParameter("mobile").toUpperCase();
    int CustomerMembership;
    int CustomerBlacklisted;

    if(request.getParameter("membership") == null || request.getParameter("membership") == ""){
    	CustomerMembership=0;
    }else
    {
    	CustomerMembership = Integer.parseInt(request.getParameter("membership"));
    }
    if(request.getParameter("blacklist") == null || request.getParameter("blacklist") == ""){
    	CustomerBlacklisted=0;
    }else
    {
    	CustomerBlacklisted = Integer.parseInt(request.getParameter("blacklist"));
    }
   
    if(CustomerName == null || CustomerName == "" || CustomerAddress == null || CustomerAddress == "" || CustomerCity == null || CustomerCity == "")
    {
    	out.println("Please enter valid information.");
    }
    else
    {
    	UpdateCustomer uc = new UpdateCustomer();
    	 Customer c = new Customer();
    	 c.setId(customerId);
    	 c.setName(CustomerName);
    	 c.setAddress(CustomerAddress);
    	 c.setMobile(CustomerCity);
    	 c.setMembership(CustomerMembership);
    	 c.setBlacklist(CustomerBlacklisted);
    	    
    	 int id = uc.updateCustomer(c);
    	   	
    	 c.setId(id);
    	 
    	request.setAttribute("customerId", Integer.toString(id));
		request.getRequestDispatcher("../views/VendorMaster.jsp").forward(request,response);
    	
    }
    	
   
   	
%>


<%@page import="com.prov.dbinsertion.AddCustomer" %>
<%@page import="com.prov.bean.Customer" %>

<% 
    String CustomerName = request.getParameter("Name").toUpperCase();
    String CustomerAddress = request.getParameter("Address").toUpperCase();
    String CustomerCity = request.getParameter("Mobile").toUpperCase();
   
	
    AddCustomer ac = new AddCustomer();
    Customer c = new Customer();
    c.setName(CustomerName);
    c.setAddress(CustomerAddress);
    c.setMobile(CustomerCity);
    
   	ac.addCustomer(c);
   	
   	response.sendRedirect("masters/PartyMaster.jsp");
%>


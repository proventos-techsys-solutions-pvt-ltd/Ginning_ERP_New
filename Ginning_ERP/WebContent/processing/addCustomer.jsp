<%@page import="com.prov.dbinsertion.AddCustomer" %>
<%@page import="com.prov.bean.Customer" %>

<% 
    String CustomerName = request.getParameter("name").toUpperCase();
    String CustomerAddress = request.getParameter("address").toUpperCase();
    String CustomerCity = request.getParameter("mobile").toUpperCase();
   
	
    AddCustomer ac = new AddCustomer();
    Customer c = new Customer();
    c.setName(CustomerName);
    c.setAddress(CustomerAddress);
    c.setMobile(CustomerCity);
    
   	ac.addCustomer(c);
   	
   	response.sendRedirect("../jsp/GenerateRST.jsp");
%>


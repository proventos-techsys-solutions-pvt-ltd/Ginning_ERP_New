<%@page import="com.prov.dbinsertion.AddUser" %>
<%@page import="com.prov.bean.User" %>

<% 
    String Username = request.getParameter("Name").toUpperCase();
    String UserName = request.getParameter("Username").toUpperCase();
    String UserPassword = request.getParameter("Password").toUpperCase();
    String UserRole = request.getParameter("Role").toUpperCase();

   
	
    AddUser au = new AddUser();
    User u = new User();
    u.setName(Username);
    u.setUsername(UserName);
    u.setPassword(UserPassword);
    u.setRole(UserRole);
    
   	au.addUser(u);
   	
   	response.sendRedirect("masters/PartyMaster.jsp");
%>

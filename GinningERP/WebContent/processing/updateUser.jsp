<%@page import="com.prov.dbupdation.UpdateUser"%>
<%@page import="com.prov.bean.User"%>
<%@page import="com.prov.dbinsertion.AddUser"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 

	String Name = request.getParameter("name").toUpperCase();
	String UserName = request.getParameter("username");
	String UserPassword = request.getParameter("password");
	int UserRole = Integer.parseInt(request.getParameter("role"));
	int userId = Integer.parseInt(request.getParameter("id"));
	
	if(Name == null || Name == "" || UserName == null || UserName == "" || UserPassword == null || UserPassword == "" )
	{
		out.println("Please enter valid information.");
	}
	else{
		
	    UpdateUser uu = new UpdateUser();
	    User u = new User();
	    u.setId(userId);
	    u.setName(Name);
	    u.setUsername(UserName);
	    u.setPassword(UserPassword);
	    u.setRole(UserRole);
	    
	    userId = uu.updateUser(u);
	   	
	   	session.setAttribute("userId", Integer.toString(userId));
	   	response.sendRedirect("../admin/NewUserRegistration.jsp");
	}
	
%>

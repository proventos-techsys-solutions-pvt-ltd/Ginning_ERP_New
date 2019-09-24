<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddUser" %>
<%@page import="com.prov.bean.User" %>

<% 
    String Username = request.getParameter("name").toUpperCase();
    String UserName = request.getParameter("username").toUpperCase();
    String UserPassword = request.getParameter("password").toUpperCase();
    String UserRole = request.getParameter("role").toUpperCase();

    if(Username == null || Username == "" || UserName == null || UserName == "" || UserPassword == null || UserPassword == "" || UserRole == null || UserRole == "")
    {
    	out.println("Please enter valid information.");
    }
    else{
    	
	    AddUser au = new AddUser();
	    User u = new User();
	    u.setName(Username);
	    u.setUsername(UserName);
	    u.setPassword(UserPassword);
	    u.setRole(UserRole);
	    
	   int userId = au.addUser(u);
	   	
	   	session.setAttribute("userId", Integer.toString(userId));
	   	response.sendRedirect("../admin/NewUserRegistration.jsp");
    }
%>


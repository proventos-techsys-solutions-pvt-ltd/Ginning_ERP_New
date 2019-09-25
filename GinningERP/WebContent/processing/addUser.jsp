<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddUser" %>
<%@page import="com.prov.bean.User" %>

<% 
    String Name = request.getParameter("name").toUpperCase();
    String UserName = request.getParameter("username");
    String UserPassword = request.getParameter("password");
    int UserRole = Integer.parseInt(request.getParameter("role"));

    if(Name == null || Name == "" || UserName == null || UserName == "" || UserPassword == null || UserPassword == "" )
    {
    	out.println("Please enter valid information.");
    }
    else{
    	
	    AddUser au = new AddUser();
	    User u = new User();
	    u.setName(Name);
	    u.setUsername(UserName);
	    u.setPassword(UserPassword);
	    u.setRole(UserRole);
	    
	   int userId = au.addUser(u);
	   	
	   	session.setAttribute("userId", Integer.toString(userId));
	   	response.sendRedirect("../admin/NewUserRegistration.jsp");
    }
%>


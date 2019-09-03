<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbinsertion.AddUser" %>
<%@page import="com.prov.bean.User" %>

<% 
    String Username = request.getParameter("Name").toUpperCase();
    String UserName = request.getParameter("Username").toUpperCase();
    String UserPassword = request.getParameter("Password").toUpperCase();
    String UserRole = request.getParameter("Role").toUpperCase();

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
	   	response.sendRedirect("../admin/Dashboard.jsp");
    }
%>


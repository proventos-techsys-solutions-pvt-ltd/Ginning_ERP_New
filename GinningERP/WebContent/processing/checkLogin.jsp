<%@page import="com.prov.dbops.Login" %>
<% 
	String role = request.getParameter("role");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    System.out.println(role + username + password);
    
    if(username == "" || username == null || password == "" || password == null)
    {
		out.println("Please enter valid information.");
    }
    else{	
    	
    Login cl = new Login();
    int loginCheck = 0;
    loginCheck = cl.checkLogin(username, password);
    System.out.println(loginCheck);
    if(loginCheck>0){
        response.sendRedirect("../views/GenerateRST.jsp");
    }else{
        response.sendRedirect("../Login.html");
    }
    }
    
%>
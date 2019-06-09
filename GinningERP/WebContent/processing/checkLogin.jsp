<%@page import="com.prov.dbops.Login" %>
<% 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    if(username == "" || username == null || password == "" || password == null)
    {
		out.println("Please enter valid information.");
    }
    else{	
    	
    Login cl = new Login();
    int loginCheck = cl.checkLogin(username, password);
    if(loginCheck>0){
        response.sendRedirect("home.jsp");
    }else{
        response.sendRedirect("index.jsp");
    }
    }
    
%>
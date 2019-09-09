<%@ page errorPage="../admin/Error.jsp" %>  
<%@page import="com.prov.dbops.Login" %>
<% 
	String mod = request.getParameter("moduleId");
	String role = request.getParameter("role");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    
    	  if(username == "" || username == null || password == "" || password == null)
    	    {
    			out.println("Please enter valid information.");
    	    }
    	    else{	
    		    Login cl = new Login();
    		    int loginCheck = 0;
    		    loginCheck = cl.checkLogin(username, password);
    		    if(loginCheck>0){
    		        response.sendRedirect("../admin/Dashboard.jsp");
    		    }else{
    		        response.sendRedirect("../Login.html");
    		    }
    	    }
    
    
    
  
    
%>
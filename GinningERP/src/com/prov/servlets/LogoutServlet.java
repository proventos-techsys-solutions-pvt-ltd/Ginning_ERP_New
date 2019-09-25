package com.prov.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.prov.bean.User;
import com.prov.dbupdation.UpdateUser;


public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
         PrintWriter out=response.getWriter();  
           
         //request.getRequestDispatcher("link.html").include(request, response);  
           
         HttpSession session=request.getSession(); 
         User user = (User)session.getAttribute("currentSessionUser");
         session.invalidate();
         
         UpdateUser update = new UpdateUser();
         
         update.logoutUser(user);
           
         response.sendRedirect("Login.html");  
           
         out.close();  
	}
}

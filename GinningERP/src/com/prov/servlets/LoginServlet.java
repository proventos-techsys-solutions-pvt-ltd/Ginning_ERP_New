package com.prov.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.prov.bean.User;
import com.prov.dbops.Login;
import com.prov.weighing.SerialReaderRunnable;
import com.prov.weighing.TwoWaySerialCommThread;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
	           throws ServletException, java.io.IOException {
	
		try
		{	    
			User user = new User();
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			
			user = Login.checkLogin(user);
				    
			if (user.isValid())
			{
				HttpSession session = request.getSession(true);	    
				session.setAttribute("currentSessionUser",user); 
				if(user.getRole() == 1) {
					response.sendRedirect("admin/Dashboard.jsp"); //logged-in page  
				}else if(user.getRole() == 2) {
					SerialReaderRunnable serialReaderObj = null;
					 try
				        {
				         serialReaderObj =  (new TwoWaySerialCommThread()).connect("COM1");
				        }
				        catch ( Exception e )
				        {
				            // TODO Auto-generated catch block
				            e.printStackTrace();
				        }
					 user.setSr(serialReaderObj);
					response.sendRedirect("wb_operator/GenerateRST.jsp"); //logged-in page  
				}else if(user.getRole() == 3) {
					response.sendRedirect("accounts_operation_view/Payment.jsp"); //logged-in page  
				}
				    		
			}else { 
				response.sendRedirect("Login.html"); //error page 
			}
		} catch (Throwable theException) 	    
		{
			System.out.println(theException); 
		}
	}
}

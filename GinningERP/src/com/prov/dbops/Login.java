package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.User;
import com.prov.db.OracleConnection;

public class Login {
	
	public static User checkLogin(User bean) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String username = bean.getUsername();
		String password = bean.getPassword();
		
		String searchQuery = "SELECT * FROM USERS WHERE USERNAME=? AND PASSWORD=?";
	      try 
	      {
	         //connect to DB 
	         stmt=con.prepareStatement(searchQuery);
	         stmt.setString(1, username);
	         stmt.setString(2, password);
	         rs = stmt.executeQuery();	        
	         boolean more = rs.next();
		       
	         // if user does not exist set the isValid variable to false
	         if (!more) 
	         {
	            bean.setValid(false);
	         } 
		        
	         //if user exists set the isValid variable to true
	         else if (more) 
	         {
	            String name = rs.getString("NAME");
	            int role = rs.getInt("ROLE");
	            int id = rs.getInt("ID");
		     	
	            bean.setId(id);
	            bean.setName(name);
	            bean.setRole(role);
	            bean.setStatus(1);
	            bean.setValid(true);
	            
	            String statusSql = "UPDATE USERS SET STATUS=1 WHERE ID="+bean.getId();
	            
	            PreparedStatement stmtStatus;
	            
	            stmtStatus = con.prepareStatement(statusSql);
	            
	            stmtStatus.executeUpdate();
	            
	            stmtStatus.close();
	            
	         }
	      } 

	      catch (Exception ex) 
	      {
	         System.out.println("Log In failed: An Exception has occurred! " + ex);
	      } 
		    
	      //some exception handling
	      finally 
	      {
	         if (rs != null)	{
	            try {
	               rs.close();
	            } catch (Exception e) {}
	               rs = null;
	            }
		
	         if (stmt != null) {
	            try {
	               stmt.close();
	            } catch (Exception e) {}
	               stmt = null;
	            }
		
	         if (con != null) {
	            try {
	            	con.close();
	            } catch (Exception e) {
	            }

	            con = null;
	         }
	      }

	return bean;
	}

}

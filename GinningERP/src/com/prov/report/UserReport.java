package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.prov.bean.User;
import com.prov.db.OracleConnection;

public class UserReport {
	
	public ArrayList<User> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<User> userList = new ArrayList<User>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT NAME, STATUS FROM USERS ORDER BY STATUS DESC";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				
				User user = new User();
				
				user.setName(rs.getString(1));
				user.setStatus(rs.getInt(2));
				
				userList.add(user);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	

	public ArrayList<User> getAllUsers() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<User> userList = new ArrayList<User>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT NAME,\r\n" + 
						"USERNAME,\r\n" + 
						"ID,\r\n" + 
						"ROLE,\r\n" + 
						"STATUS,"+ 
						"PASSWORD"+ 
						" FROM USERS ORDER BY NAME";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				User user = new User();
				
				user.setName(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setId(rs.getInt(3));
				user.setRole(rs.getInt(4));
				user.setStatus(rs.getInt(5));
				user.setPassword(rs.getString(6));
				
				userList.add(user);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}


}

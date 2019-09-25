package com.prov.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class DeleteUser {
	
	public int deleteUser(int userId) {
		
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "DELETE USERS WHERE ID=?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(deleteSql);
			
			stmt.setInt(1, userId);
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Deletion Succesful-"+userId);
			} catch (SQLException e) {
			return 0;
		}
		
		return userId;
		
	}

}

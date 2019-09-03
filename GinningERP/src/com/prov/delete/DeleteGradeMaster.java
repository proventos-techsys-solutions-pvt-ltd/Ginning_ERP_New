package com.prov.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class DeleteGradeMaster {
	
	public int deleteGrade(int gradeId) {
		
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "DELETE GRADE_MASTER WHERE ID=?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(deleteSql);
			
			stmt.setInt(1, gradeId);
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Deletion Succesful-"+gradeId);
			} catch (SQLException e) {
			return 0;
		}
		
		return gradeId;
		
	}

}

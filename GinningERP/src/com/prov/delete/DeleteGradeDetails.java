package com.prov.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class DeleteGradeDetails {
	
	public int deleteGradeDetails(int weighmentId) {

		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "DELETE GRADE_DETAILS WHERE WEIGHMENT_ID=?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(deleteSql);
			
			stmt.setInt(1, weighmentId);
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Deletion Succesful -- "+weighmentId);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return weighmentId;
		
	}

}

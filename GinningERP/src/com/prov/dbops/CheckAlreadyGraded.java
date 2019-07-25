package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class CheckAlreadyGraded {

	public int alreadyGraded(int rst) {
		Connection con = null;
		ResultSet rs = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String rstCheck = "SELECT COUNT(*) FROM GRADE_DETAILS WHERE RST = ?";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(rstCheck);
			stmt.setInt(1, rst);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				rowCount = rs.getInt(1);
			}
			stmt.close();
			con.close();	
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowCount;
	}

}

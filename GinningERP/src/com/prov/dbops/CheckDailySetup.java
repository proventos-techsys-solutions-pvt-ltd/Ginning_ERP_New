package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class CheckDailySetup {
	
	public int checkDailySetupCompleted() {
		Connection con = null;
		ResultSet rs = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String rstCheck = "SELECT COUNT(*) RECORDS FROM DAILY_SETUP WHERE TRUNC(SETUP_DATE) = TRUNC(SYSDATE)";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(rstCheck);
			
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

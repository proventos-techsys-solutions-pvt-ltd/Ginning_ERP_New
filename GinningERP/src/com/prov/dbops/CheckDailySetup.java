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
	
		String rstCheck = "SELECT COALESCE( (SELECT to_char(id) id FROM DAILY_SETUP WHERE SETUP_DATE = (select max(setup_date) from daily_setup) and trunc(setup_date)>trunc(sysdate-1)), '0') as ds_id from dual";
		
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

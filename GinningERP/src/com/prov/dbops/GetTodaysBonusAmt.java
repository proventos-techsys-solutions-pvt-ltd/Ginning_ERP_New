package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.db.OracleConnection;

public class GetTodaysBonusAmt {

	public float getBonusAmt() {
		Connection con = null;
		float bonus = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String getBonusAmt = "SELECT bonus_amount FROM DAILY_SETUP WHERE SETUP_DATE = (SELECT MAX(SETUP_DATE) FROM DAILY_SETUP)";
		PreparedStatement stmt;
		ResultSet rs=null;
		try {
			
			stmt = con.prepareStatement(getBonusAmt);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				bonus=rs.getFloat(1);
			}
			stmt.close();
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
		}
		return bonus;
	}
}

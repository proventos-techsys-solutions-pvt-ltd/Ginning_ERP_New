package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class CheckWeighment {
	
	public int checkGrossWtCompleted(int rst) {
		Connection con = null;
		ResultSet rs = null;
		double gross = 0;
		int grossWtFlag = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String rstCheck = "SELECT GROSS FROM WEIGH_MAST WHERE RST = ?";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(rstCheck);
			stmt.setInt(1, rst);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				gross = rs.getDouble(1);
			}
			stmt.close();
			con.close();
			
			if(gross>0) {
				grossWtFlag = 1;
			}else if(gross <= 0) {
				grossWtFlag = 0;
			}
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return grossWtFlag;
	}
	
	public int checkTareWtCompleted(int rst) {
		Connection con = null;
		ResultSet rs = null;
		double tare = 0;
		int tareWtFlag = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String rstCheck = "SELECT TARE FROM WEIGH_MAST WHERE RST = ?";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(rstCheck);
			stmt.setInt(1, rst);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				tare = rs.getDouble(1);
			}
			stmt.close();
			con.close();
			
			if(tare>0) {
				tareWtFlag = 1;
			}else if(tare <= 0) {
				tareWtFlag = 0;
			}
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return tareWtFlag;
	}


}

package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.DailySetup;
import com.prov.db.OracleConnection;

public class DailySetupReport {
	
	public DailySetup LatestDailySetup() {
		
		ResultSet rs = null;
		Connection con = null;
		
		DailySetup ds = new DailySetup();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM DAILY_SETUP WHERE SETUP_DATE = (SELECT MAX(SETUP_DATE) FROM DAILY_SETUP)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				ds.setId(rs.getInt(1));
				ds.setSetupDate(rs.getString(2));
				ds.setCottonHeap(rs.getString(3));
				ds.setCompanyId(rs.getInt(4));
				ds.setBankId(rs.getInt(5));
				ds.setFirstChequeNo(rs.getInt(6));
				ds.setLastChequeNo(rs.getInt(7));
				ds.setTotalCheques(rs.getInt(8));
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ds;
	}
	
	public DailySetup getTodaysDailySetup() {

		ResultSet rs = null;
		Connection con = null;
		
		DailySetup ds = new DailySetup();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM DAILY_SETUP WHERE TRUNC(SETUP_DATE) = TRUNC(SYSDATE)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				ds.setId(rs.getInt(1));
				ds.setSetupDate(rs.getString(2));
				ds.setCottonHeap(rs.getString(3));
				ds.setCompanyId(rs.getInt(4));
				ds.setBankId(rs.getInt(5));
				ds.setFirstChequeNo(rs.getInt(6));
				ds.setLastChequeNo(rs.getInt(7));
				ds.setTotalCheques(rs.getInt(8));
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ds;
	}

}

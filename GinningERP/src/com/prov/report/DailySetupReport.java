package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
				ds.setFirstChequeNo(rs.getString(6));
				ds.setLastChequeNo(rs.getString(7));
				ds.setTotalCheques(rs.getInt(8));
				ds.setBonusAmount(rs.getFloat(9));
				ds.setDiscardTime(rs.getString(10));
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ds;
	}
	
	public ArrayList<DailySetup> getTodaysDailySetups() {

		ResultSet rs = null;
		Connection con = null;
		ArrayList<DailySetup> todaysSetups = new ArrayList<DailySetup>();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM DAILY_SETUP WHERE TRUNC(SETUP_DATE) = trunc(current_timestamp)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			
			while (rs.next()) {
				DailySetup ds = new DailySetup();

				ds.setId(rs.getInt(1));
				
				Timestamp setupTimeStamp = rs.getTimestamp(2);
				
				Date setupDate = setupTimeStamp;
				String setupTimeStr = sdf.format(setupDate);
				String[] setupTimeArr = setupTimeStr.split(" ");
				
				ds.setSetupDate(setupTimeArr[0]);
				ds.setSetupTime(setupTimeArr[1]);
				ds.setCottonHeap(rs.getString(3));
				ds.setCompanyId(rs.getInt(4));
				ds.setBankId(rs.getInt(5));
				ds.setFirstChequeNo(rs.getString(6));
				ds.setLastChequeNo(rs.getString(7));
				ds.setTotalCheques(rs.getInt(8));
				ds.setBonusAmount(rs.getFloat(9));
				
				if(rs.getString(10) != null) {
					Timestamp discardTimeStamp = rs.getTimestamp(10);
					
					Date discardDate = discardTimeStamp;
					String discardTimeStr = sdf.format(discardDate);
					String[] discardTimeArr = discardTimeStr.split(" ");
					ds.setDiscardTime(discardTimeArr[1]);
				}else {
					ds.setDiscardTime(null);
				}
				
				todaysSetups.add(ds);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return todaysSetups;
	}
	

}

package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

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
	
	public JSONArray getTodaysDailySetups() {

		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArray = new JSONArray();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
					"DS.ID,\r\n" + 
					"DS.SETUP_DATE,\r\n" + 
					"DS.COTTON_HEAP,\r\n" + 
					"DS.COMPANY_ID,\r\n" + 
					"DS.BANK_ID,\r\n" + 
					"DS.FIRST_CHEQUE_NO,\r\n" + 
					"DS.LAST_CHEQUE_NO,\r\n" + 
					"DS.TOTAL_CHEQUES,\r\n" + 
					"DS.BONUS_AMOUNT,\r\n" + 
					"DS.DISCARD_DATE,\r\n" + 
					"COMP.NAME,\r\n" + 
					"BM.BANK_NAME\r\n" + 
					"FROM \r\n" + 
					"DAILY_SETUP DS,\r\n" + 
					"COMPANY_MASTER COMP,\r\n" + 
					"BANK_MAST BM\r\n" + 
					"WHERE \r\n" + 
					"ds.company_id = comp.id AND\r\n" + 
					"bm.id = ds.bank_id AND\r\n" + 
					"TRUNC(SETUP_DATE) = trunc(current_timestamp) order by setup_date";
			
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
				
				JSONObject obj = new JSONObject(ds);
				obj.put("companyName", rs.getString(11));
				obj.put("bankName", rs.getString(12));
				
				jsonArray.put(obj);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	

}

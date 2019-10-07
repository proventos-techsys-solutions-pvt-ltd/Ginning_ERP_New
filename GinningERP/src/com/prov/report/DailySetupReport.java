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
					"an.account_id\r\n" + 
					"FROM DAILY_SETUP DS, ACCOUNT_NAME AN\r\n" + 
					"WHERE SETUP_DATE = (SELECT MAX(SETUP_DATE) FROM DAILY_SETUP) AND\r\n" + 
					"AN.COMPANY_ID = DS.COMPANY_ID AND\r\n" + 
					"AN.ACC_CATEGORY_ID = 6";
			
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
				ds.setAccPayableId(rs.getInt(11));
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
			
			for (int i=0;i<jsonArray.length();i++) {
				
				 String sql2 = "select count(wm.id) from weigh_mast wm, daily_setup ds where wm.ds_id = ds.id and ds.id = ?";
				 stmt = con.prepareStatement(sql2);
				 stmt.setInt(1, ((JSONObject)jsonArray.getJSONObject(i)).getInt("id"));
				 rs = stmt.executeQuery();
				 while (rs.next()) {
					 
					 ((JSONObject)jsonArray.getJSONObject(i)).put("weighmentEntries",  rs.getString(1));
				}
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JSONArray getDailySetupReport() {

		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArray = new JSONArray();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
						"DS.ID,\r\n" + 
						"DS.SETUP_DATE,\r\n" + 
						"DS.COTTON_HEAP,\r\n" + 
						"DS.COMPANY_ID,\r\n" + 
						"DS.BANK_ID,\r\n" + 
						"DS.FIRST_CHEQUE_NO,\r\n" + 
						"DS.LAST_CHEQUE_NO,\r\n" + 
						"DS.TOTAL_CHEQUES,\r\n" + 
						"DS.BONUS_AMOUNT,\r\n" + 
						"CM.NAME,\r\n" + 
						"BM.BANK_NAME,\r\n" + 
						"GRM.RATE\r\n" + 
						"FROM \r\n" + 
						"DAILY_SETUP DS,\r\n" + 
						"COMPANY_MASTER CM,\r\n" + 
						"BANK_MAST BM,\r\n" + 
						"GRADE_RATE_MASTER GRM\r\n" + 
						"WHERE\r\n" + 
						"DS.COMPANY_ID = CM.ID AND\r\n" + 
						"DS.BANK_ID = BM.ID AND\r\n" + 
						"DS.SETUP_DATE = GRM.RATE_DATE AND \r\n" + 
						"GRM.GRADE_ID = 1\r\n" + 
						"ORDER BY\r\n" + 
						"SETUP_DATE DESC";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			SimpleDateFormat sdf0 = new SimpleDateFormat("dd-MM-yyyy");
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
			
			while (rs.next()) {
				
				
				DailySetup ds = new DailySetup();

				ds.setId(rs.getInt(1));
				
				Timestamp setupTimeStamp = rs.getTimestamp(2);
				
				Date setupDate = setupTimeStamp;
				String setupTimeStr = sdf.format(setupDate);
				String[] setupTimeArr = setupTimeStr.split(" ");
				
				Date date = sdf0.parse(setupTimeArr[0]);
				
				String dateStr = sdf1.format(date);
				
				ds.setSetupDate(dateStr);
				ds.setSetupTime(setupTimeArr[1]);
				ds.setCottonHeap(rs.getString(3));
				ds.setCompanyId(rs.getInt(4));
				ds.setBankId(rs.getInt(5));
				ds.setFirstChequeNo(rs.getString(6));
				ds.setLastChequeNo(rs.getString(7));
				ds.setTotalCheques(rs.getInt(8));
				ds.setBonusAmount(rs.getFloat(9));
				
				JSONObject obj = new JSONObject(ds);
				obj.put("companyName", rs.getString(10));
				obj.put("bankName", rs.getString(11));
				obj.put("gradeRate", rs.getString(12));
				
				jsonArray.put(obj);
			}
			
			System.out.println(jsonArray);
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}

}

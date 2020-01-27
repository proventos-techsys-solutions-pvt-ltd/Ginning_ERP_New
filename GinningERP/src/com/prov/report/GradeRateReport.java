package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.GradeRateMaster;
import com.prov.db.OracleConnection;

public class GradeRateReport {
	
	public ArrayList<GradeRateMaster> getTodaysRates() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<GradeRateMaster> gradeRateList = new ArrayList<GradeRateMaster>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    *\r\n" + 
					"FROM\r\n" + 
					"    GRADE_RATE_MASTER\r\n" + 
					"WHERE\r\n" + 
					"    RATE_DATE = (\r\n" + 
					"        SELECT\r\n" + 
					"            MAX(RATE_DATE)\r\n" + 
					"        FROM\r\n" + 
					"            GRADE_RATE_MASTER\r\n" + 
					"    )\r\n" + 
					"    ORDER BY RATE DESC";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				GradeRateMaster grm = new GradeRateMaster();
				
				grm.setId(rs.getInt(1));
				grm.setRateDate(rs.getString(2));
				grm.setGradeId(rs.getInt(3));
				grm.setRate(rs.getDouble(4));
				
				gradeRateList.add(grm);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gradeRateList;
	}
	
	public GradeRateMaster getTodaysSuperRate() {
		ResultSet rs = null;
		Connection con = null;
		GradeRateMaster grm = new GradeRateMaster();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
						"    *\r\n" + 
						"FROM\r\n" + 
						"    GRADE_RATE_MASTER\r\n" + 
						"WHERE\r\n" + 
						"    RATE_DATE = (\r\n" + 
						"        SELECT\r\n" + 
						"            MAX(RATE_DATE)\r\n" + 
						"        FROM\r\n" + 
						"            GRADE_RATE_MASTER\r\n" + 
						"    )\r\n" + 
						"    AND RATE = (\r\n" + 
						"        SELECT\r\n" + 
						"            MAX(RATE)\r\n" + 
						"        FROM\r\n" + 
						"            GRADE_RATE_MASTER\r\n" + 
						"        WHERE\r\n" + 
						"            RATE_DATE = (\r\n" + 
						"                SELECT\r\n" + 
						"                    MAX(RATE_DATE)\r\n" + 
						"                FROM\r\n" + 
						"                    GRADE_RATE_MASTER\r\n" + 
						"            )\r\n" + 
						"    )";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				grm.setId(rs.getInt(1));
				grm.setRateDate(rs.getString(2));
				grm.setGradeId(rs.getInt(3));
				grm.setRate(rs.getDouble(4));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return grm;
	}
	
	public JSONArray getTodaysGradeRates() {
		ResultSet rs = null;
		Connection con = null;
		JSONArray array = new JSONArray();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    GM.ID,\r\n" + 
					"    GM.GRADE,\r\n" + 
					"    GR.RATE\r\n" + 
					"FROM\r\n" + 
					"    GRADE_MASTER        GM\r\n" + 
					"    LEFT JOIN GRADE_RATE_MASTER   GR ON GM.ID = GR.GRADE_ID\r\n" + 
					"WHERE\r\n" + 
					"    GR.GRADE_ID IS NULL\r\n" + 
					"    OR GR.RATE_DATE = (\r\n" + 
					"        SELECT\r\n" + 
					"            MAX(RATE_DATE)\r\n" + 
					"        FROM\r\n" + 
					"            GRADE_RATE_MASTER\r\n" + 
					"    )\r\n" + 
					"ORDER BY\r\n" + 
					"    GRADE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();
				
				obj.put("id", rs.getInt(1));
				obj.put("grade", rs.getString(2));
				if(rs.getString(3) == null) {
					obj.put("rate", 0);
				}else {
					obj.put("rate", rs.getString(3));
				}
				
				array.put(obj);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return array;
	}

}

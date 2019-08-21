package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.prov.bean.GradeRateMaster;
import com.prov.db.OracleConnection;

public class GradeRateReport {
	
	public ArrayList<GradeRateMaster> getTodaysRate() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<GradeRateMaster> gradeRateList = new ArrayList<GradeRateMaster>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM GRADE_RATE_MASTER WHERE RATE_DATE = (SELECT MAX(RATE_DATE) FROM GRADE_RATE_MASTER)";
			
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
			
			String sql = "SELECT * FROM GRADE_RATE_MASTER WHERE RATE_DATE = (select max(RATE_DATE) from GRADE_RATE_MASTER) and grade_id=1";
			
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

}

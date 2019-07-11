package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				
				grm.setRateDate(properDate);
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

}

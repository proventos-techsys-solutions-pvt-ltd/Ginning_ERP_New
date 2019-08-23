package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import com.prov.bean.GradeMaster;
import com.prov.db.OracleConnection;

public class GradeReport {
	
	public ArrayList<GradeMaster> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<GradeMaster> gradeList = new ArrayList<GradeMaster>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM GRADE_MASTER ORDER BY GRADE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				GradeMaster gm = new GradeMaster();
				
				gm.setId(rs.getInt(1));
				gm.setGrade(rs.getString(2));
				gm.setDesc(rs.getString(3));
				
				gradeList.add(gm);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(gradeList);
		return gradeList;
	}
}

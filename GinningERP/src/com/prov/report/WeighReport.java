package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.WeighMast;
import com.prov.db.OracleConnection;

public class WeighReport {
	
	public WeighMast getReport(int rst) {

	ResultSet rs = null;
	Connection con = null;
	
	WeighMast wm = new WeighMast();
	
	try {
		
		con=OracleConnection.getConnection();
			
		String weighSql = "SELECT * FROM WEIGH_MAST WHERE RST="+rst;
		
		PreparedStatement stmt = con.prepareStatement(weighSql);
		
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			wm.setRst(rs.getInt(1));
			wm.setCid(rs.getInt(2));
			wm.setVid(rs.getInt(3));
			wm.setMaterial(rs.getString(4));
			wm.setWeighRate(rs.getInt(5));
			wm.setGross(rs.getFloat(6));
			wm.setTare(rs.getFloat(7));
			wm.setNet(rs.getFloat(8));
			wm.setGrade(rs.getString(9));
			wm.setGradeRate(rs.getFloat(10));
			System.out.println(rs.getString(11));
			System.out.println(rs.getString(1));
			}
		
		stmt.close();
		rs.close();
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return wm;
	
	}
}

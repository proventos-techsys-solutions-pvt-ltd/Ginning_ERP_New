package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
			String grossTime = rs.getString(11);
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(grossTime);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			String properDate = format2.format(date1);
			wm.setGrossWtTime(properDate);
			
			String tareTime = rs.getString(12);
			
			date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(tareTime); 
			properDate = format2.format(date1);
			wm.setTareWtTime(properDate);
			wm.setMoisture(rs.getFloat(13));

			}
		
		stmt.close();
		rs.close();
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return wm;
	
	}
	
	
	public ArrayList<WeighMast> getReport() {

		ResultSet rs = null;
		Connection con = null;
		
		ArrayList<WeighMast> list = new ArrayList<WeighMast>();
		
		try {
			
			con=OracleConnection.getConnection();
				
			String weighSql = "SELECT * FROM WEIGH_MAST ORDER BY RST";
			
			PreparedStatement stmt = con.prepareStatement(weighSql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				WeighMast wm = new WeighMast();
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
				String grossTime = rs.getString(11);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(grossTime);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				wm.setGrossWtTime(properDate);
				
				String tareTime = rs.getString(12);
				
				date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(tareTime); 
				properDate = format2.format(date1);
				wm.setTareWtTime(properDate);

				list.add(wm);				
				}
			
			stmt.close();
			rs.close();
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		
		}
}

package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.prov.bean.Amanat;
import com.prov.db.OracleConnection;

public class AmanatReport {

public Amanat getAmanatData(int amanatId) {
		
		ResultSet rs = null;
		Connection con = null;
		Amanat a = new Amanat();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT * FROM AMANAT_MAST WHERE ID=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, amanatId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				a.setId(rs.getInt(1));
				a.setGradeId(rs.getInt(2));
				a.setCustomerId(rs.getInt(3));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(4)));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				a.setAmanatDate(properDate);
				a.setFinalRate(rs.getDouble(5));
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
		
	}
	
public ArrayList<Amanat> getAmanatData() {
	
	ResultSet rs = null;
	Connection con = null;
	ArrayList<Amanat> list = new ArrayList<Amanat>();
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT * FROM AMANAT_MAST WHERE FINAL_RATE=0 ORDER BY AMANAT_DATE";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			Amanat a = new Amanat();
			
			
			a.setId(rs.getInt(1));
			a.setGradeId(rs.getInt(2));
			a.setCustomerId(rs.getInt(3));
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse((rs.getString(4)));
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
			String properDate = format2.format(date1);
			a.setAmanatDate(properDate);
			a.setFinalRate(rs.getDouble(5));
			
			list.add(a);
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
	}

}

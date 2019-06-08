package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.Amanat;
import com.prov.db.OracleConnection;

public class AmanatReport {

public Amanat getAmanatData(int rst) {
		
		ResultSet rs = null;
		Connection con = null;
		Amanat a = new Amanat();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT * FROM AMANAT_MAST WHERE RST=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, rst);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				a.setId(rs.getInt(1));
				a.setRst(rs.getInt(2));
				a.setCid(rs.getInt(3));
				a.setVid(rs.getInt(4));
				a.setContractRate(rs.getDouble(5));
				a.setTotal(rs.getDouble(6));
				System.out.println(rs.getString(9));
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
		
	}
	
}

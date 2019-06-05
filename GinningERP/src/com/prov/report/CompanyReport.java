package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.Company;
import com.prov.bean.Customer;
import com.prov.db.OracleConnection;

public class CompanyReport {
	
	public Company getReport() {
		ResultSet rs = null;
		Connection con = null;
		
		Company c = new Company();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CUSTOMER_MAST ORDER BY ID";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setAddress(rs.getString(3));
				c.setCity(rs.getString(4));
				c.setState(rs.getString(5));
				c.setPan(rs.getString(6));
				c.setTan(rs.getString(7));
				c.setCin(rs.getString(8));
				c.setGst(rs.getString(9));
				c.setTelephone(rs.getString(10));
				c.setMobile(rs.getString(11));
				c.setEmail(rs.getString(12));
				c.setLogoPath(rs.getString(13));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return c;
	}

}

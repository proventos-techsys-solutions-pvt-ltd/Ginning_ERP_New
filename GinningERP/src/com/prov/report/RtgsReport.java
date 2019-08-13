package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.prov.bean.Rtgs;
import com.prov.db.OracleConnection;

public class RtgsReport {
	
	public ArrayList<Rtgs> rtgsReport(){
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Rtgs> rtgsReport = new ArrayList<Rtgs>();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM RTGS_MASTER ORDER BY RTGS_DATE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Rtgs rtgs = new Rtgs();
				
				rtgs.setAccountNo(rs.getString(4));
				rtgs.setBankName(rs.getString(5));
				rtgs.setIfsc(rs.getString(6));
				rtgs.setRtgsAmount(rs.getDouble(7));
				rtgs.setRtgsDate(rs.getString(8));
				rtgs.setCustomerName(rs.getString(9));
				rtgs.setInvoiceNo(rs.getString(10));
				
				rtgsReport.add(rtgs);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rtgsReport;
	}

}
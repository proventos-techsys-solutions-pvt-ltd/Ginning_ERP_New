package com.prov.report;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.prov.db.OracleConnection;

public class BankRecoReport {
	
	public int getRecoCount(int bankId, int companyId, String startDate) {
		ResultSet rs = null;
		Connection con = null;
		int recoCount = 0;
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT COUNT(ID) FROM BANK_RECO_MASTER WHERE BANK_ID = ? AND COMPANY_ID = ? AND RECO_DATE = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			Date sqlDate = Date.valueOf(startDate);
			
			stmt.setInt(1, bankId);
			stmt.setInt(2, companyId);
			stmt.setDate(3, sqlDate);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				recoCount = rs.getInt(1);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return recoCount;
	}

}

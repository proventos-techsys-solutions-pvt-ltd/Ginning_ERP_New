package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.db.OracleConnection;

public class StockMasterReport {
	
	public int getTodaysStockId(String date, int companyId) {
		ResultSet rs = null;
		Connection con = null;
		int stockMastId = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date2 = sdf1.parse(date);
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy");
			String date1 = sdf2.format(date2);
			
			String sql = "SELECT NVL(ID,0) FROM STOCK_MAST WHERE TO_CHAR(STOCK_DATE, 'MM/DD/YYYY') = ? AND COMPANY_ID=?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, date1);
			stmt.setInt(2, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				stockMastId = rs.getInt(1);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return stockMastId;
	}

}

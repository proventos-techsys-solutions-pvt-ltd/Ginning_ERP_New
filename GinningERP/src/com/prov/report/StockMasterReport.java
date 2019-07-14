package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.StockMast;
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
	
	public StockMast getTodaysStockReport(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		StockMast sm = new StockMast();
		
		try {
			con = OracleConnection.getConnection();
			
			
			String sql = "SELECT * FROM STOCK_MAST WHERE STOCK_DATE=TRUNC(SYSDATE) AND COMPANY_ID=?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			
			while (rs.next()) {
				
				sm.setId(rs.getInt(1));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				
				sm.setStockDate(properDate);
				sm.setCompanyId(rs.getInt(3));
				sm.setRawCotton(rs.getDouble(4));
				sm.setCottonBales(rs.getDouble(5));
				sm.setCottonSeed(rs.getDouble(6));
				sm.setCottonSeedOil(rs.getDouble(7));
				sm.setCottonCakes(rs.getDouble(8));
				sm.setAvgRate(rs.getDouble(9));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sm;
	}
	
	public StockMast getTodaysOpeningStock(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		StockMast sm = new StockMast();
		
		try {
			con = OracleConnection.getConnection();
			
			
			String sql = "SELECT * FROM STOCK_MAST WHERE STOCK_DATE=TRUNC(SYSDATE-1) AND COMPANY_ID=?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			
			while (rs.next()) {
				
				sm.setId(rs.getInt(1));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				
				sm.setStockDate(properDate);
				sm.setCompanyId(rs.getInt(3));
				sm.setRawCotton(rs.getDouble(4));
				sm.setCottonBales(rs.getDouble(5));
				sm.setCottonSeed(rs.getDouble(6));
				sm.setCottonSeedOil(rs.getDouble(7));
				sm.setCottonCakes(rs.getDouble(8));
				sm.setAvgRate(rs.getDouble(9));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sm;
	}

}

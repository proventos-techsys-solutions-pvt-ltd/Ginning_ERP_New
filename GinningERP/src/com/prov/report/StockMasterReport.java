package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONObject;

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
	
	public JSONObject getTodaysStockForAll() {
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = null;
		
		try {
			con = OracleConnection.getConnection();
			
			
			String sql = "SELECT\r\n" + 
					"    SUM(raw_cotton) raw_cotton,\r\n" + 
					"    SUM(cotton_bales) cotton_bales,\r\n" + 
					"    SUM(cotton_seed) cotton_seed,\r\n" + 
					"    SUM(cotton_seed_oil) cotton_seed_oil,\r\n" + 
					"    SUM(cotton_cakes) cotton_cakes,\r\n" + 
					"    STOCK_DATE\r\n" + 
					"    FROM STOCK_MAST\r\n" + 
					"    WHERE tRUNC(STOCK_DATE) = TRUNC(SYSDATE)\r\n" + 
					"    GROUP BY STOCK_DATE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			
			rs = stmt.executeQuery();
			
			obj = new JSONObject();
			
			while (rs.next()) {
				
				
				obj.put("rawCotton", rs.getDouble(1));
				obj.put("cottonBales", rs.getDouble(2));
				obj.put("cottonSeed", rs.getDouble(3));
				obj.put("cottonSeedOil", rs.getDouble(4));
				obj.put("cottonCakes", rs.getDouble(5));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(6));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				obj.put("stockDate",properDate);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return obj;
	}
	
	public JSONObject getTodaysOpeningStockForAll() {
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = null;
		
		try {
			con = OracleConnection.getConnection();
			
			
			String sql = "SELECT\r\n" + 
					"    SUM(raw_cotton) raw_cotton,\r\n" + 
					"    SUM(cotton_bales) cotton_bales,\r\n" + 
					"    SUM(cotton_seed) cotton_seed,\r\n" + 
					"    SUM(cotton_seed_oil) cotton_seed_oil,\r\n" + 
					"    SUM(cotton_cakes) cotton_cakes,\r\n" + 
					"    STOCK_DATE\r\n" + 
					"    FROM STOCK_MAST\r\n" + 
					"    WHERE tRUNC(STOCK_DATE) = TRUNC(SYSDATE-1)\r\n" + 
					"    GROUP BY STOCK_DATE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			
			rs = stmt.executeQuery();
			
			obj = new JSONObject();
			
			while (rs.next()) {
				
				
				obj.put("rawCotton", rs.getDouble(1));
				obj.put("cottonBales", rs.getDouble(2));
				obj.put("cottonSeed", rs.getDouble(3));
				obj.put("cottonSeedOil", rs.getDouble(4));
				obj.put("cottonCakes", rs.getDouble(5));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(6));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				obj.put("stockDate",properDate);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return obj;
	}
	
	public double getTodaysAverageRate() {
		ResultSet rs = null;
		Connection con = null;
		double avgRate = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			
			String sql = "SELECT AVERAGE_RATE FROM STOCK_MAST, daily_setup\r\n" + 
					"WHERE \r\n" + 
					"daily_setup.company_id = stock_mast.company_id AND \r\n" + 
					"stock_mast.stock_date = TRUNC(SYSDATE) AND\r\n" + 
					"TRUNC(daily_setup.setup_date) = TRUNC(SYSDATE)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				avgRate = rs.getDouble(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return avgRate;
	}

}

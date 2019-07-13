package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.StockMast;
import com.prov.db.OracleConnection;

public class UpdateStockMast {
	
	public int updateStockMast(StockMast sm)
	{
		
		sm.setCottonBales(sm.getRawCotton()*0.35);
		sm.setCottonSeed(sm.getRawCotton()*0.64);
		sm.setCottonSeedOil(sm.getCottonSeed()*0.10);
		sm.setCottonCakes(sm.getCottonSeed()-(sm.getCottonSeed()*0.12));
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateStock = "{ ? = call UPDATE_STOCK(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			java.sql.Date stockSqlDate = java.sql.Date.valueOf(sm.getStockDate());
			
			cs = con.prepareCall(updateStock);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, sm.getId());
			cs.setDate(3, stockSqlDate);
			cs.setInt(4, sm.getCompanyId());
			cs.setDouble(5, sm.getRawCotton());
			cs.setDouble(6, sm.getCottonBales());
			cs.setDouble(7, sm.getCottonSeed());
			cs.setDouble(8, sm.getCottonSeedOil());
			cs.setDouble(9, sm.getCottonCakes());
			cs.setDouble(10, sm.getAvgRate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			sm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	public int updateStockOnEntry(StockMast sm) {
		
		sm.setCottonBales(sm.getRawCotton()*0.35);
		sm.setCottonSeed(sm.getRawCotton()*0.64);
		sm.setCottonSeedOil(sm.getCottonSeed()*0.10);
		sm.setCottonCakes(sm.getCottonSeed()-(sm.getCottonSeed()*0.12));
		
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateStock = "{ ? = call UPDATE_STOCK_ON_ENTRY(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			

			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date2 = sdf1.parse(sm.getStockDate());
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy");
			String date1 = sdf2.format(date2);
			
			cs = con.prepareCall(updateStock);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, sm.getId());
			cs.setString(3, date1);
			cs.setInt(4, sm.getCompanyId());
			cs.setDouble(5, sm.getRawCotton());
			cs.setDouble(6, sm.getCottonBales());
			cs.setDouble(7, sm.getCottonSeed());
			cs.setDouble(8, sm.getCottonSeedOil());
			cs.setDouble(9, sm.getCottonCakes());
			cs.setDouble(10, sm.getAvgRate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			sm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	
	}
}

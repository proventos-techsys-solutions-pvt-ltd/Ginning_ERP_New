package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.StockMast;
import com.prov.db.OracleConnection;

public class AddStockMast {

public int addStockMast(StockMast sm) {
	
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

		String addStock = "{ ? = call ADD_STOCK(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date stockDate = new SimpleDateFormat("yyyy-MM-dd").parse(sm.getStockDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date stockSqlDate = new java.sql.Date(stockDate.getDate());
			
			cs = con.prepareCall(addStock);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, sm.getCompanyId());
			cs.setDate(3, stockSqlDate);
			cs.setDouble(4, sm.getRawCotton());
			cs.setDouble(5, sm.getCottonBales());
			cs.setDouble(6, sm.getCottonSeed());
			cs.setDouble(7, sm.getCottonSeedOil());
			cs.setDouble(8, sm.getCottonCakes());
			cs.setDouble(9, sm.getAvgRate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			sm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

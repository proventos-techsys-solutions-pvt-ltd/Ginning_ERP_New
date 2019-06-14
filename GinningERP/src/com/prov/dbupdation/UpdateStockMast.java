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
			
			Date stockDate = new SimpleDateFormat("yyyy-MM-dd").parse(sm.getStockDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date stockSqlDate = new java.sql.Date(stockDate.getDate());
			
			cs = con.prepareCall(updateStock);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, sm.getId());
			cs.setInt(3, sm.getCompanyId());
			cs.setDate(4, stockSqlDate);
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

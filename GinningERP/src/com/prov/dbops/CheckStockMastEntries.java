package com.prov.dbops;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class CheckStockMastEntries {
	
	public int checkEntriesDone() {
		Connection con = null;
		int flag=0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String checkStockMast = "{?=call CHECK_OPN_STOCK_ADDED}";
		CallableStatement stmt;
		try {
			
			stmt = con.prepareCall(checkStockMast);
			
			stmt.registerOutParameter(1, Types.NUMERIC);
			
			flag = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}

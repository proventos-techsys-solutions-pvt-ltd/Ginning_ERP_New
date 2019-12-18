package com.prov.dbops;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class AddOpeningStock {
	
	public int openingStockCall() {
		Connection con = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String openingStockCall = "{ ? = CALL ADD_OPENING_STOCK()  }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(openingStockCall);
			cs.registerOutParameter(1, Types.NUMERIC);
			cs.executeUpdate();
			
			rowCount = cs.getInt(1);
			cs.close();
			con.close();	
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rowCount;
	}

}

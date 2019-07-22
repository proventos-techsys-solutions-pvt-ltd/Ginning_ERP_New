package com.prov.dbops;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class CheckInvoiceExists {
	

	public int invoiceExistsCheck(int rst) {
		Connection con = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String openingStockCall = "{ ? = call CHECK_INVOICE_CREATED(?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(openingStockCall);
			cs.registerOutParameter(1, Types.NUMERIC);
			cs.setInt(2, rst);
			
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

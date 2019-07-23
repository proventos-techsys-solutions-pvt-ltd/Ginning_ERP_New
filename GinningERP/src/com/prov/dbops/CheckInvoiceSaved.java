package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class CheckInvoiceSaved {
	
	public int invoiceExistsCheck(int rst) {
		Connection con = null;
		ResultSet rs = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String invoiceCheck = "SELECT COUNT(INVOICE_ID) FROM INVOICE_ITEMS WHERE RST = ?";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(invoiceCheck);
			stmt.setInt(1, rst);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				rowCount = rs.getInt(1);
			}
			
			stmt.close();
			con.close();	
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rowCount;
	}

}

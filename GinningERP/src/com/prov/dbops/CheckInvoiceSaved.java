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

		String invoiceCheck = "SELECT\r\n" + 
				"    COUNT(*)\r\n" + 
				"FROM\r\n" + 
				"    GRADE_DETAILS II\r\n" + 
				"WHERE\r\n" + 
				"    II.ID NOT IN (\r\n" + 
				"        SELECT\r\n" + 
				"            GRADE_ID\r\n" + 
				"        FROM\r\n" + 
				"            INVOICE_ITEMS\r\n" + 
				"        WHERE\r\n" + 
				"            RST = ?\r\n" + 
				"    )\r\n" + 
				"    AND II.ID NOT IN (\r\n" + 
				"        SELECT\r\n" + 
				"            GRADE_ID\r\n" + 
				"        FROM\r\n" + 
				"            AMANAT_MAST\r\n" + 
				"        WHERE\r\n" + 
				"            RST = ?\r\n" + 
				"    )\r\n" + 
				"    AND II.RST = ?";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(invoiceCheck);
			stmt.setInt(1, rst);
			stmt.setInt(2, rst);
			stmt.setInt(3, rst);
			
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
	
	
	public int invoiceExistsCheckByNo(String invoiceNo) {
		Connection con = null;
		ResultSet rs = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String invoiceCheck = "SELECT COUNT(*) FROM INVOICE_MAST WHERE INVOICE_NO =?";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(invoiceCheck);
			stmt.setString(1, invoiceNo);
			
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

package com.prov.dbops;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

		String invoiceCreated = "{ ? = call CHECK_INVOICE_CREATED(?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(invoiceCreated);
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
	

	public int invoiceExistsCheck(String invoiceNo) {
		Connection con = null;
		int rowCount = 0;
		ResultSet rs = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String invoiceCreated = "SELECT COUNT(ID) FROM INVOICE_MAST  WHERE INVOICE_NO = ?";
		PreparedStatement stmt; 
		try {
			stmt = con.prepareCall(invoiceCreated);
			stmt.setString(1, invoiceNo);
			
			rs = stmt.executeQuery();
			
			while(rs.next())
			{
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

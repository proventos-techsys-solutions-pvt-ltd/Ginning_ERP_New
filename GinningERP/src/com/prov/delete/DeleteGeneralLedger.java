package com.prov.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class DeleteGeneralLedger {
	
	public int deleteGeneralLedger(int accountNameId) {
		
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "DELETE GENERAL_LEDGER WHERE ACCOUNT_NAME_ID=?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(deleteSql);
			
			stmt.setInt(1, accountNameId);
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Deletion Succesful - "+accountNameId);
			} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		return accountNameId;
	}
}

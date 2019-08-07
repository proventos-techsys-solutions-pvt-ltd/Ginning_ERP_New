package com.prov.dbupdation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.prov.db.OracleConnection;

public class UpdateDailySetup {
	
	public int addCheques(String lastChequeNo, int totalCheques, int setupId) {
		Connection con = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addCheques = "UPDATE DAILY_SETUP SET LAST_CHEQUE_NO = ?,\r\n" + 
														"TOTAL_CHEQUES = ?\r\n" + 
														"WHERE ID=?";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(addCheques);

			stmt.setString(1, lastChequeNo);
			stmt.setInt(2, totalCheques);
			stmt.setInt(3, setupId);

			rowCount = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful - "+rowCount);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}

}

package com.prov.delete;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class DeleteTransaction {
	
	public int deleteTransaction(int voucherNo) {
		int returnId = 0;
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "{ ? = call DELETE_TRANSACTION(?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(deleteSql);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			cs.setInt(2, voucherNo);
			
			cs.executeUpdate();
			
			returnId =  cs.getInt(1);
			
			cs.close();
			con.close();
			
			System.out.println("Deletion Succesful-"+returnId);
			} catch (SQLException e) {
				e.printStackTrace();
				return 0;
		}
		
		return returnId;
	}

}

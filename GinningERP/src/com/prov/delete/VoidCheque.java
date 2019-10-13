package com.prov.delete;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class VoidCheque {
	
public int voidCheque(int chequeId) {
		
		int returnId = 0;
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "{ ? = call VOID_CHEQUE(?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(deleteSql);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			cs.setInt(2, chequeId);
			
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

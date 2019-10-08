package com.prov.delete;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class DeleteRst {
	
	public int deleteRst(int rst) {
		
		Connection con = null;
		int output = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "{? = CALL DELETE_RST(?)}";
		CallableStatement cs;
		try {
			cs = con.prepareCall(deleteSql);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(1, rst);
			
			output = cs.executeUpdate();
			
			cs.close();
			con.close();
			
			System.out.println("Deletion Succesful--"+output);
			} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		return output;
	}

}

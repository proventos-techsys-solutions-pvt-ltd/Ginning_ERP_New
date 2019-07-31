package com.prov.dbops;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class Login {
	public int checkLogin(String username, String password) {
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String checkLogin = "{ ? = call CHECK_LOGIN(?,?)  }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(checkLogin);
			cs.registerOutParameter(1, Types.NUMERIC);
			cs.setString(2, username);
			cs.setString(3, password);
			cs.executeUpdate();
			
			id = cs.getInt(1);
//			cs.close();
//			con.close();	
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

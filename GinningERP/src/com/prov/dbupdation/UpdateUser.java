package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import com.prov.bean.User;
import com.prov.db.OracleConnection;

public class UpdateUser {

	public int updateUser(User u) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateUser = "{ ? = call UPDATE_USERS(?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateUser);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, u.getName() );
			cs.setString(3, u.getUsername() );
			cs.setString(4, u.getPassword());
			cs.setInt(5, u.getId());
			cs.setInt(6, u.getRole());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			u.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
public int logoutUser(User u) {
		
		Connection con = null;
		int rowNos= 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateUser = "UPDATE USERS SET STATUS=0 WHERE ID="+u.getId();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(updateUser);
			
			rowNos = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful -- "+rowNos);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rowNos;
		
	}
	
}



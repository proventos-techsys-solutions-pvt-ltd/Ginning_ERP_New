package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.User;
import com.prov.db.OracleConnection;

public class AddUser {
	
public int addUser(User u) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addUser = "{ ? = call ADD_USER(?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addUser);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, u.getName() );
			cs.setString(3, u.getUsername() );
			cs.setString(4, u.getPassword());
			cs.setInt(5, u.getRole());
			cs.setInt(6, 0);
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			u.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}

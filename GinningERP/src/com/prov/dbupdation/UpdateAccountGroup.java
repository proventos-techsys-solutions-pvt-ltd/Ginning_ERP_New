package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.AccountGroup;
import com.prov.db.OracleConnection;

public class UpdateAccountGroup {
	
	public int updateAccountGroup(AccountGroup ag)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateAccountGroup = "{ ? = call UPDATE_ACCOUNTGROUP(?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateAccountGroup);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, ag.getId());
			cs.setString(3, ag.getGroupName());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			ag.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

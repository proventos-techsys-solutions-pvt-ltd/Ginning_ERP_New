package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.AccountGroup;
import com.prov.db.OracleConnection;

public class AddAccountGroup {
	
public int addAccountGroup(AccountGroup ag) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addAccountGroup = "{ ? = call ADD_ACCOUNTGROUP(?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addAccountGroup);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, ag.getGroupName());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			ag.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}

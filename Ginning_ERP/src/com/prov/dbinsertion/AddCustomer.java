package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Customer;
import com.prov.db.OracleConnection;

public class AddCustomer {
	
public int addCustomer(Customer c) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addCustomer = "{ ? = call ADD_CUSTOMER(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addCustomer);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, c.getName() );
			cs.setString(3, c.getAddress() );
			cs.setString(4, c.getMobile());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			c.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}


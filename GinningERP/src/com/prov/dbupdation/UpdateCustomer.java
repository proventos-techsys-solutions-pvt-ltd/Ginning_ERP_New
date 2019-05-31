package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Customer;
import com.prov.db.OracleConnection;

public class UpdateCustomer {

	public int updateCustomer(Customer c)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCustomer = "{ ? = call UPDATE_CUSTOMER(?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCustomer);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, c.getId() );
			cs.setString(3, c.getName() );
			cs.setString(4, c.getAddress() );
			cs.setString(5, c.getMobile());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			c.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
}

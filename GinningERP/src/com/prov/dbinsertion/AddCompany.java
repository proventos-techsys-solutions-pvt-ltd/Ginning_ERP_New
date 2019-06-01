package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Company;
import com.prov.db.OracleConnection;

public class AddCompany {
	
	public int addCompany(Company c) {
	
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addCustomer = "{ ? = call ADD_COMPANY(?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addCustomer);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, c.getName() );
			cs.setString(3, c.getAddress() );
			cs.setString(4, c.getCity());
			cs.setString(5, c.getState());
			cs.setString(6, c.getPan());
			cs.setString(7, c.getTan());
			cs.setString(8, c.getCin());
			cs.setString(9, c.getGst());
			cs.setString(10, c.getTelephone());
			cs.setString(11, c.getMobile());
			cs.setString(12, c.getEmail());
			cs.setString(13, c.getLogoPath());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			c.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

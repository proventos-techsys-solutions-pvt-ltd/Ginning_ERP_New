package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Company;
import com.prov.db.OracleConnection;

public class UpdateCompany {
	
	public int updateCompany(Company c) {
	
	Connection con = null;
	int id = 0;
	try {
		con = OracleConnection.getConnection();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	String addCustomer = "{ ? = call UPDATE_COMPANY(?,?,?,?,?,?,?,?,?,?,?,?,?) }";
	CallableStatement cs;
	try {
		cs = con.prepareCall(addCustomer);
		
		cs.registerOutParameter(1, Types.NUMERIC);
		
		cs.setInt(2, c.getId());
		cs.setString(3, c.getName());
		cs.setString(4, c.getAddress());
		cs.setString(5, c.getCity());
		cs.setString(6, c.getState());
		cs.setString(7, c.getPan());
		cs.setString(8, c.getTan());
		cs.setString(9, c.getCin());
		cs.setString(10, c.getGst());
		cs.setString(11, c.getTelephone());
		cs.setString(12, c.getMobile());
		cs.setString(13, c.getEmail());
		cs.setString(14, c.getInvoiceSeries());
		
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

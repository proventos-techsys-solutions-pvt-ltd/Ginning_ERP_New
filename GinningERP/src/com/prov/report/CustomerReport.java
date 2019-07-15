package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.prov.bean.Customer;
import com.prov.db.OracleConnection;

public class CustomerReport {
	
	public Customer getCustomerData(String name, String mobile)
	{
		ResultSet rs = null;
		Connection con = null;
		
		Customer customer= new Customer();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CUSTOMER_MAST WHERE NAME=? AND MOBILE=?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, name);
			stmt.setString(2, mobile);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				customer.setId(rs.getInt(1));
				customer.setName(rs.getString(2));
				customer.setAddress(rs.getString(3));
				customer.setMobile(rs.getString(4));
				customer.setBlacklist(rs.getInt(5));
				customer.setMembership(rs.getInt(6));
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return customer;
		
	}
	
	public Customer getReport(int id) {
		ResultSet rs = null;
		Connection con = null;
		
		Customer customer= new Customer();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CUSTOMER_MAST WHERE id="+id;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				customer.setId(rs.getInt(1));
				customer.setName(rs.getString(2));
				customer.setAddress(rs.getString(3));
				customer.setMobile(rs.getString(4));
				customer.setBlacklist(rs.getInt(5));
				customer.setMembership(rs.getInt(6));
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return customer;
	}

	public ArrayList<Customer> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Customer> customerList = new ArrayList<Customer>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CUSTOMER_MAST ORDER BY NAME";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Customer customer= new Customer();

				customer.setId(rs.getInt(1));
				customer.setName(rs.getString(2));
				customer.setAddress(rs.getString(3));
				customer.setMobile(rs.getString(4));
				customer.setBlacklist(rs.getInt(5));
				customer.setMembership(rs.getInt(6));
				
				customerList.add(customer);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return customerList;
	}
	
}

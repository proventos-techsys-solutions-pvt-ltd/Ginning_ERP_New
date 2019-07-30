package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.Cheque;
import com.prov.db.OracleConnection;

public class AddCheque {
	
	public int addCheque(Cheque c)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String addAccountName = "{ ? = call ADD_CHEQUE(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			cs = con.prepareCall(addAccountName);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(c.getChequeDate());
			
			cs.setInt(2, c.getCustomerId());
			cs.setInt(3, c.getInvoiceId());
			cs.setInt(4,c.getBankId());
			cs.setString(5, c.getCustomerName());
			cs.setString(6, c.getInvoiceNo());
			cs.setString(7, c.getBankName());
			cs.setLong(8, c.getChequeNo());
			cs.setDouble(9, c.getChequeAmount());
			cs.setDate(10, date);
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			c.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

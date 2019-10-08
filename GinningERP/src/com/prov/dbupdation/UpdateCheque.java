package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Cheque;
import com.prov.db.OracleConnection;

public class UpdateCheque {
	public int updateCheque(Cheque c)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCheque = "{ ? = call UPDATE_CHEQUE(?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCheque);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(c.getChequeDate());
			
			cs.setInt(2, c.getId());
			cs.setInt(3, c.getCustomerId());
			cs.setInt(4, c.getInvoiceId());
			cs.setInt(5,c.getBankId());
			cs.setString(6, c.getCustomerName());
			cs.setString(7, c.getInvoiceNo());
			cs.setString(8, c.getBankName());
			cs.setString(9, c.getChequeNo());
			cs.setLong(10, c.getChequeAmount());
			cs.setDate(11, date);
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

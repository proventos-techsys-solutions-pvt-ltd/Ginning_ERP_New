package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Transactions;
import com.prov.db.OracleConnection;

public class UpdateTransactions {
	
	public int updateTransactions(Transactions t)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCustomer = "{ ? = call UPDATE_TRANSACTIONS(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCustomer);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(t.getTransactionDate());
		
			cs.setInt(2, t.getId());
			cs.setDate(3, date);
			cs.setInt(4, t.getVouchNo());
			cs.setString(5, t.getVouchRef());
			cs.setInt(6, t.getAccountId());
			cs.setString(7, t.getContactId());
			cs.setDouble(8, t.getDebit());
			cs.setDouble(9, t.getCredit());
			cs.setString(10, t.getNarration());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			t.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

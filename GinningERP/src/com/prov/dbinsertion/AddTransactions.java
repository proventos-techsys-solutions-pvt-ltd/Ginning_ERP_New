package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Transactions;
import com.prov.db.OracleConnection;

public class AddTransactions {
	
public int addTransactions(Transactions t) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addTransactions = "{ ? = call ADD_TRANSACTIONS(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addTransactions);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(t.getTransactionDate());
			
			cs.setDate(2, date);
			cs.setInt(3, t.getVouchNo());
			cs.setString(4, t.getVouchRef());
			cs.setInt(5, t.getAccountId());
			cs.setString(6, t.getContactId());
			cs.setDouble(7, t.getDebit());
			cs.setDouble(8, t.getCredit());
			cs.setString(9, t.getNarration());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			t.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful -- "+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

}


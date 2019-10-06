package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.db.OracleConnection;

public class CheckTransactions {

	public int checkTransactionsForAccount(int accountId) {
		Connection con = null;
		int flag=0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String checkRst = "SELECT COUNT(*) FROM TRANSACTIONS WHERE ACCOUNT_ID=?";
		PreparedStatement stmt;
		ResultSet rs=null;
		try {
			
			stmt = con.prepareStatement(checkRst);
			
			stmt.setInt(1, accountId);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				flag=rs.getInt(1);
			}
			
			stmt.close();
			con.close();
			
			if(flag > 0) {
				System.out.println("Transactions Exists-"+accountId);
			}else {
				System.out.println("Transactions doesn't exists-"+accountId);
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
}

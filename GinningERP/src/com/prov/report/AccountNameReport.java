package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.prov.db.OracleConnection;

public class AccountNameReport {
	
	public int getAccountId(int companyId, int bankId) {
		ResultSet rs = null;
		Connection con = null;
		int accountId = 0;
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    ACCOUNT_ID\r\n" + 
					"FROM\r\n" + 
					"    ACCOUNT_NAME\r\n" + 
					"WHERE\r\n" + 
					"    BANK_ID = ?\r\n" + 
					"    AND COMPANY_ID = ?\r\n" + 
					"ORDER BY\r\n" + 
					"    ACCOUNT_ID";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, bankId);
			stmt.setInt(2, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				accountId = rs.getInt(1);
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return accountId;
	}
	
	public int getAccountsPayableId(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		int accountId = 0;
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT\r\n" + 
					"    ACCOUNT_ID\r\n" + 
					"FROM\r\n" + 
					"    ACCOUNT_NAME\r\n" + 
					"WHERE\r\n" + 
					"    ACC_CATEGORY_ID = 6\r\n" + 
					"    AND COMPANY_ID = ?\r\n" + 
					"ORDER BY\r\n" + 
					"    ACCOUNT_ID";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				accountId = rs.getInt(1);
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return accountId;
	}

}

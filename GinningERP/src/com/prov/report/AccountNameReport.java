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
			
			String invSql = "SELECT account_id FROM account_name WHERE bank_id = ? and company_Id=?";
			
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
			
			String invSql = "SELECT account_id FROM account_name WHERE ACC_CATEGORY_ID = 6 and company_Id=?";
			
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

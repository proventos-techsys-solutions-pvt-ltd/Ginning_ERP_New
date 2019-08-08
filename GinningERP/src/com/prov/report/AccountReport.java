package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.AccountName;
import com.prov.db.OracleConnection;

public class AccountReport {
	
	public AccountName getReport(int id) {
		ResultSet rs = null;
		Connection con = null;
		AccountName accountName = new AccountName();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM ACCOUNT_NAME_MASTER WHERE ID="+id;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				accountName.setId(rs.getInt(1));
				accountName.setCompanyId(rs.getInt(2));
				accountName.setAccountCategoryId(rs.getInt(3));
				accountName.setAccountName(rs.getString(4));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return accountName;
	}


}

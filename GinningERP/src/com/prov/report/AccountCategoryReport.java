package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.AccountCategory;
import com.prov.db.OracleConnection;

public class AccountCategoryReport {
	
	public AccountCategory getReport(int id) {
		ResultSet rs = null;
		Connection con = null;
		AccountCategory accountCat = new AccountCategory();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM ACCOUNT_CATEGORY_MASTER WHERE ID="+id;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();

			
			
			while (rs.next()) {
				
				accountCat.setId(rs.getInt(1));
				accountCat.setAccountCategory(rs.getString(2));
				accountCat.setCompanyId(rs.getInt(3));
				accountCat.setItemOf(rs.getString(4));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return accountCat;
	}

}

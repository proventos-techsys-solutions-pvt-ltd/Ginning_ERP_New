package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class BalanceReport {

	public double getBankBalanceForDS(int companyId, int bankId) {
		ResultSet rs = null;
		Connection con = null;

		double bankBalance = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    GL.CLOSING_BAL\r\n" + 
					"FROM\r\n" + 
					"    GENERAL_LEDGER   GL,\r\n" + 
					"    ACCOUNT_NAME     AN\r\n" + 
					"WHERE\r\n" + 
					"    AN.COMPANY_ID = ?\r\n" + 
					"    AND AN.BANK_ID = ?\r\n" + 
					"    AND GL.ACCOUNT_NAME_ID = AN.ID\r\n" + 
					"    AND GL.MONTH_ID = (\r\n" + 
					"        SELECT\r\n" + 
					"            MAX(MONTH_ID)\r\n" + 
					"        FROM\r\n" + 
					"            GENERAL_LEDGER\r\n" + 
					"        WHERE\r\n" + 
					"            ACCOUNT_NAME_ID = AN.ID\r\n" + 
					"    )";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, companyId);
			stmt.setInt(2, bankId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				bankBalance = rs.getDouble(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bankBalance;
	}	
	
	public JSONArray getCashBalanceForDS(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		JSONArray arr = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    AN.ACC_LEDGER,\r\n" + 
					"    GL.CLOSING_BAL\r\n" + 
					"FROM\r\n" + 
					"    GENERAL_LEDGER   GL,\r\n" + 
					"    ACCOUNT_NAME     AN\r\n" + 
					"WHERE\r\n" + 
					"    AN.COMPANY_ID = ?\r\n" + 
					"    AND AN.ACC_CATEGORY_ID = 2\r\n" + 
					"    AND GL.ACCOUNT_NAME_ID = AN.ID\r\n" + 
					"    AND GL.MONTH_ID = (\r\n" + 
					"        SELECT\r\n" + 
					"            MAX(MONTH_ID)\r\n" + 
					"        FROM\r\n" + 
					"            GENERAL_LEDGER\r\n" + 
					"        WHERE\r\n" + 
					"            ACCOUNT_NAME_ID = AN.ID\r\n" + 
					"    )";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();

				obj.put("ledgerName",rs.getString(1));
				obj.put("balance",rs.getString(2));
				
				arr.put(obj);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}
}

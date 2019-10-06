package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class GeneralLedgerReport {

	public JSONArray getReport() {
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArr = new JSONArray();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
						"AN.ID,\r\n" + 
						"AN.ACCOUNT_ID,\r\n" + 
						"AN.ACC_CATEGORY_ID,\r\n" + 
						"AN.ACC_LEDGER,\r\n" + 
						"AN.LEDGER_DESC,\r\n" + 
						"AN.LEDGER_DATE,\r\n" + 
						"AN.COMPANY_ID,\r\n" + 
						"AN.BANK_ID,\r\n" + 
						"AN.OPENING_BAL,\r\n" + 
						"GL.CLOSING_BAL,\r\n" + 
						"AC.CATEGORY_NAME\r\n" + 
						"FROM GENERAL_LEDGER GL, ACCOUNT_NAME AN, ACCOUNT_CATEGORY AC \r\n" + 
						"WHERE GL.ACCOUNT_NAME_ID = AN.ID \r\n" + 
						"AND an.acc_category_id = AC.ID\r\n" + 
						"AND GL.MONTH_ID = (SELECT MAX(MONTH_ID) FROM GENERAL_LEDGER)\r\n" + 
						"ORDER BY AN.ACC_LEDGER";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("id", rs.getString(1));
				obj.put("accountId", rs.getString(2));
				obj.put("accountCategoryId", rs.getString(3));
				obj.put("ledgerName", rs.getString(4));
				obj.put("ledgerDesc", rs.getString(5));
				
				Date formatPdcDate = formatter.parse(rs.getString(6));
				String pdcDateStr = formatter.format(formatPdcDate);
				
				obj.put("ledgerDate", pdcDateStr);
				obj.put("companyId", rs.getString(7));
				obj.put("bankId", rs.getString(8));
				obj.put("openingBal", rs.getString(9));
				obj.put("closingBal", rs.getString(10));
				obj.put("accountCategory", rs.getString(11));
				
				
				jsonArr.put(obj);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArr;
	}
	
}

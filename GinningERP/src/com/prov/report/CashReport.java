package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class CashReport {
	
	public JSONArray getCashReport(String startDate, String endDate) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArr = new JSONArray();
		
		Date startDateObj, endDateObj;
		String properStartDate=null, properEndDate=null;
		try {
			startDateObj = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
			endDateObj = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			properStartDate = format.format(startDateObj);
			properEndDate = format.format(endDateObj);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		java.sql.Date sqlStartDate = java.sql.Date.valueOf(properStartDate);
		java.sql.Date sqlEndDate = java.sql.Date.valueOf(properEndDate);
		
		System.out.println("startDate---" + sqlStartDate);
		System.out.println("endDate---" + sqlEndDate);
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
					"TR.ID TR_ID, TR.TRANSACTION_DATE, TR.VOUCH_NO, TR.VOUCH_REF, TR.ACCOUNT_ID, TR.DEBIT, TR.CREDIT, TR.NARRATION, \r\n" + 
					"GL.COMPANY_ID,\r\n" + 
					"AC.ID ACC_CAT_ID, AC.CATEGORY_NAME,\r\n" + 
					"AG.ID ACC_GRP_ID, AG.GROUP_NAME\r\n" + 
					"FROM\r\n" + 
					"TRANSACTIONS TR,\r\n" + 
					"GENERAL_LEDGER GL,\r\n" + 
					"ACCOUNT_CATEGORY AC,\r\n" + 
					"ACCOUNT_GROUP AG\r\n" + 
					"WHERE TR.ACCOUNT_ID = GL.ACCOUNT_ID AND\r\n" + 
					"GL.ACC_CATEGORY_ID = AC.ID AND\r\n" + 
					"AC.ACC_GROUP_ID = AG.ID AND \r\n" + 
					"AC.ID=2 and\r\n" + 
					"TR.TRANSACTION_DATE BETWEEN ? AND ? \r\n" + 
					"ORDER BY TR.VOUCH_NO, TR.TRANSACTION_DATE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setDate(1, sqlStartDate);
			stmt.setDate(2, sqlEndDate);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();
				
				obj.put("transactionId", rs.getString(1));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				
				obj.put("transactionDate", properDate);
				obj.put("voucherNo", rs.getString(3));
				obj.put("voucherReference", rs.getString(4));
				obj.put("accountId", rs.getString(5));
				obj.put("debit", rs.getString(6));
				obj.put("credit", rs.getString(7));
				obj.put("narration", rs.getString(8));
				obj.put("companyId", rs.getString(9));
				obj.put("accountCategoryId", rs.getString(10));
				obj.put("accountCategoryName", rs.getString(11));
				obj.put("accountGroupId", rs.getString(12));
				obj.put("accountGroupName", rs.getString(13));
				
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

package com.prov.report;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class TransactionReport {

	public double getOpeningBalForLedger(int accNameId, int companyId, String startDate) {
		Connection con = null;
		double openingBal = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String getOpeningBal = "{ ? = call GET_OPENING_BAL_ACC(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(getOpeningBal);
			
			java.sql.Date date = java.sql.Date.valueOf(startDate);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, companyId);
			cs.setInt(3, accNameId);
			cs.setDate(4, date);
			
			cs.executeUpdate();
			
			openingBal = cs.getDouble(1);
			
			cs.close();
			con.close();
			
			System.out.println("opening_bal="+openingBal);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return openingBal;
	}
	
	
public JSONArray getTransactions(String startDate, String endDate, int accId, int companyId) {
		
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
		
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT UNIQUE \r\n" + 
					"    TR.ID   TR_ID, \r\n" + 
					"    TR.TRANSACTION_DATE, \r\n" + 
					"    TR.VOUCH_NO, \r\n" + 
					"    TR.VOUCH_REF, \r\n" + 
					"    TR.ACCOUNT_ID, \r\n" + 
					"    TR.DEBIT, \r\n" + 
					"    TR.CREDIT, \r\n" + 
					"    TR.NARRATION, \r\n" + 
					"    AC.ID   ACC_CAT_ID, \r\n" + 
					"    AC.CATEGORY_NAME, \r\n" + 
					"    AG.ID   ACC_GRP_ID, \r\n" + 
					"    AG.GROUP_NAME,\r\n" + 
					"    TR.TR_TYPE\r\n" + 
					"FROM \r\n" + 
					"    TRANSACTIONS       TR, \r\n" + 
					"    ACCOUNT_NAME       AN, \r\n" + 
					"    ACCOUNT_CATEGORY   AC, \r\n" + 
					"    ACCOUNT_GROUP      AG \r\n" + 
					"WHERE \r\n" + 
					"    TR.ACCOUNT_ID = AN.ACCOUNT_ID \r\n" + 
					"    AND AN.ACC_CATEGORY_ID = AC.ID \r\n" + 
					"    AND AC.ACC_GROUP_ID = AG.ID \r\n" + 
					"    AND AN.COMPANY_ID = ? \r\n" + 
					"    AND AN.ACCOUNT_ID = ? \r\n" + 
					"    AND TR.TRANSACTION_DATE BETWEEN ? AND ? \r\n" + 
					"ORDER BY \r\n" + 
					"    TR.VOUCH_NO, \r\n" + 
					"    TR.TRANSACTION_DATE DESC";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, companyId);
			stmt.setInt(2, accId);
			stmt.setDate(3, sqlStartDate);
			stmt.setDate(4, sqlEndDate);
			
			
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
				obj.put("accountCategoryId", rs.getString(9));
				obj.put("accountCategoryName", rs.getString(10));
				obj.put("accountGroupId", rs.getString(11));
				obj.put("accountGroupName", rs.getString(12));
				obj.put("transactionType", rs.getString(13));
				
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

	public int getAccountId(int voucherNo) {
		Connection con = null;
		ResultSet rs = null;
		int accountId = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String sql = "SELECT DISTINCT ACCOUNT_ID FROM TRANSACTIONS WHERE VOUCH_NO = ? AND CREDIT > 0";
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, voucherNo);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				accountId = rs.getInt(1);
			}
			
			stmt.close();
			con.close();
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return accountId;
	}

public JSONArray getJournalEntriesForUpdation(int voucherNo) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArr = new JSONArray();

		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    TR.ID,\r\n" + 
					"    TR.TRANSACTION_DATE,\r\n" + 
					"    TR.VOUCH_NO,\r\n" + 
					"    TR.VOUCH_REF,\r\n" + 
					"    TR.ACCOUNT_ID,\r\n" + 
					"    TR.CONTACT_ID,\r\n" + 
					"    TR.DEBIT,\r\n" + 
					"    TR.CREDIT,\r\n" + 
					"    TR.NARRATION,\r\n" + 
					"    TR.MONTH_ID,\r\n" + 
					"    TR.TR_TYPE,\r\n" + 
					"    AN.COMPANY_ID\r\n" + 
					"FROM\r\n" + 
					"    TRANSACTIONS   TR,\r\n" + 
					"    ACCOUNT_NAME   AN\r\n" + 
					"WHERE\r\n" + 
					"    TR.ACCOUNT_ID = AN.ACCOUNT_ID\r\n" + 
					"    AND TR.VOUCH_NO = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, voucherNo);
			
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();

				obj.put("transactionId", rs.getString(1));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				String properDate = format2.format(date1);
				
				obj.put("transactionDate", properDate);
				obj.put("voucherNo", rs.getString(3));
				obj.put("voucherReference", rs.getString(4));
				obj.put("accountId", rs.getString(5));
				obj.put("contactId", rs.getString(6));
				obj.put("debit", rs.getString(7));
				obj.put("credit", rs.getString(8));
				obj.put("narration", rs.getString(9));
				obj.put("monthId", rs.getString(10));
				obj.put("transactionType", rs.getString(11));
				obj.put("companyId", rs.getString(12));
				
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

	public JSONArray getBankTransactionForReco(int companyId, int bankId, String date) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArr = new JSONArray();
	
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    TR.ID,\r\n" + 
					"    TR.TRANSACTION_DATE,\r\n" + 
					"    TR.VOUCH_NO,\r\n" + 
					"    TR.ACCOUNT_ID,\r\n" + 
					"    TR.CONTACT_ID,\r\n" + 
					"    TR.DEBIT,\r\n" + 
					"    TR.CREDIT,\r\n" + 
					"    TR.NARRATION,\r\n" + 
					"    AN.BANK_ID,\r\n" + 
					"    AN.COMPANY_ID\r\n" + 
					"FROM\r\n" + 
					"    TRANSACTIONS   TR,\r\n" + 
					"    ACCOUNT_NAME   AN\r\n" + 
					"WHERE\r\n" + 
					"    TR.ACCOUNT_ID = AN.ACCOUNT_ID\r\n" + 
					"    AND AN.COMPANY_ID = ?\r\n" + 
					"    AND AN.BANK_ID = ?\r\n" + 
					"    AND TR.TRANSACTION_DATE <= ?\r\n" + 
					"ORDER BY\r\n" + 
					"    VOUCH_NO";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			java.sql.Date dateSql = java.sql.Date.valueOf(date);
			
			stmt.setInt(1, companyId);
			stmt.setInt(2, bankId);
			stmt.setDate(3, dateSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();
	
				obj.put("transactionId", rs.getString(1));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
				String properDate = format2.format(date1);
				
				obj.put("transactionDate", properDate);
				obj.put("voucherNo", rs.getString(3));
				obj.put("accountId", rs.getString(4));
				obj.put("contactId", rs.getString(5));
				obj.put("debit", rs.getString(6));
				obj.put("credit", rs.getString(7));
				obj.put("narration", rs.getString(8));
				obj.put("bankId", rs.getString(9));
				obj.put("companyId", rs.getString(10));
				
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

	public double getClosingBalForLedger(int bankId, int companyId, String startDate) {
		Connection con = null;
		double closingBal = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String getOpeningBal = "{ ? = call GET_CLOSING_BAL_BANK(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(getOpeningBal);
			
			java.sql.Date date = java.sql.Date.valueOf(startDate);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, companyId);
			cs.setInt(3, bankId);
			cs.setDate(4, date);
			
			cs.executeUpdate();
			
			closingBal = cs.getDouble(1);
			
			cs.close();
			con.close();
			
			System.out.println("closing_bal="+closingBal);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return closingBal;
	}
	
public JSONObject getBankTransactionForPrint(int transactionId) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();
	
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT DISTINCT\r\n" + 
					"    TR.ID,\r\n" + 
					"    TR.TRANSACTION_DATE,\r\n" + 
					"    TR.VOUCH_NO,\r\n" + 
					"    TR.VOUCH_REF,\r\n" + 
					"    TR.ACCOUNT_ID,\r\n" + 
					"    TR.CONTACT_ID,\r\n" + 
					"    TR.DEBIT,\r\n" + 
					"    TR.CREDIT,\r\n" + 
					"    TR.NARRATION,\r\n" + 
					"    TR.TR_TYPE,\r\n" + 
					"    GL.ACCOUNT_NAME_ID,\r\n" + 
					"    AN.COMPANY_ID,\r\n" + 
					"    COM.NAME,\r\n" + 
					"    CM.CHEQUE_NO\r\n" + 
					"FROM\r\n" + 
					"    TRANSACTIONS     TR\r\n" + 
					"    LEFT JOIN CHEQUE_MAST      CM ON CM.VOUCHER_NO = TR.VOUCH_NO\r\n" + 
					"                                AND CM.STATUS = 0,\r\n" + 
					"    GENERAL_LEDGER   GL,\r\n" + 
					"    ACCOUNT_NAME     AN,\r\n" + 
					"    COMPANY_MASTER   COM\r\n" + 
					"WHERE\r\n" + 
					"    TR.ACCOUNT_ID = AN.ACCOUNT_ID\r\n" + 
					"    AND AN.ID = GL.ACCOUNT_NAME_ID\r\n" + 
					"    AND AN.COMPANY_ID = COM.ID\r\n" + 
					"    AND TR.ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			
			stmt.setInt(1, transactionId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				obj.put("transactionId", rs.getString(1));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
				String properDate = format2.format(date1);
				
				obj.put("transactionDate", properDate);
				obj.put("voucherNo", rs.getString(3));
				obj.put("voucherRef", rs.getString(4));
				obj.put("accountId", rs.getString(5));
				obj.put("contactId", rs.getString(6));
				obj.put("debit", rs.getString(7));
				obj.put("credit", rs.getString(8));
				obj.put("narration", rs.getString(9));
				obj.put("transactionType", rs.getString(10));
				obj.put("accountNameId", rs.getString(11));
				obj.put("companyId", rs.getString(12));
				obj.put("companyName", rs.getString(13));
				obj.put("chequeNo", rs.getString(14));
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}


	public JSONArray getExpenseTransaction(int voucherNo) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArr = new JSONArray();
	
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    TR.ID,\r\n" + 
					"    TR.TRANSACTION_DATE,\r\n" + 
					"    TR.VOUCH_NO,\r\n" + 
					"    TR.VOUCH_REF,\r\n" + 
					"    TR.ACCOUNT_ID,\r\n" + 
					"    TR.CONTACT_ID,\r\n" + 
					"    TR.DEBIT,\r\n" + 
					"    TR.CREDIT,\r\n" + 
					"    TR.NARRATION,\r\n" + 
					"    TR.TR_TYPE,\r\n" + 
					"    AN.COMPANY_ID,\r\n" + 
					"    CM.CHEQUE_NO,\r\n" + 
					"    CM.ID CHEQUE_ID\r\n" + 
					"FROM\r\n" + 
					"    TRANSACTIONS     TR\r\n" + 
					"    LEFT JOIN CHEQUE_MAST      CM ON CM.VOUCHER_NO = TR.VOUCH_NO\r\n" + 
					"                                AND CM.STATUS = 0,\r\n" + 
					"    ACCOUNT_NAME     AN,\r\n" + 
					"    COMPANY_MASTER   COM\r\n" + 
					"WHERE\r\n" + 
					"    TR.ACCOUNT_ID = AN.ACCOUNT_ID\r\n" + 
					"    AND AN.COMPANY_ID = COM.ID\r\n" + 
					"    AND TR.VOUCH_NO = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, voucherNo);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();
	
				obj.put("transactionId", rs.getString(1));
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString(2));
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				String properDate = format2.format(date1);
				
				obj.put("transactionDate", properDate);
				obj.put("voucherNo", rs.getString(3));
				obj.put("voucherRef", rs.getString(4));
				obj.put("accountId", rs.getString(5));
				obj.put("contactId", rs.getString(6));
				obj.put("debit", rs.getString(7));
				obj.put("credit", rs.getString(8));
				obj.put("narration", rs.getString(9));
				obj.put("transactionType", rs.getString(10));
				obj.put("companyId", rs.getString(11));
				obj.put("chequeNo", rs.getString(12));
				obj.put("chequeId", rs.getString(13));
				
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

package com.prov.report;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.Bank;
import com.prov.db.OracleConnection;

public class BankReport {
	
	public ArrayList<Bank> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Bank> bankList = new ArrayList<Bank>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM BANK_MAST ORDER BY BANK_NAME";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Bank b = new Bank();
				
				b.setId(rs.getInt(1));
				b.setCompanyId(rs.getInt(2));
				b.setBankName(rs.getString(3));
				b.setIfsc(rs.getString(4));
				b.setMicr(rs.getString(5));
				b.setAccountNo(rs.getString(6));
				
				String date = rs.getString(7);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				
				b.setDate(properDate);
			
				bankList.add(b);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bankList;
	}

	public Bank getReport(int bankId) {
		ResultSet rs = null;
		Connection con = null;
		Bank b = new Bank();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM BANK_MAST WHERE ID="+bankId;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				
				b.setId(rs.getInt(1));
				b.setCompanyId(rs.getInt(2));
				b.setBankName(rs.getString(3));
				b.setIfsc(rs.getString(4));
				b.setMicr(rs.getString(5));
				b.setAccountNo(rs.getString(6));
				
				String date = rs.getString(7);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				
				b.setDate(properDate);
			
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public ArrayList<Bank> getBankReport(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Bank> bankList = new ArrayList<Bank>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM BANK_MAST WHERE COMPANY_ID="+companyId;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Bank b = new Bank();
				b.setId(rs.getInt(1));
				b.setCompanyId(rs.getInt(2));
				b.setBankName(rs.getString(3));
				b.setIfsc(rs.getString(4));
				b.setMicr(rs.getString(5));
				b.setAccountNo(rs.getString(6));
				
				String date = rs.getString(7);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				
				b.setDate(properDate);
				
				bankList.add(b);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bankList;
	}
	
	public JSONArray getBankTransactions(String startDate, String endDate, int bankId, int companyId) {
		
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
			
			String sql = "SELECT UNIQUE\r\n" + 
					"    TR.ID   TR_ID,\r\n" + 
					"    TR.TRANSACTION_DATE,\r\n" + 
					"    TR.VOUCH_NO,\r\n" + 
					"    TR.VOUCH_REF,\r\n" + 
					"    TR.ACCOUNT_ID,\r\n" + 
					"    TR.DEBIT,\r\n" + 
					"    TR.CREDIT,\r\n" + 
					"    TR.NARRATION,\r\n" + 
					"    AC.ID   ACC_CAT_ID,\r\n" + 
					"    AC.CATEGORY_NAME,\r\n" + 
					"    AG.ID   ACC_GRP_ID,\r\n" + 
					"    AG.GROUP_NAME\r\n" + 
					"FROM\r\n" + 
					"    TRANSACTIONS       TR,\r\n" + 
					"    ACCOUNT_NAME       AN,\r\n" + 
					"    ACCOUNT_CATEGORY   AC,\r\n" + 
					"    ACCOUNT_GROUP      AG\r\n" + 
					"WHERE\r\n" + 
					"    TR.ACCOUNT_ID = AN.ACCOUNT_ID\r\n" + 
					"    AND AN.ACC_CATEGORY_ID = AC.ID\r\n" + 
					"    AND AC.ACC_GROUP_ID = AG.ID\r\n" + 
					"    AND AN.COMPANY_ID = ?\r\n" + 
					"    AND AN.BANK_ID = ?\r\n" + 
					"    AND TR.TRANSACTION_DATE BETWEEN ? AND ?\r\n" + 
					"ORDER BY\r\n" + 
					"    TR.VOUCH_NO,\r\n" + 
					"    TR.TRANSACTION_DATE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, companyId);
			stmt.setInt(2, bankId);
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
	
	public double getOpeningBalForLedger(int bankId, int companyId, String startDate) {
		Connection con = null;
		double openingBal = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String getOpeningBal = "{ ? = call GET_OPENING_BAL_BANK(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(getOpeningBal);
			
			java.sql.Date date = java.sql.Date.valueOf(startDate);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, companyId);
			cs.setInt(3, bankId);
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
	
public JSONObject getBankFromAccountId(int accountId) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    AN.BANK_ID,\r\n" + 
					"    BM.BANK_NAME,\r\n" + 
					"    BM.COMPANY_ID\r\n" + 
					"FROM\r\n" + 
					"    ACCOUNT_NAME   AN,\r\n" + 
					"    BANK_MAST      BM\r\n" + 
					"WHERE\r\n" + 
					"    AN.BANK_ID = BM.ID\r\n" + 
					"    AND AN.ACCOUNT_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, accountId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				

				obj.put("bankId", rs.getString(1));
				obj.put("bankName", rs.getString(2));
				obj.put("companyId", rs.getString(3));
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	
}

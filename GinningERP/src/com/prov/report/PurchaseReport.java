package com.prov.report;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class PurchaseReport {
	
	public double getCashReport(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(CASH_AMOUNT) FROM INVOICE_MAST WHERE COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				 amount = rs.getDouble(1);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	public double getChequeReport(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(CHEQUE_AMOUNT) FROM INVOICE_MAST WHERE COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				 amount = rs.getDouble(1);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	public double getRtgsReport(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(RTGS_AMOUNT) FROM INVOICE_MAST WHERE COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				 amount = rs.getDouble(1);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	
	public double getPdcReport(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(PDC_AMOUNT) FROM INVOICE_MAST WHERE COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				 amount = rs.getDouble(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	public double getTotalPurchase(int companyId) {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT (SUM(CASH_AMOUNT)+SUM(CHEQUE_AMOUNT)+SUM(RTGS_AMOUNT)+SUM(PDC_AMOUNT)) FROM INVOICE_MAST WHERE COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				 amount = rs.getDouble(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}

	
	/*
	 * -----------------------------------------------------------------------------------------
	 */
	
	public double getCashReport() {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(CASH_AMOUNT) FROM INVOICE_MAST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				 amount = rs.getDouble(1);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	public double getChequeReport() {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(CHEQUE_AMOUNT) FROM INVOICE_MAST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				 amount = rs.getDouble(1);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	public double getRtgsReport() {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(RTGS_AMOUNT) FROM INVOICE_MAST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				 amount = rs.getDouble(1);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	
	public double getPdcReport() {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT SUM(PDC_AMOUNT) FROM INVOICE_MAST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				 amount = rs.getDouble(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}
	
	public double getTotalPurchase() {
		ResultSet rs = null;
		Connection con = null;
		double amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT (SUM(CASH_AMOUNT)+SUM(CHEQUE_AMOUNT)+SUM(RTGS_AMOUNT)+SUM(PDC_AMOUNT)) FROM INVOICE_MAST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				 amount = rs.getDouble(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return amount;
	}

	
	public JSONObject getTodaysTotalPurchase() {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject json = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
						"    NVL(SUM(RTGS_AMOUNT), 0),\r\n" + 
						"    NVL(SUM(CHEQUE_AMOUNT), 0),\r\n" + 
						"    NVL(SUM(CASH_AMOUNT), 0)\r\n" + 
						"FROM\r\n" + 
						"    INVOICE_MAST\r\n" + 
						"WHERE\r\n" + 
						"    INV_DATE = TRUNC(SYSDATE)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				json.put("rtgsAmount", rs.getDouble(1));
				json.put("chequeAmount", rs.getDouble(2));
				json.put("cashAmount", rs.getDouble(3));
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
public JSONObject getTotalPurchaseBetweenDate(String startDate, String endDate) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject json = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(RTGS_AMOUNT), 0),\r\n" + 
					"    NVL(SUM(CHEQUE_AMOUNT), 0),\r\n" + 
					"    NVL(SUM(CASH_AMOUNT), 0)\r\n" + 
					"FROM\r\n" + 
					"    INVOICE_MAST\r\n" + 
					"WHERE\r\n" + 
					"    INV_DATE BETWEEN ? AND ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			Date startDateSql = Date.valueOf(startDate);
			Date endDateSql = Date.valueOf(endDate);
			stmt.setDate(1, startDateSql);
			stmt.setDate(2, endDateSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				json.put("rtgsAmount", rs.getDouble(1));
				json.put("chequeAmount", rs.getDouble(2));
				json.put("cashAmount", rs.getDouble(3));
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}


public JSONObject getTotalPurchaseBetweenDate(String startDate, String endDate, int companyId) {
	
	ResultSet rs = null;
	Connection con = null;
	JSONObject json = new JSONObject();
	
	try {
		con = OracleConnection.getConnection();
		
		String sql = "SELECT\r\n" + 
				"    NVL(SUM(RTGS_AMOUNT), 0),\r\n" + 
				"    NVL(SUM(CHEQUE_AMOUNT), 0),\r\n" + 
				"    NVL(SUM(CASH_AMOUNT), 0)\r\n" + 
				"FROM\r\n" + 
				"    INVOICE_MAST\r\n" + 
				"WHERE\r\n" + 
				"    INV_DATE BETWEEN ? AND ?\r\n" + 
				"    AND COMPANY_ID = ?";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		Date startDateSql = Date.valueOf(startDate);
		Date endDateSql = Date.valueOf(endDate);
		stmt.setDate(1, startDateSql);
		stmt.setDate(2, endDateSql);
		stmt.setInt(3, companyId);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			json.put("rtgsAmount", rs.getDouble(1));
			json.put("chequeAmount", rs.getDouble(2));
			json.put("cashAmount", rs.getDouble(3));
		}
		rs.close();
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return json;
}


	
public long getTodaysPdpPurchase(String paymentMode) {
		
		ResultSet rs = null;
		Connection con = null;
		long amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PM.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PDC_MAST       PM,\r\n" + 
					"    INVOICE_MAST   IM\r\n" + 
					"WHERE\r\n" + 
					"    PM.MODE_OF_PAYMENT = ?\r\n" + 
					"    AND PM.INVOICE_ID = IM.ID\r\n" + 
					"    AND IM.INV_DATE = TRUNC(SYSDATE)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, paymentMode);
			
			rs = stmt.executeQuery();
		
			while (rs.next()) {
				amount = rs.getLong(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	}


	public long getTotalPdpPurchaseBetweenDate(String paymentMode, String startDate, String endDate) {
		
		ResultSet rs = null;
		Connection con = null;
		long amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PM.AMOUNT), 0)\r\n" + 
					"FROM\r\n" + 
					"    PDC_MAST       PM,\r\n" + 
					"    INVOICE_MAST   IM\r\n" + 
					"WHERE\r\n" + 
					"    PM.MODE_OF_PAYMENT = ?\r\n" + 
					"    AND PM.INVOICE_ID = IM.ID\r\n" + 
					"    AND IM.INV_DATE BETWEEN ? AND ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			Date startDateSql = Date.valueOf(startDate);
			Date endDateSql = Date.valueOf(endDate);
			stmt.setString(1, paymentMode);
			stmt.setDate(2, startDateSql);
			stmt.setDate(3, endDateSql);
			
			rs = stmt.executeQuery();
		
			while (rs.next()) {
				amount = rs.getLong(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	}

	public long getTotalPdpPurchaseBetweenDate(String paymentMode, String startDate, String endDate, int companyId) {
		
		ResultSet rs = null;
		Connection con = null;
		long amount = 0;
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"   NVL(SUM(PM.AMOUNT), 0)\r\n" + 
					"FROM\r\n" + 
					"   PDC_MAST       PM,\r\n" + 
					"   INVOICE_MAST   IM\r\n" + 
					"WHERE\r\n" + 
					"   PM.MODE_OF_PAYMENT = ?\r\n" + 
					"   AND PM.INVOICE_ID = IM.ID\r\n" + 
					"   AND IM.INV_DATE BETWEEN ? AND ?\r\n" + 
					"   AND COMPANY_ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			Date startDateSql = Date.valueOf(startDate);
			Date endDateSql = Date.valueOf(endDate);
			stmt.setString(1, paymentMode);
			stmt.setDate(2, startDateSql);
			stmt.setDate(3, endDateSql);
			stmt.setInt(4, companyId);
			rs = stmt.executeQuery();
		
			while (rs.next()) {
				amount = rs.getLong(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	}

}


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
			
			String sql = "SELECT \r\n" + 
					"    NVL(SUM(PD.AMOUNT),0) \r\n" + 
					"FROM \r\n" + 
					"    PAYMENT_DETAILS   PD, \r\n" + 
					"    INVOICE_MAST      IM \r\n" + 
					"WHERE \r\n" + 
					"    PD.INVOICE_ID = IM.ID \r\n" + 
					"    AND MODE_ID = 1 \r\n" + 
					"    AND IM.COMPANY_ID = ?";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND MODE_ID = 2\r\n" + 
					"    AND IM.COMPANY_ID = ?";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND MODE_ID = 3\r\n" + 
					"    AND IM.COMPANY_ID = ?";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PDC.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PDC_MAST   PDC,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PDC.INVOICE_ID = IM.ID\r\n" + 
					"    AND IM.COMPANY_ID = ?";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND IM.COMPANY_ID = ?";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND MODE_ID = 1";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND MODE_ID = 2";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND MODE_ID = 3";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PDC_MAST   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID";
			
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
			
			String sql = "SELECT\r\n" + 
					"    NVL(SUM(PD.AMOUNT),0)\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID";
			
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
					"    SUM(\r\n" + 
					"        CASE\r\n" + 
					"            WHEN PD.MODE_ID = 1 THEN\r\n" + 
					"                PD.AMOUNT\r\n" + 
					"            ELSE\r\n" + 
					"                0\r\n" + 
					"        END\r\n" + 
					"    ) AS CASH_AMOUNT,\r\n" + 
					"    SUM(\r\n" + 
					"        CASE\r\n" + 
					"            WHEN PD.MODE_ID = 2 THEN\r\n" + 
					"                PD.AMOUNT\r\n" + 
					"            ELSE\r\n" + 
					"                0\r\n" + 
					"        END\r\n" + 
					"    ) AS CHEQUE_AMOUNT,\r\n" + 
					"    SUM(\r\n" + 
					"        CASE\r\n" + 
					"            WHEN PD.MODE_ID = 3 THEN\r\n" + 
					"                PD.AMOUNT\r\n" + 
					"            ELSE\r\n" + 
					"                0\r\n" + 
					"        END\r\n" + 
					"    ) AS RTGS_AMOUNT\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND IM.INV_DATE = TRUNC(SYSDATE)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				json.put("rtgsAmount", rs.getDouble(3));
				json.put("chequeAmount", rs.getDouble(2));
				json.put("cashAmount", rs.getDouble(1));
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
					"    SUM(\r\n" + 
					"        CASE\r\n" + 
					"            WHEN PD.MODE_ID = 1 THEN\r\n" + 
					"                PD.AMOUNT\r\n" + 
					"            ELSE\r\n" + 
					"                0\r\n" + 
					"        END\r\n" + 
					"    ) AS CASH_AMOUNT,\r\n" + 
					"    SUM(\r\n" + 
					"        CASE\r\n" + 
					"            WHEN PD.MODE_ID = 2 THEN\r\n" + 
					"                PD.AMOUNT\r\n" + 
					"            ELSE\r\n" + 
					"                0\r\n" + 
					"        END\r\n" + 
					"    ) AS CHEQUE_AMOUNT,\r\n" + 
					"    SUM(\r\n" + 
					"        CASE\r\n" + 
					"            WHEN PD.MODE_ID = 3 THEN\r\n" + 
					"                PD.AMOUNT\r\n" + 
					"            ELSE\r\n" + 
					"                0\r\n" + 
					"        END\r\n" + 
					"    ) AS RTGS_AMOUNT\r\n" + 
					"FROM\r\n" + 
					"    PAYMENT_DETAILS   PD,\r\n" + 
					"    INVOICE_MAST      IM\r\n" + 
					"WHERE\r\n" + 
					"    PD.INVOICE_ID = IM.ID\r\n" + 
					"    AND IM.INV_DATE BETWEEN ? AND ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			Date startDateSql = Date.valueOf(startDate);
			Date endDateSql = Date.valueOf(endDate);
			stmt.setDate(1, startDateSql);
			stmt.setDate(2, endDateSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				json.put("rtgsAmount", rs.getDouble(3));
				json.put("chequeAmount", rs.getDouble(2));
				json.put("cashAmount", rs.getDouble(1));
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
				"    SUM(\r\n" + 
				"        CASE\r\n" + 
				"            WHEN PD.MODE_ID = 1 THEN\r\n" + 
				"                PD.AMOUNT\r\n" + 
				"            ELSE\r\n" + 
				"                0\r\n" + 
				"        END\r\n" + 
				"    ) AS CASH_AMOUNT,\r\n" + 
				"    SUM(\r\n" + 
				"        CASE\r\n" + 
				"            WHEN PD.MODE_ID = 2 THEN\r\n" + 
				"                PD.AMOUNT\r\n" + 
				"            ELSE\r\n" + 
				"                0\r\n" + 
				"        END\r\n" + 
				"    ) AS CHEQUE_AMOUNT,\r\n" + 
				"    SUM(\r\n" + 
				"        CASE\r\n" + 
				"            WHEN PD.MODE_ID = 3 THEN\r\n" + 
				"                PD.AMOUNT\r\n" + 
				"            ELSE\r\n" + 
				"                0\r\n" + 
				"        END\r\n" + 
				"    ) AS RTGS_AMOUNT\r\n" + 
				"FROM\r\n" + 
				"    PAYMENT_DETAILS   PD,\r\n" + 
				"    INVOICE_MAST      IM\r\n" + 
				"WHERE\r\n" + 
				"    PD.INVOICE_ID = IM.ID\r\n" + 
				"    AND IM.INV_DATE BETWEEN ? AND ?\r\n" + 
				"    AND COMPANY_ID = ?";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		Date startDateSql = Date.valueOf(startDate);
		Date endDateSql = Date.valueOf(endDate);
		stmt.setDate(1, startDateSql);
		stmt.setDate(2, endDateSql);
		stmt.setInt(3, companyId);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			json.put("rtgsAmount", rs.getDouble(3));
			json.put("chequeAmount", rs.getDouble(2));
			json.put("cashAmount", rs.getDouble(1));
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


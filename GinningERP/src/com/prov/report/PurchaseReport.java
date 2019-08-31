package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}

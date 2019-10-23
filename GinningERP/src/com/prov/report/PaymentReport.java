package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class PaymentReport {
	
	public JSONArray getPaymentReport(int invoiceId) {
			
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArray = new JSONArray();
			
			try {
				con = OracleConnection.getConnection();
				
				String sql = "SELECT * FROM PAYMENT_DETAILS WHERE INVOICE_ID = ?";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				
				rs = stmt.executeQuery();
				
				while (rs.next()) {
					
					JSONObject obj = new JSONObject();
					
					obj.put("id", rs.getString(1));
					obj.put("invoiceId", rs.getString(2));
					obj.put("modeId", rs.getString(3));
					obj.put("amount", rs.getString(4));
					obj.put("paymentStatus", rs.getString(5));
					obj.put("chequeId", rs.getString("CHEQUE_ID"));
					obj.put("rtgsId", rs.getString("RTGS_ID"));
					obj.put("voucherNo", rs.getString("CASH_VOUCH_NO"));
					
					jsonArray.put(obj);
				}
				
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return jsonArray;
	}
	
	public JSONObject getCashReport(int invoiceId) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();	
			try {
				con = OracleConnection.getConnection();
				
				String sql = "SELECT * FROM PAYMENT_DETAILS WHERE MODE_ID = 1 AND INVOICE_ID = ?";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				
				stmt.setInt(1, invoiceId);
				
				rs = stmt.executeQuery();
				
				while (rs.next()) {
					
					obj.put("id", rs.getString(1));
					obj.put("invoiceId", rs.getString(2));
					obj.put("modeId", rs.getString(3));
					obj.put("amount", rs.getString(4));
					obj.put("paymentStatus", rs.getString(5));
					obj.put("voucherNo", rs.getString("CASH_VOUCH_NO"));
					
				}
				
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return obj;
	}
	
	public JSONObject getChequeReport(int invoiceId) {
			
			ResultSet rs = null;
			Connection con = null;
			JSONObject obj = new JSONObject();	
				try {
					con = OracleConnection.getConnection();
					
					String sql = "SELECT * FROM PAYMENT_DETAILS WHERE MODE_ID = 2 AND INVOICE_ID = ?";
					
					PreparedStatement stmt = con.prepareStatement(sql);
					stmt.setInt(1, invoiceId);
					rs = stmt.executeQuery();
					
					while (rs.next()) {
						
						obj.put("id", rs.getString(1));
						obj.put("invoiceId", rs.getString(2));
						obj.put("modeId", rs.getString(3));
						obj.put("amount", rs.getString(4));
						obj.put("paymentStatus", rs.getString(5));
						obj.put("chequeId", rs.getString("CHEQUE_ID"));
						
					}
					
					rs.close();
					stmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return obj;
		}

	public JSONObject getRtgsReport(int invoiceId) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();
			
			try {
				con = OracleConnection.getConnection();
				
				String sql = "SELECT * FROM PAYMENT_DETAILS WHERE MODE_ID = 3 AND INVOICE_ID = ?";
				
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setInt(1, invoiceId);
				rs = stmt.executeQuery();
				
				while (rs.next()) {
					
					obj.put("id", rs.getString(1));
					obj.put("invoiceId", rs.getString(2));
					obj.put("modeId", rs.getString(3));
					obj.put("amount", rs.getString(4));
					obj.put("paymentStatus", rs.getString(5));
					obj.put("rtgsId", rs.getString("RTGS_ID"));
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

package com.prov.report;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.Rtgs;
import com.prov.db.OracleConnection;

public class RtgsReport {
	
	public ArrayList<Rtgs> rtgsReport(){
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Rtgs> rtgsReport = new ArrayList<Rtgs>();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM RTGS_MASTER ORDER BY RTGS_DATE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				Rtgs rtgs = new Rtgs();
				
				rtgs.setId(rs.getInt(1));
				rtgs.setInvoiceId(rs.getInt(2));
				rtgs.setCustomerId(rs.getInt(3));
				rtgs.setAccountNo(rs.getString(4));
				rtgs.setBankName(rs.getString(5));
				rtgs.setIfsc(rs.getString(6));
				rtgs.setRtgsAmount(rs.getLong(7));
				rtgs.setRtgsDate(rs.getString(8));
				rtgs.setCustomerName(rs.getString(9));
				rtgs.setInvoiceNo(rs.getString(10));
				
				rtgsReport.add(rtgs);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rtgsReport;
	}
	
	public JSONObject rtgsReport(int rtgsId){
		ResultSet rs = null;
		Connection con = null;
		JSONObject obj = new JSONObject();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM RTGS_MASTER WHERE ID = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, rtgsId);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				obj.put("id",rs.getInt(1));
				obj.put("invoiceId",rs.getInt(2));
				obj.put("customerId",rs.getInt(3));
				obj.put("accountNo",rs.getString(4));
				obj.put("bankName",rs.getString(5));
				obj.put("ifscCode",rs.getString(6));
				obj.put("rtgsAmount",rs.getLong(7));
				obj.put("rtgsDate",rs.getString(8));
				obj.put("customerName",rs.getString(9));
				obj.put("invoiceNo",rs.getString(10));
				obj.put("rtgsVoucherNo",rs.getString(11));
				
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	
	public int todaysRtgsCount(int companyId){
		ResultSet rs = null;
		Connection con = null;
		
		int count = 0;
		try {
			con = OracleConnection.getConnection();
			
			String sql = "select count(im.id) from rtgs_master rm, invoice_mast im where trunc(RTGS_DATE) = trunc(sysdate) and rm.invoice_id = im.id and im.company_id = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, companyId);
			
			rs = stmt.executeQuery();
			
			
			while (rs.next()) {
				count = rs.getInt(1);
				
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public JSONArray getRtgsReportforPayment(String rtgsDate) {
		ResultSet rs = null;
		Connection con = null;
		JSONArray arr = new JSONArray();
		try {
			con = OracleConnection.getConnection();
			
			Date date = Date.valueOf(rtgsDate);
			
			String sql = "SELECT DISTINCT\r\n" + 
					"   II.WEIGHMENT_ID,\r\n" + 
					"   RT.ID,\r\n" + 
					"   RT.INVOICE_ID,\r\n" + 
					"   RT.CUSTOMER_ID,\r\n" + 
					"   RT.ACC_NO,\r\n" + 
					"   RT.BANK_NAME,\r\n" + 
					"   RT.IFSC_CODE,\r\n" + 
					"   RT.AMOUNT,\r\n" + 
					"   RT.RTGS_DATE,\r\n" + 
					"   RT.CUSTOMER_NAME,\r\n" + 
					"   RT.INVOICE_NO,\r\n" + 
					"   RT.VOUCHER_NO,\r\n" + 
					"   IM.COMPANY_ID,\r\n" + 
					"   WM.DS_ID,\r\n" + 
					"   DS.BANK_ID \r\n" + 
					"FROM\r\n" + 
					"   INVOICE_ITEMS   II,\r\n" + 
					"   RTGS_MASTER     RT,\r\n" + 
					"   INVOICE_MAST    IM,\r\n" + 
					"   WEIGH_MAST      WM,\r\n" + 
					"   DAILY_SETUP DS\r\n" + 
					"WHERE\r\n" + 
					"   RT.INVOICE_ID = IM.ID\r\n" + 
					"   AND II.INVOICE_ID = IM.ID\r\n" + 
					"   AND WM.ID = II.WEIGHMENT_ID\r\n" + 
					"   AND DS.ID = WM.DS_ID\r\n" + 
					"   AND RT.VOUCHER_NO IS NULL\r\n" + 
					"   AND RT.RTGS_DATE = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setDate(1, date);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("weighmentId",rs.getInt(1));
				obj.put("id",rs.getInt(2));
				obj.put("invoiceId",rs.getInt(3));
				obj.put("customerId",rs.getInt(4));
				obj.put("accountNo",rs.getString(5));
				obj.put("bankName",rs.getString(6));
				obj.put("ifscCode",rs.getString(7));
				obj.put("rtgsAmount",rs.getLong(8));
				obj.put("rtgsDate",rs.getString(9));
				obj.put("customerName",rs.getString(10));
				obj.put("invoiceNo",rs.getString(11));
				obj.put("rtgsVoucherNo",rs.getString(12));
				obj.put("companyId",rs.getString(13));
				obj.put("dailySetupId",rs.getString(14));
				obj.put("bankId",rs.getString(15));
				
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
	
	
	public JSONArray getRtgsReportforPayment() {
		ResultSet rs = null;
		Connection con = null;
		JSONArray arr = new JSONArray();
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT DISTINCT\r\n" + 
					"   II.WEIGHMENT_ID,\r\n" + 
					"   RT.ID,\r\n" + 
					"   RT.INVOICE_ID,\r\n" + 
					"   RT.CUSTOMER_ID,\r\n" + 
					"   RT.ACC_NO,\r\n" + 
					"   RT.BANK_NAME,\r\n" + 
					"   RT.IFSC_CODE,\r\n" + 
					"   RT.AMOUNT,\r\n" + 
					"   RT.RTGS_DATE,\r\n" + 
					"   RT.CUSTOMER_NAME,\r\n" + 
					"   RT.INVOICE_NO,\r\n" + 
					"   RT.VOUCHER_NO,\r\n" + 
					"   IM.COMPANY_ID,\r\n" + 
					"   WM.DS_ID,\r\n" + 
					"   DS.BANK_ID \r\n" + 
					"FROM\r\n" + 
					"   INVOICE_ITEMS   II,\r\n" + 
					"   RTGS_MASTER     RT,\r\n" + 
					"   INVOICE_MAST    IM,\r\n" + 
					"   WEIGH_MAST      WM,\r\n" + 
					"   DAILY_SETUP DS\r\n" + 
					"WHERE\r\n" + 
					"   RT.INVOICE_ID = IM.ID\r\n" + 
					"   AND II.INVOICE_ID = IM.ID\r\n" + 
					"   AND WM.ID = II.WEIGHMENT_ID\r\n" + 
					"   AND DS.ID = WM.DS_ID";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("weighmentId",rs.getInt(1));
				obj.put("id",rs.getInt(2));
				obj.put("invoiceId",rs.getInt(3));
				obj.put("customerId",rs.getInt(4));
				obj.put("accountNo",rs.getString(5));
				obj.put("bankName",rs.getString(6));
				obj.put("ifscCode",rs.getString(7));
				obj.put("rtgsAmount",rs.getLong(8));
				obj.put("rtgsDate",rs.getString(9));
				obj.put("customerName",rs.getString(10));
				obj.put("invoiceNo",rs.getString(11));
				obj.put("rtgsVoucherNo",rs.getString(12));
				obj.put("companyId",rs.getString(13));
				obj.put("dailySetupId",rs.getString(14));
				obj.put("bankId",rs.getString(15));
				
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

package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
				obj.put("cuatomerName",rs.getString(9));
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

}

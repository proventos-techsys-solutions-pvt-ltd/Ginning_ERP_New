package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.PDC;
import com.prov.db.OracleConnection;

public class PDCReport {

	public JSONArray getPDCReport() {
		ResultSet rs = null;
		Connection con = null;

		JSONArray jsonArray = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT PDC.ID,\r\n" + 
					"PDC.ID,\r\n" + 
					"PDC.CUSTOMER_ID,\r\n" + 
					"PDC.INVOICE_ID,\r\n" + 
					"PDC.BANK_ID,\r\n" + 
					"PDC.PAYEE_NAME,\r\n" + 
					"PDC.CHEQUE_DATE,\r\n" + 
					"PDC.CHEQUE_AMOUNT,\r\n" + 
					"IM.INVOICE_NO,\r\n" + 
					"BM.BANK_NAME,\r\n" + 
					"BM.ACCOUNT_NO,\r\n" + 
					"COMP.ID,\r\n" + 
					"COMP.NAME\r\n" + 
					"FROM PDC_MAST PDC,\r\n" + 
					"INVOICE_MAST IM,\r\n" + 
					"BANK_MAST BM,\r\n" + 
					"company_master COMP\r\n" + 
					"WHERE\r\n" + 
					"pdc.invoice_id = IM.ID AND\r\n" + 
					"pdc.bank_id = BM.ID AND\r\n" + 
					"im.company_id = COMP.ID";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();
				
				obj.put("pdcId", rs.getString(1));
				obj.put("customerId", rs.getString(2));
				obj.put("invoiceId", rs.getString(3));
				obj.put("bankId", rs.getString(4));
				obj.put("payeeName", rs.getString(5));
				obj.put("chequeDate", rs.getString(6));
				obj.put("chequeAmount", rs.getString(7));
				obj.put("invoiceNo", rs.getString(8));
				obj.put("bankName", rs.getString(9));
				obj.put("accountNo", rs.getString(10));
				obj.put("companyId", rs.getString(11));
				obj.put("companyName", rs.getString(12));
				
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
	
	public PDC getPDCData(int invoiceId) {
		ResultSet rs = null;
		Connection con = null;

		PDC pdc = new PDC();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT *" + 
					"FROM PDC_MAST ,\r\n" + 
					"WHERE\r\n" + 
					"pdc.invoice_id = ? \r\n";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				pdc.setId(rs.getInt(1));
				pdc.setCustomerId(rs.getInt(2));
				pdc.setInvoiceId(rs.getInt(3));
				pdc.setBankId(rs.getInt(4));
				pdc.setPayeeName(rs.getString(5));
				pdc.setChequeDate(rs.getString(6));
				pdc.setChequeAmount(rs.getDouble(7));
				pdc.setChequeNo(rs.getString(8));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pdc;
	}
}

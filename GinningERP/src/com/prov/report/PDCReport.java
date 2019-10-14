package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

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
			
			String sql = "SELECT \r\n" + 
						"PDC.ID PDC_ID,\r\n" + 
						"PDC.CUSTOMER_ID,\r\n" + 
						"PDC.INVOICE_ID,\r\n" + 
						"PDC.AMOUNT,\r\n" + 
						"PDC.PAY_DATE,\r\n" + 
						"PDC.MODE_OF_PAYMENT,\r\n" + 
						"IM.INVOICE_NO,\r\n" + 
						"COMP.ID COMPANY_ID,\r\n" + 
						"COMP.NAME COMPANY_NAME,\r\n" + 
						"CM.NAME CUSTOMER_NAME\r\n" + 
						"FROM PDC_MAST PDC,\r\n" + 
						"INVOICE_MAST IM,\r\n" + 
						"company_master COMP,\r\n" + 
						"CUSTOMER_MAST CM\r\n" + 
						"WHERE\r\n" + 
						"pdc.invoice_id = IM.ID AND\r\n" + 
						"im.company_id = COMP.ID AND\r\n" + 
						"CM.ID = pdc.customer_id";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject obj = new JSONObject();
				
				obj.put("pdcId", rs.getString(1));
				obj.put("customerId", rs.getString(2));
				obj.put("invoiceId", rs.getString(3));
				obj.put("amount", rs.getString(4));
				
				String date = rs.getString(5);
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy");
				
				Date dateObj = sdf1.parse(date);
				String dateFormatted = sdf2.format(dateObj);
				
				obj.put("payDate", dateFormatted);
				obj.put("modeOfPayment", rs.getString(6));
				obj.put("invoiceNo", rs.getString(7));
				obj.put("companyId", rs.getString(8));
				obj.put("companyName", rs.getString(9));
				obj.put("customerName", rs.getString(10));
				
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
			
			String sql = "SELECT *\r\n" + 
					"FROM PDC_MAST\r\n" + 
					"WHERE \r\n" + 
					"PDC_MAST.invoice_id =? \r\n";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, invoiceId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				pdc.setId(rs.getInt(1));
				pdc.setCustomerId(rs.getInt(2));
				pdc.setInvoiceId(rs.getInt(3));
				pdc.setAmount(rs.getDouble(4));
				pdc.setPayDate(rs.getString(5));
				pdc.setModeOfPayment(rs.getString(6));
				pdc.setChequeId(rs.getInt(7));
				pdc.setRtgsId(rs.getInt(8));
				pdc.setVoucherNo(rs.getInt(9));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pdc;
	}
	
	/*
	 * public JSONObject getPDCForPrinting(int chequeId) { ResultSet rs = null;
	 * Connection con = null; SimpleDateFormat sdf1 = new
	 * SimpleDateFormat("yyyy-MM-dd"); SimpleDateFormat sdf2 = new
	 * SimpleDateFormat("dd-MM-yyyy"); NumberToWords ntw = new NumberToWords();
	 * JSONObject jsonObject = new JSONObject();
	 * 
	 * try { con = OracleConnection.getConnection();
	 * 
	 * String sql =
	 * "SELECT PAYEE_NAME, CHEQUE_AMOUNT, CHEQUE_DATE FROM PDC_MAST WHERE ID =?";
	 * 
	 * PreparedStatement stmt = con.prepareStatement(sql);
	 * 
	 * stmt.setInt(1, chequeId);
	 * 
	 * rs = stmt.executeQuery();
	 * 
	 * while (rs.next()) {
	 * 
	 * jsonObject.put("vendor", rs.getString(1)); double amount =
	 * Double.parseDouble(rs.getString(2)); String amountInWords =
	 * ntw.convertToIndianCurrency(Double.toString(amount));
	 * jsonObject.put("totalInDigits", Double.toString(amount) + " /-");
	 * jsonObject.put("totalInWords", amountInWords); String date = rs.getString(3);
	 * Date dateObj = sdf1.parse(date); String dateFormatted = sdf2.format(dateObj);
	 * dateFormatted = dateFormatted.replaceAll("-", ""); String[] dateArr =
	 * dateFormatted.split(""); jsonObject.put("d1", dateArr[0].trim());
	 * jsonObject.put("d2", dateArr[1].trim()); jsonObject.put("m1",
	 * dateArr[2].trim()); jsonObject.put("m2", dateArr[3].trim());
	 * jsonObject.put("y1", dateArr[4].trim()); jsonObject.put("y2",
	 * dateArr[5].trim()); jsonObject.put("y3", dateArr[6].trim());
	 * jsonObject.put("y4", dateArr[7].trim());
	 * 
	 * }
	 * 
	 * rs.close(); stmt.close(); con.close(); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * return jsonObject; }
	 */
	
}

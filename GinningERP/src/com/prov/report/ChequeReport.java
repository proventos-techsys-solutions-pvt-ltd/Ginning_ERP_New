package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONObject;

import com.prov.bean.Cheque;
import com.prov.db.OracleConnection;
import com.prov.misc.NumberToWords;

public class ChequeReport {
	
	public Cheque getChequeReport(int chequeId) {
	
		ResultSet rs = null;
		Connection con = null;
		Cheque c = new Cheque();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CHEQUE_MAST WHERE ID=?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, chequeId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				c.setId(rs.getInt(1));
				c.setCustomerId(Integer.parseInt(rs.getString(2)));
				c.setInvoiceId(Integer.parseInt(rs.getString(3)));
				c.setBankId(Integer.parseInt(rs.getString(4)));
				c.setCustomerName(rs.getString(5));
				c.setInvoiceNo(rs.getString(6));
				c.setBankName(rs.getString(7));
				c.setChequeNo(rs.getString(8));
				c.setChequeAmount(Long.parseLong(rs.getString(9)));
				c.setChequeDate(rs.getString(10));
				c.setStatus(rs.getInt(11));
				c.setPaymentStatus(rs.getInt(12));
				c.setVoucherNo(rs.getInt(13));
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return c;
	}
	
	
	public ArrayList<Cheque> getChequeReport() {
		
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Cheque> chequeList = new ArrayList<Cheque>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CHEQUE_MAST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				Cheque c = new Cheque();
				
				c.setId(rs.getInt(1));
				c.setCustomerId(Integer.parseInt(rs.getString(2)));
				c.setInvoiceId(Integer.parseInt(rs.getString(3)));
				c.setBankId(Integer.parseInt(rs.getString(4)));
				c.setCustomerName(rs.getString(5));
				c.setInvoiceNo(rs.getString(6));
				c.setBankName(rs.getString(7));
				c.setChequeNo(rs.getString(8));
				c.setChequeAmount(Long.parseLong(rs.getString(9)));
				
				String date = rs.getString(10);
				Date date1 = sdf.parse(date);
				String formattedDate = sdf1.format(date1);
				
				c.setChequeDate(formattedDate);
				c.setStatus(rs.getInt(11));
				c.setPaymentStatus(rs.getInt(12));
				c.setVoucherNo(rs.getInt(13));
				
				chequeList.add(c);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return chequeList;
	}
	
	
	public JSONObject getChequeForPrinting(int chequeId) {
		ResultSet rs = null;
		Connection con = null;
		JSONObject jsonObject = new JSONObject();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
		NumberToWords ntw = new NumberToWords();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
						"CUSTOMER_NAME,\r\n" + 
						"AMOUNT,\r\n" + 
						"CHEQUE_DATE\r\n" + 
						"FROM CHEQUE_MAST\r\n" + 
						"WHERE ID=?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, chequeId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				jsonObject.put("vendor", rs.getString(1));
				long amount = Long.parseLong(rs.getString(2));
				String amountInWords = ntw.convertToIndianCurrency(Long.toString(amount));
				jsonObject.put("totalInDigits", Long.toString(amount) + " /-");
				jsonObject.put("totalInWords", amountInWords);
				String date = rs.getString(3);
				Date dateObj = sdf1.parse(date);
				String dateFormatted = sdf2.format(dateObj);
				dateFormatted = dateFormatted.replaceAll("-", "");
				String[] dateArr = dateFormatted.split("");
				jsonObject.put("d1", dateArr[0].trim());
				jsonObject.put("d2", dateArr[1].trim());
				jsonObject.put("m1", dateArr[2].trim());
				jsonObject.put("m2", dateArr[3].trim());
				jsonObject.put("y1", dateArr[4].trim());
				jsonObject.put("y2", dateArr[5].trim());
				jsonObject.put("y3", dateArr[6].trim());
				jsonObject.put("y4", dateArr[7].trim());
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(jsonObject);
		return jsonObject;
	}
	
	
	public JSONObject getChequeForInvoice(int invoiceId) {
		ResultSet rs = null;
		Connection con = null;
		JSONObject json = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CHEQUE_MAST WHERE ID = (SELECT MAX(ID) FROM CHEQUE_MAST WHERE INVOICE_ID = ? AND NOT EXISTS (SELECT * FROM PDC_MAST WHERE CHEQUE_MAST.ID = pdc_mast.cheque_iD))";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, invoiceId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				json.put("chequeId", rs.getString(1));
				json.put("chqCustId", rs.getString(2));
				json.put("chqInvId", rs.getString(3));
				json.put("chqBnkId", rs.getString(4));
				json.put("chqName", rs.getString(5));
				json.put("chqInvNo", rs.getString(6));
				json.put("chqBnkName", rs.getString(7));
				json.put("chqNo", rs.getString(8));
				json.put("chqAmt", rs.getString(9));
				String date = rs.getString(10);
				Date dateFormat = sdf.parse(date);
				String dateStr = sdf.format(dateFormat);
				
				json.put("chqDate", dateStr);
				json.put("chqStatus", rs.getString(11));
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return json;
	}
	
	public JSONObject getChequeForInvoicePdc(int invoiceId) {
		ResultSet rs = null;
		Connection con = null;
		JSONObject json = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM CHEQUE_MAST WHERE ID = (SELECT MAX(CHEQUE_ID) FROM PDC_MAST WHERE iNVOICE_ID = ?)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, invoiceId);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				json.put("pdChequeId", rs.getString(1));
				json.put("pdchqCustId", rs.getString(2));
				json.put("pdchqInvId", rs.getString(3));
				json.put("pdchqBnkId", rs.getString(4));
				json.put("pdchqName", rs.getString(5));
				json.put("pdchqInvNo", rs.getString(6));
				json.put("pdchqBnkName", rs.getString(7));
				json.put("pdchqNo", rs.getString(8));
				json.put("pdchqAmt", rs.getString(9));
				json.put("pdchqDate", rs.getString(10));
				json.put("pdchqStatus", rs.getString(11));
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return json;
	}

}

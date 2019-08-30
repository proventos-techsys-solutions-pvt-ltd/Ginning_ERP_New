package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
				c.setChequeAmount(Double.parseDouble(rs.getString(9)));
				c.setChequeDate(rs.getString(10));
			
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return c;
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
				double amount = Double.parseDouble(rs.getString(2));
				String amountInWords = ntw.convertToIndianCurrency(Double.toString(amount));
				jsonObject.put("totalInDigits", Double.toString(amount) + " /-");
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
}

package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.Invoice;
import com.prov.db.OracleConnection;

public class InvoiceReport {
	
public Invoice getInvoiceData(int id) {
		
		ResultSet rs = null;
		Connection con = null;
		Invoice inv = new Invoice();
		
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT * FROM INVOICE_MAST WHERE id=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, id);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				inv.setId(rs.getInt(1));
				inv.setInvoiceNo(rs.getString(2));
				inv.setTotal(rs.getDouble(3));
				inv.setAmountPaid(rs.getDouble(4));
				inv.setPending(rs.getDouble(5));
				
				String date = rs.getString(6);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);
				inv.setInvDate(properDate);
				
				inv.setCompanyId(rs.getInt(7));
				inv.setCustomerId(rs.getInt(8));
				inv.setAuthorizer(rs.getString(9));
				inv.setNote(rs.getString(10));
				inv.setTotalQuanity(rs.getDouble(11));
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return inv;
		
	}


public ArrayList<Invoice> getReport() {
	
	ResultSet rs = null;
	Connection con = null;
	
	ArrayList<Invoice> reportList = new ArrayList<Invoice>();
	
	try {
		con = OracleConnection.getConnection();
		
		String invSql = "SELECT * FROM INVOICE_MAST";
		
		PreparedStatement stmt = con.prepareStatement(invSql);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			
			Invoice inv = new Invoice();
			
			inv.setId(rs.getInt(1));
			inv.setInvoiceNo(rs.getString(2));
			inv.setTotal(rs.getDouble(3));
			inv.setAmountPaid(rs.getDouble(4));
			inv.setPending(rs.getDouble(5));
			
			String date = rs.getString(6);
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			String properDate = format2.format(date1);

			inv.setInvDate(properDate);
			inv.setCompanyId(rs.getInt(7));
			inv.setCustomerId(rs.getInt(8));
			inv.setAuthorizer(rs.getString(9));
			inv.setNote(rs.getString(10));
			inv.setTotalQuanity(rs.getDouble(11));
			
			reportList.add(inv);
			
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return reportList;
}

	public JSONArray getInvoiceReport() {
		ResultSet rs = null;
		Connection con = null;
		
		JSONArray report = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT IM.ID, IM.INV_DATE, IM.INVOICE_NO, IM.COMPANY_ID, IM.CUSTOMER_ID, IM.PENDING, IM.TOTAL, IM.AMOUNTPAID, CM.NAME, CM.ADDRESS, CM.MOBILE\r\n" + 
					"FROM INVOICE_MAST IM, CUSTOMER_MAST CM\r\n" + 
					"WHERE IM.CUSTOMER_ID = CM.ID";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("invoiceId", rs.getString(1));
				
				String date = rs.getString(2);
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
				String properDate = format2.format(date1);
				
				jsonObj.put("invoiceDate", properDate);
				jsonObj.put("invoiceNo", rs.getString(3));
				jsonObj.put("companyId", rs.getInt(4));
				jsonObj.put("customerId", rs.getInt(5));
				jsonObj.put("pendingAmount", rs.getDouble(6));
				jsonObj.put("totalAmount", rs.getDouble(7));
				jsonObj.put("amountPaid", rs.getDouble(8));
				jsonObj.put("customerName", rs.getString(9));
				jsonObj.put("customerAddress", rs.getString(10));
				jsonObj.put("customerMobile", rs.getString(11));
				
				report.put(jsonObj);
				
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return report;
	}
	

}

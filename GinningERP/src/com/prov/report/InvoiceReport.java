package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.prov.bean.Invoice;
import com.prov.db.OracleConnection;

public class InvoiceReport {
	
public Invoice getInvoiceData(int rst) {
		
		ResultSet rs = null;
		Connection con = null;
		Invoice inv = new Invoice();
		
		
		try {
			con = OracleConnection.getConnection();
			
			String invSql = "SELECT * FROM INVOICE_MAST WHERE RST=?";
			
			PreparedStatement stmt = con.prepareStatement(invSql);
			
			stmt.setInt(1, rst);
			
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
			}
			
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return inv;
		
	}


public ArrayList<Invoice> getInvoiceReport() {
	
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
			inv.setCustomerId(rs.getInt(6));

			
			String date = rs.getString(7);
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			String properDate = format2.format(date1);

			inv.setInvDate(properDate);
			inv.setCompanyId(rs.getInt(8));
			
			reportList.add(inv);
			
		}
		
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return reportList;
	
}
	

}

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
				inv.setRst(rs.getInt(2));
				inv.setCid(rs.getInt(3));
				inv.setVid(rs.getInt(4));
				inv.setFinalRate(rs.getDouble(5));
				inv.setTotal(rs.getDouble(6));
				inv.setAmountPaid(rs.getDouble(7));
				inv.setPending(rs.getDouble(8));
				
				String date = rs.getString(9);
				
				Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
				SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
				String properDate = format2.format(date1);

				inv.setInvDate(properDate);
				inv.setInvoiceNo(rs.getString(10));
				inv.setCompanyId(rs.getInt(11));
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
			inv.setRst(rs.getInt(2));
			inv.setCid(rs.getInt(3));
			inv.setVid(rs.getInt(4));
			inv.setFinalRate(rs.getDouble(5));
			inv.setTotal(rs.getDouble(6));
			inv.setAmountPaid(rs.getDouble(7));
			inv.setPending(rs.getDouble(8));
			
			String date = rs.getString(9);
			
			Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
			String properDate = format2.format(date1);

			inv.setInvDate(properDate);
			inv.setInvoiceNo(rs.getString(10));
			inv.setCompanyId(rs.getInt(11));
			
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

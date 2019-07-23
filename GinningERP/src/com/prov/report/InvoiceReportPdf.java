package com.prov.report;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class InvoiceReportPdf {
	String invoiceNo = null;
	public InvoiceReportPdf(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	
	public ArrayList getInvoiceData() {
		Connection con= null;
		
		String command = "SELECT * FROM INVOICE_MAST WHERE id=?"
		Statement stmt = con.prepareStatement(command);
		ResultSet rs = stmt.executeQuery(command);
		
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
		return a;
	}
}

package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.Invoice;
import com.prov.db.OracleConnection;

public class UpdateInvoice {
	
public int updateInvoice(Invoice i) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateInvoice = "{ ? = call UPDATE_INVOICE(?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date invDate = new SimpleDateFormat("yyyy-MM-dd").parse(i.getInvDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date invSqlDate = new java.sql.Date(invDate.getDate());
			
			cs = con.prepareCall(updateInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, i.getId());
			cs.setInt(3, i.getRst() );
			cs.setInt(4, i.getCid());
			cs.setInt(5, i.getVid());
			cs.setDouble(6, i.getFinalRate());
			cs.setDouble(7, i.getTotal());
			cs.setDouble(8, i.getAmountPaid());
			cs.setDouble(9, i.getPending());
			cs.setDate(10, invSqlDate);
			cs.setString(11, i.getInvoiceNo());
			cs.setInt(12, i.getCompanyId());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			i.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
		
	}


	public int updateRate(Invoice i){
		
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateInvoice = " UPDATE INVOICE_MAST SET FINALRATE=?,"
				+ "	TOTAL=?,"
				+ "AMOUNTPAID=?,"
				+ "PENDING=?,"
				+ "INVOICE_NO=?,"
				+ "COMPANY_ID=?"
				+ "WHERE ID = ?";
		
		PreparedStatement stmt;
		try {
			stmt = con.prepareCall(updateInvoice);
			
			
			stmt.setDouble(1, i.getFinalRate());
			stmt.setDouble(2, i.getTotal());
			stmt.setDouble(3, i.getAmountPaid());
			stmt.setDouble(4, i.getPending());
			stmt.setString(5, i.getInvoiceNo());
			stmt.setInt(6, i.getCompanyId());
			stmt.setInt(7, i.getId());
			
			stmt.executeUpdate();
			
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful-"+i.getId());
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i.getId();
		
	}
	
public int createAmanatInvoice(Invoice i){
		
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateInvoice = " UPDATE INVOICE_MAST SET FINALRATE=?,"
				+ "	TOTAL=?,"
				+ "AMOUNTPAID=?,"
				+ "PENDING=?,"
				+ "INVOICE_NO=?,"
				+ "INV_DATE=?,"
				+ "COMPANY_ID=?"
				+ "WHERE ID = ?";
		
		PreparedStatement stmt;
		try {
			
			Date invDate = new SimpleDateFormat("yyyy-MM-dd").parse(i.getInvDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date invSqlDate = new java.sql.Date(invDate.getDate());
			
			stmt = con.prepareCall(updateInvoice);
			
			
			stmt.setDouble(1, i.getFinalRate());
			stmt.setDouble(2, i.getTotal());
			stmt.setDouble(3, i.getAmountPaid());
			stmt.setDouble(4, i.getPending());
			stmt.setString(5, i.getInvoiceNo());
			stmt.setDate(6,invSqlDate);
			stmt.setInt(7, i.getCompanyId());
			stmt.setInt(8, i.getId());
			
			stmt.executeUpdate();
			
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful-"+i.getId());
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i.getId();
		
	}
	
}

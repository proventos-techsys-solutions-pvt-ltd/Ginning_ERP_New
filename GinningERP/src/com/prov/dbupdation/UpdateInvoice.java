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

		String updateInvoice = "{ ? = call UPDATE_INVOICE(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date invDate = new SimpleDateFormat("yyyy-MM-dd").parse(i.getInvDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date invSqlDate = new java.sql.Date(invDate.getDate());
			
			cs = con.prepareCall(updateInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, i.getId());
			cs.setString(3, i.getInvoiceNo());
			cs.setLong(4, i.getTotal());
			cs.setLong(5, i.getAmountPaid());
			cs.setLong(6, i.getPending());
			cs.setDate(7, invSqlDate);
			cs.setInt(8, i.getCompanyId());
			cs.setInt(9, i.getCustomerId() );
			cs.setString(10, i.getAuthorizer() );
			cs.setString(11, i.getNote() );
			cs.setLong(12, i.getTotalQuanity() );
			cs.setLong(13, i.getCashAmount() );
			cs.setLong(14, i.getChequeAmount() );
			cs.setLong(15, i.getRtgsAmount() );
			cs.setInt(16, i.getPaidByoperator() );
			cs.setFloat(17, i.getUnloadingCharges() );
			cs.setFloat(18, i.getBonusAmount());
			cs.setLong(19, i.getNetPayable());
			
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

	public int updatePendingAmount(long amountPaid, int invoiceId) {
		
		Connection con = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateInvoice = "UPDATE INVOICE_MAST SET PENDING=(SELECT ((PENDING)-?) FROM INVOICE_MAST WHERE ID=?),"
													       + "AMOUNTPAID=(SELECT ((AMOUNTPAID)+?) FROM INVOICE_MAST WHERE ID=?)"
													       + "WHERE ID=?";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateInvoice);

			stmt.setLong(1, amountPaid);
			stmt.setInt(2, invoiceId);
			stmt.setLong(3, amountPaid);
			stmt.setInt(4, invoiceId);
			stmt.setInt(5, invoiceId);
			
			rowCount = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful - "+rowCount);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
	
	public int updateInvoicePaidStatus(int invoiceId) {
		
		Connection con = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateInvoice = "UPDATE INVOICE_MAST SET PAID_BY_OP = ? WHERE ID = ?";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateInvoice);

			stmt.setInt(1, 1);
			stmt.setInt(2, invoiceId);
			
			rowCount = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful - "+rowCount);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}

	
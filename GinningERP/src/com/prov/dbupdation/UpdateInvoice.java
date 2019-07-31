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

		String updateInvoice = "{ ? = call UPDATE_INVOICE(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date invDate = new SimpleDateFormat("yyyy-MM-dd").parse(i.getInvDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date invSqlDate = new java.sql.Date(invDate.getDate());
			
			cs = con.prepareCall(updateInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, i.getId());
			cs.setString(3, i.getInvoiceNo());
			cs.setDouble(4, i.getTotal());
			cs.setDouble(5, i.getAmountPaid());
			cs.setDouble(6, i.getPending());
			cs.setDate(7, invSqlDate);
			cs.setInt(8, i.getCompanyId());
			cs.setInt(9, i.getCustomerId() );
			cs.setString(10, i.getAuthorizer() );
			cs.setString(11, i.getNote() );
			cs.setDouble(12, i.getTotalQuanity() );
			cs.setDouble(13, i.getCashAmount() );
			cs.setDouble(14, i.getChequeAmount() );
			cs.setDouble(15, i.getRtgsAmount() );
			cs.setInt(16, i.getPaidByoperator() );
			cs.setFloat(17, i.getUnloadingCharges() );
			
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

	public int updatePendingAmount(double amountPaid, int invoiceId) {
		
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

			stmt.setDouble(1, amountPaid);
			stmt.setInt(2, invoiceId);
			stmt.setDouble(3, amountPaid);
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
}

	
package com.prov.delete;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class DeleteInvoiceEntry {
	
	public String deleteInvoiceEntry(int invoiceId) {

		String invoiceNo = null;
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "{ ? = call DELETE_INVOICE_ENTRY(?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(deleteSql);
			
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.setInt(2, invoiceId);
			
			cs.executeUpdate();
			
			invoiceNo =  cs.getString(1);
			
			cs.close();
			con.close();
			
			System.out.println("Deletion Succesful-"+invoiceNo);
			} catch (SQLException e) {
				e.printStackTrace();
			return null;
		}
		
		return invoiceNo;
		
	}

}

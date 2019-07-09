package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.InvoiceItems;
import com.prov.db.OracleConnection;

public class UpdateInvoiceItems {

	public int updateInvoiceItems(InvoiceItems ii)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateInvoiceItems = "{ ? = call UPDATE_INVOICEITEMS(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateInvoiceItems);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, ii.getId());
			cs.setInt(3, ii.getInvoiceId());
			cs.setInt(4, ii.getWeighmentId());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			ii.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
}

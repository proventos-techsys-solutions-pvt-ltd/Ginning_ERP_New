package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.InvoiceItems;
import com.prov.db.OracleConnection;

public class AddInvoiceItems {
	
public int addInvoiceItems(InvoiceItems ii) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addInvoiceItems = "{ ? = call ADD_INVOICEITEMS(?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addInvoiceItems);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, ii.getInvoiceId());
			cs.setInt(3, ii.getWeighmentId());
			cs.setInt(4, ii.getGradeId());
			cs.setInt(5, ii.getRst());
			cs.setDouble(6, 0);
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			ii.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


public int addInvoiceItemsForUpdation(InvoiceItems ii) {
	
	Connection con = null;
	int id = 0;
	try {
		con = OracleConnection.getConnection();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	String addInvoiceItems = "{ ? = call ADD_INVOICEITEMS(?,?,?,?,?) }";
	CallableStatement cs;
	try {
		cs = con.prepareCall(addInvoiceItems);
		
		cs.registerOutParameter(1, Types.NUMERIC);
		
		cs.setInt(2, ii.getInvoiceId());
		cs.setInt(3, ii.getWeighmentId());
		cs.setInt(4, ii.getGradeId());
		cs.setInt(5, ii.getRst());
		cs.setDouble(6, ii.getQuantity());
		
		cs.executeUpdate();
		
		id = cs.getInt(1);
		
		ii.setId(id);
		
		cs.close();
		con.close();
		
		System.out.println("Insertion Succesful"+id);
		} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return id;
}
}

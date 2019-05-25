package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Invoice;
import com.prov.db.OracleConnection;

public class AddInvoice {
	
public int addInvoice(Invoice i) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addInvoice = "{ ? = call ADD_INVOICE(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, i.getRst() );
			cs.setInt(3, i.getCid() );
			cs.setInt(4, i.getVid());
			cs.setDouble(5, i.getNetWeight());
			cs.setDouble(6, i.getFinalRate());
			cs.setDouble(7, i.getTotal());
			cs.setDouble(8, i.getAmountPaid());
			cs.setDouble(9, i.getPending());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			i.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

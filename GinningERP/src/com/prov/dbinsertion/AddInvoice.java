package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;
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

		String addInvoice = "{ ? = call ADD_INVOICE(?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date invDate = new SimpleDateFormat("yyyy-MM-dd").parse(i.getInvDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date invSqlDate = new java.sql.Date(invDate.getDate());
			
			cs = con.prepareCall(addInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, i.getWeighmentId() );
			cs.setString(3, i.getInvoiceNo());
			cs.setDouble(4, i.getTotal());
			cs.setDouble(5, i.getAmountPaid());
			cs.setDouble(6, i.getPending());
			cs.setDate(7, invSqlDate);
			cs.setInt(8, i.getCompanyId());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			i.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

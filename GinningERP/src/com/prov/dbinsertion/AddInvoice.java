package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
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

		String addInvoice = "{ ? = call ADD_INVOICE(?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date date=Date.valueOf(i.getInvDate());			
			cs = con.prepareCall(addInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, i.getInvoiceNo());
			cs.setDouble(3, i.getTotal());
			cs.setDouble(4, i.getAmountPaid());
			cs.setDouble(5, i.getPending());
			cs.setDate(6, date);
			cs.setInt(7, i.getCompanyId());
			cs.setInt(8, i.getCustomerId());
			cs.setString(9, i.getAuthorizer());
			cs.setString(10, i.getNote());
			cs.setDouble(11, i.getTotalQuanity());
			
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

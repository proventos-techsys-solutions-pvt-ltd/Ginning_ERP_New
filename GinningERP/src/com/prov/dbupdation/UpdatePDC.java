package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.PDC;
import com.prov.db.OracleConnection;

public class UpdatePDC {
	
	public int updatePDC(PDC p)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCheque = "{ ? = call UPDATE_PDC(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCheque);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(p.getChequeDate());
			
			cs.setInt(2, p.getId());
			cs.setInt(3, p.getCustomerId());
			cs.setInt(4, p.getInvoiceId());
			cs.setInt(5, p.getBankId());
			cs.setString(6, p.getPayeeName());
			cs.setDate(7, date);
			cs.setDouble(8, p.getChequeAmount());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			p.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

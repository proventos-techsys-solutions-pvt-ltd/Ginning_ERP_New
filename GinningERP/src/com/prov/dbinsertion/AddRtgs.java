package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.Rtgs;
import com.prov.db.OracleConnection;

public class AddRtgs {

	public int addCheque(Rtgs r)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String addAccountName = "{ ? = call ADD_CHEQUE(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			cs = con.prepareCall(addAccountName);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date = Date.valueOf(r.getRtgsDate());
			
			cs.setInt(2, r.getCustomerId());
			cs.setInt(3, r.getInvoiceId());
			cs.setString(4, r.getAccountNo());
			cs.setString(5, r.getBankName());
			cs.setString(6, r.getIfsc());
			cs.setDouble(7, r.getRtgsAmount());
			cs.setDate(8, date);
			cs.setString(8, r.getCustomerName());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			r.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

	
}

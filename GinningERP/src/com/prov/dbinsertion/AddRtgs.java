package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.Rtgs;
import com.prov.db.OracleConnection;

public class AddRtgs {

	public int addRtgsEntry(Rtgs r)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String addRtgs = "{ ? = call ADD_RTGS(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			cs = con.prepareCall(addRtgs);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			/*
			 * SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy"); java.util.Date date
			 * = sdf.parse(r.getRtgsDate());
			 * 
			 * SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd"); String
			 * dateFormatted = sdf2.format(date);
			 * System.out.println("Date --- "+dateFormatted);
			 */
			
			Date sqlDate = Date.valueOf(r.getRtgsDate());
			
			cs.setInt(2, r.getInvoiceId());
			cs.setInt(3, r.getCustomerId());
			cs.setString(4, r.getAccountNo());
			cs.setString(5, r.getBankName());
			cs.setString(6, r.getIfsc());
			cs.setLong(7, r.getRtgsAmount());
			cs.setDate(8, sqlDate);
			cs.setString(9, r.getCustomerName());
			cs.setString(10, r.getInvoiceNo());
			
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

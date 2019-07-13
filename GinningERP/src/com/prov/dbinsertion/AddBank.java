package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.Bank;
import com.prov.db.OracleConnection;

public class AddBank {
	
	public int addBank(Bank b) {

		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		
		
		
		String addBank = "{ ? = call ADD_BANK(?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			String date = b.getDate();
			Date sqlDate=Date.valueOf(date);
			
			cs = con.prepareCall(addBank);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, b.getCompanyId());
			cs.setString(3, b.getBankName() );
			cs.setString(4, b.getIfsc());
			cs.setString(5, b.getMicr());
			cs.setString(6, b.getAccountNo());
			cs.setDate(7, sqlDate);
			
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			b.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.CreditVoucher;
import com.prov.db.OracleConnection;

public class AddCreditEntry {
	
	public int addCreditEntry(CreditVoucher c)
	{

		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		
		String addCreditEntry = "{ ? = call ADD_VOUCHER_CREDIT(?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date voucherSqlDate=Date.valueOf(c.getVoucherDate());
			
			cs = con.prepareCall(addCreditEntry);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, c.getCompanyId());
			cs.setString(3, c.getFinancialYear());
			cs.setDate(4,voucherSqlDate);
			cs.setString(5, c.getVoucherNo());
			cs.setString(6, c.getVoucherRef());
			cs.setInt(7,c.getAccountNameId());
			cs.setString(8, c.getDescription());
			cs.setDouble(9,c.getCreditAmount());
			cs.setString(10, c.getPreparedBy());
			cs.setString(11,c.getAuthorizedBy());
			
			
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			c.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

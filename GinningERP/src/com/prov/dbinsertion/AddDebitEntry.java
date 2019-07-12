package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.DebitVoucher;
import com.prov.db.OracleConnection;

public class AddDebitEntry {
	
	public int addDebitEntry(DebitVoucher d)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		String addDebitEntry = "{ ? = call ADD_VOUCHER_DEBIT(?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date voucherSqlDate=Date.valueOf(d.getVoucherDate());
			
			cs = con.prepareCall(addDebitEntry);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, d.getCompanyId());
			cs.setString(3, d.getFinancialYear());
			cs.setDate(4,voucherSqlDate);
			cs.setString(5, d.getVoucherNo());
			cs.setString(6, d.getVoucherRef());
			cs.setInt(7,d.getAccountNameId());
			cs.setString(8, d.getDescription());
			cs.setDouble(9,d.getDebitAmount());
			cs.setString(10, d.getPreparedBy());
			cs.setString(11,d.getAuthorizedBy());
			
			
			
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			d.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

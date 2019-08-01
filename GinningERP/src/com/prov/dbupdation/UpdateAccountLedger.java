package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.AccountLedger;
import com.prov.db.OracleConnection;

public class UpdateAccountLedger {
	
	public int updateAccountLedger(AccountLedger al)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateAccountLedger = "{ ? = call UPDATE_ACCOUNTLEDGER(?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateAccountLedger);
			
			Date date=Date.valueOf(al.getLedgerDate());			
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setDate(2, date);
			cs.setInt(3, al.getMonthId());
			cs.setInt(4, al.getAccountId());
			cs.setString(5, al.getAccountLedger());
			cs.setString(6, al.getLedgerDesc());
			cs.setInt(7, al.getGroupId());
			cs.setDouble(8, al.getOpeningBal());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.AccountLedger;
import com.prov.db.OracleConnection;

public class AddAccountLedger {
	
public int addAccountLedger(AccountLedger al) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addAccountLedger = "{ ? = call ADD_ACCOUNTLEDGER(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date date=Date.valueOf(al.getLedgerDate());			
			cs = con.prepareCall(addAccountLedger);
			
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
			
			System.out.println("Insertion Succesful - "+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

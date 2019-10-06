package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.AccountName;
import com.prov.db.OracleConnection;

public class AddAccountName {
	
	public int addAccountName(AccountName an) {

		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addAccName = "{ ? = call ADD_ACC_NAME(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addAccName);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(an.getLedgerDate());	
			
			cs.setInt(2, an.getAccCategoryId());
			cs.setString(3, an.getAccountLedger());
			cs.setString(4, an.getLedgerDesc());
			cs.setDate(5, date);
			cs.setInt(6, an.getCompanyId());
			if(an.getBankId() == 0) {
				cs.setNull(7, Types.NUMERIC);
			}else {
				cs.setInt(7, an.getBankId());
			}
			cs.setDouble(8, an.getOpeningBal());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			an.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful--"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}
}


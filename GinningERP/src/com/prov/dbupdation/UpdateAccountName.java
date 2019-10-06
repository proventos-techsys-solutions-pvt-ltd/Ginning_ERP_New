package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.AccountName;
import com.prov.db.OracleConnection;

public class UpdateAccountName {
	
	public int updateAccountName(AccountName an)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCustomer = "{ ? = call UPDATE_ACC_NAME(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCustomer);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(an.getLedgerDate());	
		
			cs.setInt(2, an.getAccountId());
			cs.setInt(3, an.getAccCategoryId());
			cs.setString(4, an.getAccountLedger());
			cs.setString(5, an.getLedgerDesc());
			cs.setDate(6, date);
			cs.setInt(7, an.getCompanyId());
			if(an.getBankId() == 0) {
				cs.setNull(8, Types.NUMERIC);
			}else {
				cs.setInt(8, an.getBankId());
			}
			cs.setDouble(9, an.getOpeningBal());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			an.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

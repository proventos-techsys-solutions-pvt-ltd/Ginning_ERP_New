package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import com.prov.bean.AccountName;
import com.prov.db.OracleConnection;

public class AddAccountName {
	
	public int addAccountName(AccountName a)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		
		
		
		String addAccountName = "{ ? = call ADD_ACCOUNT_NAME(?,?,?) }";
		CallableStatement cs;
		try {
			
			
			cs = con.prepareCall(addAccountName);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, a.getCompanyId());
			cs.setInt(3, a.getAccountCategoryId());
			cs.setString(4,a.getAccountName());
			
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			a.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

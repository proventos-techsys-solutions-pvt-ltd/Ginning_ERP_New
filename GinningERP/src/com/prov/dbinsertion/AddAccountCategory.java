package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.AccountCategory;
import com.prov.db.OracleConnection;

public class AddAccountCategory {
	
	public int addAccountCategory(AccountCategory a)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		
		
		
		String addAccountCategory = "{ ? = call ADD_ACCOUNT_CATEGORY(?,?,?) }";
		CallableStatement cs;
		try {
			
			
			cs = con.prepareCall(addAccountCategory);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, a.getCompanyId());
			cs.setString(3, a.getAccountCategory());
			cs.setString(4,a.getItemOf());
			
			
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

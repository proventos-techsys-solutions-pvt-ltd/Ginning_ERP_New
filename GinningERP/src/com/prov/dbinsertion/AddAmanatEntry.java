package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;

import com.prov.bean.Amanat;
import com.prov.db.OracleConnection;

public class AddAmanatEntry {
	
public int addAmanat(Amanat a) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addAmanat = "{ ? = call ADD_AMANAT(?,?,?,?) }";
		CallableStatement cs;
		try {
			
			System.out.println(a.getAmanatDate());
			
			java.sql.Date amanatSqlDate = java.sql.Date.valueOf(a.getAmanatDate());
			
			cs = con.prepareCall(addAmanat);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, a.getGradeId());
			cs.setInt(3, a.getCustomerId());
			cs.setDate(4, amanatSqlDate);
			cs.setDouble(5, a.getFinalRate());
			
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

package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

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

		String addAmanat = "{ ? = call ADD_AMANAT(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date amanatDate = new SimpleDateFormat("yyyy-MM-dd").parse(a.getAmanatDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date amanatSqlDate = new java.sql.Date(amanatDate.getDate());
			
			Date expiryDate = new SimpleDateFormat("yyyy-MM-dd").parse(a.getDateOfExpiry());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date expirySqlDate = new java.sql.Date(expiryDate.getDate());
			
			cs = con.prepareCall(addAmanat);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, a.getRst() );
			cs.setInt(3, a.getCid() );
			cs.setInt(4, a.getVid());
			cs.setDouble(5, a.getContractRate());
			cs.setDouble(6, a.getTotal());
			cs.setDate(7, amanatSqlDate);
			cs.setDate(8, expirySqlDate);
			cs.setDouble(9, a.getFinalRate());
			
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

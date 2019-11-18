package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.Amanat;
import com.prov.db.OracleConnection;

public class UpdateAmanat {
	
public int updateAmanat(Amanat a) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateInvoice = "{ ? = call UPDATE_AMANAT(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date amanatDate = new SimpleDateFormat("yyyy-MM-dd").parse(a.getAmanatDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date invSqlDate = new java.sql.Date(amanatDate.getDate());
			
			cs = con.prepareCall(updateInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, a.getId());
			cs.setInt(3, a.getGradeId());
			cs.setInt(4, a.getCustomerId());
			cs.setDate(5, invSqlDate);
			cs.setDouble(6, a.getFinalRate());	
			cs.setInt(7, a.getRst());	
			cs.setDouble(8, a.getDifference());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			a.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Successful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
		
	}


public int setFinalRate(Amanat a) {
	
	Connection con = null;
	try {
		con = OracleConnection.getConnection();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	String updateInvoice = "UPDATE AMANAT_MAST SET FINAL_RATE = ?"
							+ "WHERE GRADE_ID=?";
	PreparedStatement stmt;
	try {
		
		stmt = con.prepareCall(updateInvoice);
		
		stmt.setDouble(1, a.getFinalRate());
		stmt.setInt(2, a.getId());
		
		stmt.executeUpdate();
		
		
		stmt.close();
		con.close();
		
		System.out.println("Updation Succesful-"+a.getId());
		} catch (Exception e) {
		e.printStackTrace();
	}
	
	return a.getId();
	
}

}

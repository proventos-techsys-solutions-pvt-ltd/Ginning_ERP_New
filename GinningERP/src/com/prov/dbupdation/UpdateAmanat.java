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

		String updateInvoice = "{ ? = call UPDATE_AMANAT(?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date amanatDate = new SimpleDateFormat("yyyy-MM-dd").parse(a.getAmanatDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date invSqlDate = new java.sql.Date(amanatDate.getDate());
			
			Date expiryDate = new SimpleDateFormat("yyyy-MM-dd").parse(a.getDateOfExpiry());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date expirySqlDate = new java.sql.Date(expiryDate.getDate());
			
			
			cs = con.prepareCall(updateInvoice);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, a.getId());
			cs.setInt(3, a.getRst() );
			cs.setInt(4, a.getCid());
			cs.setInt(5, a.getVid());
			cs.setDouble(6, a.getContractRate());
			cs.setDouble(7, a.getTotal());
			cs.setDate(8, invSqlDate);
			cs.setDate(9, expirySqlDate);
			cs.setDouble(10, a.getFinalRate());
			cs.setInt(11, a.getInvId());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			a.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
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
							+ "WHERE ID=?";
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

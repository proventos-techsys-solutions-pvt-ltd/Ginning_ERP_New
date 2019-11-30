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
	int rows = 0;
	Connection con = null;
	try {
		con = OracleConnection.getConnection();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	System.out.println(a.toString());

	String updateInvoice = "UPDATE AMANAT_MAST\r\n" + 
							"SET\r\n" + 
							"    FINAL_RATE = ?,\r\n" + 
							"    INVOICED_QTY = ?\r\n" + 
							"WHERE\r\n" + 
							"    GRADE_ID = ?";
	PreparedStatement stmt;
	try {
		
		stmt = con.prepareStatement(updateInvoice);
		
		stmt.setDouble(1, a.getFinalRate());
		stmt.setLong(2, a.getInvoicedQty());
		stmt.setInt(3, a.getGradeId());
		
		
		rows = stmt.executeUpdate();
		
		
		stmt.close();
		con.close();
		
		System.out.println("Updation Succesful-"+rows);
		} catch (Exception e) {
		e.printStackTrace();
	}
	
	return a.getId();
	
}

}

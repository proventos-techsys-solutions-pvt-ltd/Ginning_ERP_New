package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GeneralLedger;
import com.prov.db.OracleConnection;

public class UpdateGeneralLedger {
	
	public int updateGeneralLedger(GeneralLedger gl)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCustomer = "{ ? = call UPDATE_GENERALLEDGER(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCustomer);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(gl.getGlDate());	
		
			cs.setInt(1, gl.getId());
			cs.setInt(2, gl.getAccNameId());
			cs.setDate(3, date);
			cs.setDouble(4, gl.getOpeningBal());
			cs.setDouble(5, gl.getDebit());
			cs.setDouble(6, gl.getCredit());
			cs.setDouble(7, gl.getClosingBal());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			gl.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	
	public int updateOpeningBal(double openingBal, int id)
	{
		Connection con = null;
		int rowsUpdated = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateOpeningBal = "UPDATE GENERAL_LEDGER SET OPENING_BAL = ? WHERE account_id=?";
		PreparedStatement stmt;
		try {

			stmt = con.prepareStatement(updateOpeningBal);
			
			stmt.setDouble(1, openingBal);
			stmt.setInt(2, id);
			
			rowsUpdated = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful-"+rowsUpdated);
			
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowsUpdated;
	}
}

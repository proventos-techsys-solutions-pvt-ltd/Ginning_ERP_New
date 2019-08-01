package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GeneralLedger;
import com.prov.db.OracleConnection;

public class UpdateGeneralLedger {
	
	public int updateCustomer(GeneralLedger gl)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCustomer = "{ ? = call UPDATE_GENERALLEDGER(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateCustomer);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(gl.getGlDate());	
		
			cs.setInt(2, gl.getId());
			cs.setInt(3, gl.getVoucherNo());
			cs.setInt(4,  gl.getAccountId());
			cs.setDate(5, date);
			cs.setInt(6,  gl.getMonthId());
			cs.setDouble(7, gl.getOpeningBal());
			cs.setDouble(8, gl.getDebit());
			cs.setDouble(9, gl.getCredit());
			
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
	

}

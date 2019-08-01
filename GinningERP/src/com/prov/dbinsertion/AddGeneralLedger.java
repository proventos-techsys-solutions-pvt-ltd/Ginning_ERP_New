package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GeneralLedger;
import com.prov.db.OracleConnection;

public class AddGeneralLedger {
	
public int addGeneralLedger(GeneralLedger gl) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addGeneralLedger = "{ ? = call ADD_GENERALLEDGER(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addGeneralLedger);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(gl.getGlDate());	
			
			cs.setInt(2, gl.getVoucherNo());
			cs.setInt(3,  gl.getAccountId());
			cs.setDate(4, date);
			cs.setInt(5,  gl.getMonthId());
			cs.setDouble(6, gl.getOpeningBal());
			cs.setDouble(7, gl.getDebit());
			cs.setDouble(8, gl.getCredit());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			gl.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}

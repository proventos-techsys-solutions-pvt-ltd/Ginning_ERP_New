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

		String addGeneralLedger = "{ ? = call ADD_GENERALLEDGER(?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addGeneralLedger);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			Date date=Date.valueOf(gl.getGlDate());	
			
			cs.setInt(2, gl.getVoucherNo());
			cs.setInt(3, gl.getAccountCatId());
			cs.setString(4, gl.getAccountLedger());
			cs.setString(5, gl.getLedgerDesc());
			cs.setDate(6, date);
			cs.setDouble(7, gl.getOpeningBal());
			cs.setDouble(8, gl.getDebit());
			cs.setDouble(9, gl.getCredit());
			cs.setDouble(10, gl.getClosingBal());
			cs.setInt(11, gl.getCompanyId());
			cs.setInt(12, gl.getBankId());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			gl.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful--"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}

package com.prov.delete;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.db.OracleConnection;

public class DeleteBankReco {
	
	public int deleteBankRecoEntry(int bankId, int companyId, String startDate) {
			
			int returnId = 0;
			Connection con = null;
			try {
				con = OracleConnection.getConnection();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	
			String deleteSql = "{ ? = call DELETE_BANK_RECO(?,?,?) }";
			CallableStatement cs;
			try {
				cs = con.prepareCall(deleteSql);
				
				Date dateSql = Date.valueOf(startDate);
				
				cs.registerOutParameter(1, Types.NUMERIC);
				cs.setDate(2, dateSql);
				cs.setInt(3, bankId);
				cs.setInt(4, companyId);
				
				cs.executeUpdate();
				
				returnId =  cs.getInt(1);
				
				cs.close();
				con.close();
				
				System.out.println("Deletion Succesful-"+returnId);
				} catch (SQLException e) {
					e.printStackTrace();
					return 0;
			}
			
			return returnId;
		}
}

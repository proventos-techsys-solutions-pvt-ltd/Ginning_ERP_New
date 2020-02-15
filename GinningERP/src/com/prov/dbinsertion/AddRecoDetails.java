package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;

import com.prov.bean.RecoDetails;
import com.prov.db.OracleConnection;

public class AddRecoDetails {
	
		public int addRecoDetails(RecoDetails rd) {
			
			Connection con = null;
			int id = 0;
			try {
				con = OracleConnection.getConnection();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		
			String addBankRecoMaster = "{ ? = call ADD ADD_RECO_DETAILS(?,?,?) }";
			CallableStatement cs;
			try {
				
				cs = con.prepareCall(addBankRecoMaster);
				
				cs.registerOutParameter(1, Types.NUMERIC);
				
				cs.setLong(2, rd.getRecoId());
				cs.setLong(3, rd.getVoucherNo());
				cs.setLong(4, rd.getTransactionId());
				
				
				cs.executeUpdate();
				
				id = cs.getInt(1);
				
				rd.setId(id);
				
				cs.close();
				con.close();
				
				System.out.println("Insertion Succesful-"+id);
				} catch (Exception e) {
				e.printStackTrace();
			}
			
			return id;
		}
}
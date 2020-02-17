package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.BankRecoMaster;
import com.prov.db.OracleConnection;

public class AddBankRecoMaster {
	
	public int addBankRecoMaster(BankRecoMaster br) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String addBankRecoMaster = "{ ? = call ADD_BANK_RECO_MASTER(?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			String date = br.getDate();
			Date sqlDate=Date.valueOf(date);
			
			cs = con.prepareCall(addBankRecoMaster);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setDate(2, sqlDate);
			cs.setDouble(3, br.getClosingBalLedger() );
			cs.setDouble(4, br.getClosingBalBank());
			cs.setLong(5, br.getCompanyId());
			cs.setLong(6, br.getBankId());
			cs.setLong(7, br.getBankGlId());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			br.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}
}


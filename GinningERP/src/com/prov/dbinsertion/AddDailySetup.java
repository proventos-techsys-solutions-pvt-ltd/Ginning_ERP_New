package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;

import com.prov.bean.DailySetup;
import com.prov.db.OracleConnection;

public class AddDailySetup {
	
	public int addDailySetup(DailySetup ds) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String addCustomerVehicle = "{ ? = call DAILY_SETUP_ENTRY(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
	
			cs = con.prepareCall(addCustomerVehicle);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, ds.getSetupDate() );
			cs.setString(3, ds.getCottonHeap() );
			cs.setInt(4, ds.getCompanyId());
			cs.setInt(5, ds.getBankId());
			cs.setString(6, ds.getFirstChequeNo());
			cs.setString(7, ds.getLastChequeNo());
			cs.setInt(8, ds.getTotalCheques());
			cs.setFloat(9, ds.getBonusAmount());
			cs.setNull(10, java.sql.Types.DATE);
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			ds.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful - "+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
}


}

package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Types;

import com.prov.bean.PurchaseRate;
import com.prov.db.OracleConnection;

public class AddPurchaseRate {
	
public int addPurchaseRate(PurchaseRate pr) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addPurchaseRate = "{ ? = call ADD_PURCHASE_RATE(?,?,?) }";
		CallableStatement cs;
		try {
			
			Date purchaseSqlDate=Date.valueOf(pr.getpDate());
			
			cs = con.prepareCall(addPurchaseRate);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setDate(2, purchaseSqlDate);
			cs.setInt(3, pr.getCompanyId());
			cs.setDouble(4, pr.getRate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			pr.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

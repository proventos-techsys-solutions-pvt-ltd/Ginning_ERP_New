package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.PurchaseRate;
import com.prov.db.OracleConnection;

public class UpdatePurchaseRate {
	

	public int updatePurchaseRate(PurchaseRate pr)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updatePurchaseRate = "{ ? = call UPDATE_PURCHASE_RATE(?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date purchaseDate = new SimpleDateFormat("yyyy-MM-dd").parse(pr.getpDate());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date purchaseSqlDate = new java.sql.Date(purchaseDate.getDate());
			
			cs = con.prepareCall(updatePurchaseRate);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, pr.getId() );
			cs.setDate(3, purchaseSqlDate);
			cs.setInt(4, pr.getCompanyId());
			cs.setDouble(5, pr.getRate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			pr.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.StockDetails;
import com.prov.db.OracleConnection;

public class UpdateStockDetails {
	
	public int updateStockDetails(StockDetails sd)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String UpdateStockDetails = "{ ? = call UPDATE_STOCKDETAILS(?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(UpdateStockDetails);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, sd.getId() );
			cs.setInt(3, sd.getInvId());
			cs.setDouble(4, sd.getTotalQuantity() );
			cs.setDouble(5, sd.getAverageRate());
			cs.setInt(6, sd.getStockMastId());
			cs.setInt(7, sd.getCompanyId());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			sd.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	

}

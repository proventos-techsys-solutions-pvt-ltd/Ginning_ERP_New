package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.StockDetails;
import com.prov.db.OracleConnection;

public class AddStockDetails {
	
public int addStockDetails(StockDetails sd) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addStockDetails = "{ ? = call ADD_STOCKDETAILS(?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addStockDetails);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, sd.getInvId());
			cs.setDouble(3, sd.getTotalQuantity() );
			cs.setDouble(4, sd.getAverageRate());
			cs.setInt(5, sd.getStockMastId());
			cs.setInt(6, sd.getCompanyId());

			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			sd.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

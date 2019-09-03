package com.prov.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class DeleteVehicleRates {
	
	public int deleteVehicleRates(int vehicleId) {
			
			Connection con = null;
			try {
				con = OracleConnection.getConnection();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	
			String deleteSql = "DELETE WEIGH_RATE_MAST WHERE ID=?";
			PreparedStatement stmt;
			try {
				stmt = con.prepareStatement(deleteSql);
				
				stmt.setInt(1, vehicleId);
				
				stmt.executeUpdate();
				
				stmt.close();
				con.close();
				
				System.out.println("Deletion Succesful-"+vehicleId);
				} catch (SQLException e) {
				return 0;
			}
			
			return vehicleId;
			
		}

}

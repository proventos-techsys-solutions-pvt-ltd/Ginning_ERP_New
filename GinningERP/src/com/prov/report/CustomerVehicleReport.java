package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.bean.CustomerVehicle;
import com.prov.db.OracleConnection;

public class CustomerVehicleReport {
	
	public CustomerVehicle getReport(int id)
	{
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		CustomerVehicle cv = new CustomerVehicle();;
		
		try {
			
			con = OracleConnection.getConnection();
			
			String vehicleSql = "SELECT * FROM CUSTOMER_VEHICLE_MAST WHERE ID="+id;
			
			stmt = con.prepareStatement(vehicleSql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				cv.setId(rs.getInt(1));
				cv.setCid(rs.getInt(2));
				cv.setVehicleNo(rs.getString(3));
				cv.setVehicleType(rs.getString(4));
				cv.setRst(rs.getInt(5));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();		
		}
		
		return cv;
	}

}

package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;

import com.prov.bean.CustomerVehicle;
import com.prov.db.OracleConnection;

public class UpdateCustomerVehicle {
	
	public int updateCustomerVehicle(CustomerVehicle cv)
	{
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCustomerVehicle = "{ ? = call UPDATE_CUSTOMERVEHICLE(?,?,?,?) }";
		CallableStatement cs;
		try {

			cs = con.prepareCall(updateCustomerVehicle);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, cv.getId() );
			cs.setInt(3, cv.getCid() );
			cs.setString(4, cv.getVehicleNo() );
			cs.setInt(5, cv.getRst());
			cs.setInt(6, cv.getvTypeId());
			cs.setDouble(7, cv.getWeighRate());
			
			
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			cv.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}
	
	public int updateCustomerVehicle(String frontImage, String rearImage, int weighmentId)
	{
		Connection con = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateCustomerVehicle = "UPDATE CUSTOMER_VEHILCE_MAST\r\n" + 
										"SET\r\n" + 
										"    FRONT_TARE_IMG = ?,\r\n" + 
										"    REAR_TARE_IMG = ?\r\n" + 
										"WHERE\r\n" + 
										"    ID = (\r\n" + 
										"        SELECT\r\n" + 
										"            VID\r\n" + 
										"        FROM\r\n" + 
										"            WEIGH_MAST\r\n" + 
										"        WHERE\r\n" + 
										"            ID = ?\r\n" + 
										"    )";
		PreparedStatement stmt;
		try {

			stmt = con.prepareStatement(updateCustomerVehicle);
			
			stmt.setString(2, frontImage );
			stmt.setString(3, rearImage );
			stmt.setInt(4,weighmentId );
			
			
			rowCount = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful-"+rowCount);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowCount;
	}

}

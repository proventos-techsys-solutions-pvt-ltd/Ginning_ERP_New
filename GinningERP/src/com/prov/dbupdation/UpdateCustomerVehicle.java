package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
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
			cs.setString(5, cv.getVehicleType());
			
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

}

package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;

import com.prov.bean.CustomerVehicle;
import com.prov.db.OracleConnection;

public class AddCustomerVehicle {
	
public int addCustomerVehicle(CustomerVehicle cv) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addCustomerVehicle = "{ ? = call ADD_CUSTOMERVEHICLE(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try { 

			cs = con.prepareCall(addCustomerVehicle);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, cv.getCid() );
			cs.setString(3, cv.getVehicleNo() );
			cs.setInt(4, cv.getRst());
			cs.setInt(5, cv.getvTypeId());
			cs.setDouble(6, cv.getWeighRate());
			cs.setString(7, cv.getFrontImage());
			cs.setString(8, cv.getRearImage());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			cv.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful-"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}



}

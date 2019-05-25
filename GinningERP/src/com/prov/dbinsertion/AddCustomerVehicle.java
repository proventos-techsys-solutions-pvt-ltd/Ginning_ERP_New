package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

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

		String addCustomerVehicle = "{ ? = call ADD_VEHICLE(?,?,?,?,?) }";
		CallableStatement cs;
		try {

			Date grossTime = new SimpleDateFormat("yyyy-MM-dd").parse(cv.getGrossWtTime());
			@SuppressWarnings({ "unused", "deprecation" })
			java.sql.Date grossSqlTime = new java.sql.Date(grossTime.getDate());
			
			Date tareTime = new SimpleDateFormat("yyyy-MM-dd").parse(cv.getTareWtTime());
			@SuppressWarnings({ "unused", "deprecation" })
			java.sql.Date tareSqlTime = new java.sql.Date(tareTime.getDate());
			
			cs = con.prepareCall(addCustomerVehicle);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, cv.getCid() );
			cs.setString(3, cv.getVehicleNo() );
			cs.setString(4, cv.getVehicleType());
			cs.setDate(5, grossSqlTime);
			cs.setDate(6, tareSqlTime);
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			cv.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}



}

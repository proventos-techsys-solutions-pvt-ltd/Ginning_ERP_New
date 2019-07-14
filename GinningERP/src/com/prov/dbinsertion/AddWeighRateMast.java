package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.WeighRateMast;
import com.prov.db.OracleConnection;

public class AddWeighRateMast {

public int addWeighRateMast(WeighRateMast wrm) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addWeighRateMast = "{ ? = call ADD_WEIGHRATEMAST(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addWeighRateMast);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, wrm.getVehicleName() );
			cs.setString(3, wrm.getVehicleDesc() );
			cs.setDouble(4, wrm.getWeighrate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			wrm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}


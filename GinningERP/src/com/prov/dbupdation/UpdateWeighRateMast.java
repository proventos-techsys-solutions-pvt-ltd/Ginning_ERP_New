package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.WeighRateMast;
import com.prov.db.OracleConnection;

public class UpdateWeighRateMast {

	public int updateWeighRateMast(WeighRateMast wrm)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateWeighRateMast = "{ ? = call UPDATE_WEIGHRATEMAST(?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateWeighRateMast);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, wrm.getId() );
			cs.setString(3, wrm.getVehicle_name());
			cs.setString(4, wrm.getVehcile_Desc() );
			cs.setDouble(5, wrm.getWeighrate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			wrm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
}


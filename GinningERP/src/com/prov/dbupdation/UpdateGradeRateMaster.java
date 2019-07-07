package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GradeRateMaster;
import com.prov.db.OracleConnection;

public class UpdateGradeRateMaster {

	public int updateGradeRateMaster(GradeRateMaster grm)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateGradeRateMaster = "{ ? = call UPDATE_GRADERATEMASTER(?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateGradeRateMaster);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, grm.getId() );
			cs.setString(3, grm.getRateDate() );
			cs.setString(4, grm.getGradeID());
			cs.setDouble(5, grm.getRate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			grm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	
}

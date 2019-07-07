package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GradeMaster;
import com.prov.db.OracleConnection;

public class UpdateGradeMaster {

	public int updateGradeMaster(GradeMaster gm)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateGradeMaster = "{ ? = call UPDATE_GRADEMASTER(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateGradeMaster);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, gm.getId() );
			cs.setString(3, gm.getGrade());
			cs.setString(4, gm.getDesc());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			gm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
}

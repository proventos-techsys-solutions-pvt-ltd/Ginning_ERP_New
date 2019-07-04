package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GradeDetails;
import com.prov.db.OracleConnection;

public class UpdateGradeDetails {

	public int updateGradeDetails(GradeDetails gd)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateGradeDetails = "{ ? = call UPDATE_GRADEDETAILS(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateGradeDetails);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, gd.getId() );
			cs.setInt(3, gd.getWeighmentId() );
			cs.setInt(4, gd.getRst() );
			cs.setString(5, gd.getMaterial());
			cs.setDouble(6, gd.getQuantity());
			cs.setString(7, gd.getGrade());
			cs.setDouble(8, gd.getRate());
			cs.setString(9, gd.getAuthorizedBy());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			gd.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
}
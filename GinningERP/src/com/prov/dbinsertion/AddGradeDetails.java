package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GradeDetails;
import com.prov.db.OracleConnection;

public class AddGradeDetails {
	
public int addGradeDetails(GradeDetails gd) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addGradeDetails = "{ ? = call ADD_GRADEDETAILS(?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addGradeDetails);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, gd.getWeighmentId() );
			cs.setInt(3, gd.getRst() );
			cs.setString(4, gd.getMaterial());
			cs.setDouble(5, gd.getQuantity());
			cs.setString(6, gd.getGrade());
			cs.setDouble(7, gd.getRate());
			cs.setString(8, gd.getAuthorizedBy());
			cs.setDouble(9, gd.getMoisture());

			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			gd.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}

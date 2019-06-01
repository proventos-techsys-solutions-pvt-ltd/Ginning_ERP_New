package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.prov.db.OracleConnection;

public class Grading {
	
	public void setGrading(String grade, float rate, int rst) {
		
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateWeighMast = "{ UPDATE WEIGH_MAST SET GRADE = ?, GRADER_RATE=? WHERE RST=? }";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateWeighMast);
			
			stmt.setString(1, grade );
			stmt.setFloat(2, rate);
			stmt.setInt(3, rst);
			
			
			int flag = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			if(flag == 1) {
				System.out.println("Grading Succesful-"+rst);
			}else {
				System.out.println("Grading Failed-"+rst);
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

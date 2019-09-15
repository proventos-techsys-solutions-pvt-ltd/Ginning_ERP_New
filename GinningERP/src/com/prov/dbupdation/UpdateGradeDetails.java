package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
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

		String updateGradeDetails = "{ ? = call UPDATE_GRADEDETAILS(?,?,?,?,?,?,?,?,?,?,?,?,?) }";
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
			cs.setDouble(10, gd.getMoisture());
			cs.setFloat(11, gd.getBonusPerQtl());
			cs.setDouble(12, gd.getPdcBonusAmount());
			if(gd.getPdcDate().equals(null)) {
				cs.setNull(13, Types.DATE);
			}else if(!(gd.getPdcDate().equals(null))){
				Date pdcDate = Date.valueOf(gd.getPdcDate());
				cs.setDate(13, pdcDate);
			}
			cs.setString(14, gd.getModeOfPayment());
			
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
	
	public int updateRatesInGradeDetails(GradeDetails gd)
	{
		Connection con = null;
		int rowCount = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateGradeDetails = "UPDATE GRADE_DETAILS SET\r\n" + 
				"RATE = ?\r\n" + 
				"WHERE RST=?\r\n" + 
				"AND ID=?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(updateGradeDetails);
			
			stmt.setDouble(1, gd.getRate());
			stmt.setInt(2, gd.getRst());
			stmt.setInt(3, gd.getId());
			
			rowCount = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			System.out.println("Updation Succesful-"+rowCount);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}
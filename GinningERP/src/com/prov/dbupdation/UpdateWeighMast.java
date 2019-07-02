package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.prov.bean.WeighMast;
import com.prov.db.OracleConnection;

public class UpdateWeighMast {
	
public int updateWeighMast(WeighMast wm) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateWeighMast = "{ ? = call UPDATE_WEIGHMAST(?,?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date sqlGrossWtTime = new SimpleDateFormat("yyyy-MM-dd").parse(wm.getGrossWtTime());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date grossSqlDate = new java.sql.Date(sqlGrossWtTime.getDate());
			
			Date sqlTareWtTime = new SimpleDateFormat("yyyy-MM-dd").parse(wm.getTareWtTime());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date tareSqlDate = new java.sql.Date(sqlTareWtTime.getDate());
			
			
			cs = con.prepareCall(updateWeighMast);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, wm.getRst());
			cs.setInt(3, wm.getCid());
			cs.setInt(4, wm.getVid());
			cs.setString(5, wm.getMaterial());
			cs.setFloat(6, wm.getWeighRate());
			cs.setFloat(7, wm.getGross());
			cs.setFloat(8, wm.getTare());
			cs.setFloat(9, wm.getNet());
			cs.setString(10, wm.getGrade());
			cs.setFloat(11, wm.getGraderRate());
			cs.setDate(12, grossSqlDate);
			cs.setDate(13, tareSqlDate);
			cs.setFloat(14, wm.getMoisture());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			wm.setRst(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

public int secondWeighment(WeighMast wm) {
	
	int row=0;
	Connection con = null;
	try {
		con = OracleConnection.getConnection();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	String updateWeighMast = "UPDATE WEIGH_MAST SET TARE=?,"
			+ "NET=?,"
			+ "TAREWT_TIME=?"
			+ "WHERE RST=?";
	PreparedStatement stmt;
	try {
		
		
		Date sqlTareWtTime = new SimpleDateFormat("yyyy-MM-dd").parse(wm.getTareWtTime());
		@SuppressWarnings({ "deprecation" })
		java.sql.Date tareSqlDate = new java.sql.Date(sqlTareWtTime.getDate());
		
		
		stmt = con.prepareCall(updateWeighMast);
		
		stmt.setFloat(1, wm.getTare());
		stmt.setFloat(2, wm.getNet());
		stmt.setDate(3, tareSqlDate);
		stmt.setInt(4, wm.getRst());
		
		row = stmt.executeUpdate();
		
		stmt.close();
		con.close();
		
		System.out.println("Updation Succesful"+row);
		} catch (Exception e) {
		e.printStackTrace();
	}
	
	return row;
	
}

}

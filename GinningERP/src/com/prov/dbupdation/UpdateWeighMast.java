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
	
			String updateWeighMast = "{ ? = call UPDATE_WEIGHMAST(?,?,?,?,?,?,?,?,?,?,?) }";
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
				
				cs.setInt(2, wm.getId());
				cs.setInt(3, wm.getRst());
				cs.setInt(4, wm.getVid());
				cs.setString(5, wm.getMaterial());
				cs.setFloat(6, wm.getGross());
				cs.setFloat(7, wm.getTare());
				cs.setFloat(8, wm.getNet());
				cs.setDate(9, grossSqlDate);
				cs.setDate(10, tareSqlDate);
				cs.setString(11, wm.getWeighmentDate());
				cs.setInt(11, wm.getDsId());
				
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
			
			stmt = con.prepareStatement(updateWeighMast);
			
			stmt.setFloat(1, wm.getTare());
			stmt.setFloat(2, wm.getNet());
			stmt.setString(3, wm.getTareWtTime());
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
	
	public int resetTareWt(int rst) {

		int row=0;
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String updateWeighMast = "UPDATE WEIGH_MAST SET TARE=0,"
								+ "NET=0"
								+ "WHERE RST=?";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateWeighMast);
			
			stmt.setInt(1, rst);
			
			row = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful--"+row);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public int resetGrossWt(int rst) {

		int row=0;
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
		String updateWeighMast = "UPDATE WEIGH_MAST SET GROSS=0"
								+ "WHERE RST=?";
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateWeighMast);
			
			stmt.setInt(1, rst);
			
			row = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Updation Succesful--"+row);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

}

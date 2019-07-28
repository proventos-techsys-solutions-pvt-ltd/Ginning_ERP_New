package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Types;

import com.prov.bean.WeighMast;
import com.prov.db.OracleConnection;

public class AddWeighMast {
	
public int addWeighMast(WeighMast wm) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addWeighMast = "{ ? = call ADD_WEIGH(?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date sqlWeighmentDate=Date.valueOf(wm.getWeighmentDate());

			cs = con.prepareCall(addWeighMast);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, wm.getRst());
			cs.setInt(3, wm.getVid());
			cs.setString(4, wm.getMaterial());
			cs.setFloat(5, wm.getGross());
			cs.setFloat(6, wm.getTare());
			cs.setFloat(7, wm.getNet());
			cs.setString(8, wm.getGrossWtTime());
			cs.setString(9, wm.getTareWtTime());
			cs.setDate(10, sqlWeighmentDate);
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			wm.setRst(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

	public int addSecondWeighment(WeighMast wm) {
		Connection con = null;
		int flag= 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateWeighMast = " UPDATE WEIGH_MAST SET TARE = ?,"
							+ " SET NET = ?"
							+ " SET TAREWT_TIME = ?"
							+ "WHERE RST = ?";
		
		PreparedStatement stmt;
		try {
			
			stmt = con.prepareStatement(updateWeighMast);
			
			
			stmt.setFloat(2, wm.getTare());
			stmt.setFloat(3, wm.getNet());
			stmt.setString(4, wm.getTareWtTime());
			stmt.setInt(5, wm.getRst());

			
			flag = stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			if(flag == 1) {
				System.out.println("Updation Succesful"+flag);
			}
			else {
				System.out.println("Updation Failed"+flag);
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}


}

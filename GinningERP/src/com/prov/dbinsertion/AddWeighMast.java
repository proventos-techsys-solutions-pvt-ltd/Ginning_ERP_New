package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
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

		String addWeighMast = "{ ? = call ADDWEIGH(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addWeighMast);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, wm.getCid());
			cs.setInt(3, wm.getVid());
			cs.setString(4, wm.getMaterial());
			cs.setInt(5, wm.getWeighrate());
			cs.setInt(6, wm.getGross());
			cs.setInt(7, wm.getTare());
			cs.setInt(8, wm.getNet());
			cs.setString(9, wm.getGrade());
			cs.setInt(10, wm.getGraderrate());
			cs.setString(11, wm.getGrosswttime());
			cs.setString(12, wm.getTarewttime());

			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			wm.setRst(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}

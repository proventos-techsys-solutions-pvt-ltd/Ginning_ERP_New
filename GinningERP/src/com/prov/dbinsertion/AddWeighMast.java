package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

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

		String addWeighMast = "{ ? = call ADD_WEIGH(?,?,?,?,?,?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			
			Date sqlGrossWtTime = new SimpleDateFormat("yyyy-MM-dd").parse(wm.getGrossWtTime());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date grossSqlDate = new java.sql.Date(sqlGrossWtTime.getDate());
			
			Date sqlTareWtTime = new SimpleDateFormat("yyyy-MM-dd").parse(wm.getTareWtTime());
			@SuppressWarnings({ "deprecation" })
			java.sql.Date tareSqlDate = new java.sql.Date(sqlTareWtTime.getDate());
			
			cs = con.prepareCall(addWeighMast);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, wm.getRst());
			cs.setInt(3, wm.getCid());
			cs.setInt(4, wm.getVid());
			cs.setString(5, wm.getMaterial());
			cs.setInt(6, wm.getWeighRate());
			cs.setFloat(7, wm.getGross());
			cs.setFloat(8, wm.getTare());
			cs.setFloat(9, wm.getNet());
			cs.setString(10, wm.getGrade());
			cs.setFloat(11, wm.getGradeRate());
			cs.setDate(12, grossSqlDate);
			cs.setDate(13, tareSqlDate);

			
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


}

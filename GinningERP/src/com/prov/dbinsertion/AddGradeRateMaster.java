package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GradeRateMaster;
import com.prov.db.OracleConnection;

public class AddGradeRateMaster {
public int addGradeRateMaster(GradeRateMaster grm) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addGradeRateMaster = "{ ? = call ADD_GRADERATEMASTER(?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addGradeRateMaster);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, grm.getRateDate() );
			cs.setString(3, grm.getGradeID() );
			cs.setDouble(4, grm.getRate());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			grm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

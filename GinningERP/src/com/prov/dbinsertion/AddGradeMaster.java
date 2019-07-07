package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.GradeMaster;
import com.prov.db.OracleConnection;

public class AddGradeMaster {
	
public int addGradeMaster(GradeMaster gm) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addGradeMaster = "{ ? = call ADD_GRADEMAST(?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addGradeMaster);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setString(2, gm.getGrade());
			cs.setString(3, gm.getDesc());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			gm.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}


}

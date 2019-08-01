package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Year;
import com.prov.db.OracleConnection;

public class AddYear {
	
public int addYear(Year y) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addYear = "{ ? = call ADD_YEAR(?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addYear);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, y.getYear());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			y.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

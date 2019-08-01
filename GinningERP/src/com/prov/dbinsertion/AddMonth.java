package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Month;
import com.prov.db.OracleConnection;

public class AddMonth {

public int addMonth(Month m) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addMonth = "{ ? = call ADD_MONTH(?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addMonth);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, m.getYearId());
			cs.setString(3, m.getMonth());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			m.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

}

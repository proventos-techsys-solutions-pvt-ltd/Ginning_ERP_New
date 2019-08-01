package com.prov.dbupdation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.Year;
import com.prov.db.OracleConnection;

public class UpdateYear {
	
	public int updateMonth(Year y)
	{
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String updateYear = "{ ? = call UPDATE_MONTH(?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(updateYear);
			
			cs.registerOutParameter(1, Types.NUMERIC);
		
			cs.setInt(2, y.getId());
			cs.setInt(3, y.getYear());
			
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			y.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Updation Succesful-"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

}

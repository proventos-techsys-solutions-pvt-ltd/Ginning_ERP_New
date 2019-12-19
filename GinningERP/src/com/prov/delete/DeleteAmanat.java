package com.prov.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class DeleteAmanat {
	
public int deleteAmanat(int id) {
		
		Connection con = null;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String deleteSql = "DELETE AMANAT_MAST WHERE ID=?";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(deleteSql);
			
			stmt.setInt(1, id);
			
			stmt.executeUpdate();
			
			stmt.close();
			con.close();
			
			System.out.println("Deletion Succesful--"+id);
			} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
		return id;
		
	}

}

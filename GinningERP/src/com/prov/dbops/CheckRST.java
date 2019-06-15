package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.db.OracleConnection;

public class CheckRST {
	
	public int checkRstExists(int rst) {
		Connection con = null;
		int flag=0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String checkRst = "SELECT COUNT(*) FROM INVOICE_MAST WHERE RST=?";
		PreparedStatement stmt;
		ResultSet rs=null;
		try {
			
			stmt = con.prepareStatement(checkRst);
			
			stmt.setInt(1, rst );
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				flag=rs.getInt(1);
			}
			
			stmt.close();
			con.close();
			
			if(flag == 1) {
				System.out.println("RST Exists-"+rst);
			}else {
				System.out.println("RST doesn't exists-"+rst);
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}

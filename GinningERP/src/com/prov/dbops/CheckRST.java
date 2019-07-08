package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.prov.db.OracleConnection;

public class CheckRST {
	
	public int checkRstExistsInWeighMast(int rst) {
		Connection con = null;
		int flag=0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String checkRst = "SELECT COUNT(*) FROM WEIGH_MAST WHERE RST=?";
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
	
	
	public int checkRstExistsInGradeDetails(int rst) {
		Connection con = null;
		int flag=0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String checkRst = "SELECT COUNT(*) FROM GRADE_DETAILS WHERE RST=?";
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

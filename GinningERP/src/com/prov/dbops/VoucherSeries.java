package com.prov.dbops;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.prov.db.OracleConnection;

public class VoucherSeries {
	
	public int getVoucherNo() {
		Connection con = null;
		ResultSet rs = null;
		int rst = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String sql = "SELECT NVL(MAX(vouch_no),0)+1 FROM transactions";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery();
			
			while(rs.next()) {
				rst = rs.getInt(1);
			}
			
			stmt.close();
			con.close();	
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rst;
	}

}
